/*
 * READ THIS DESCRIPTION!
 *
 * This is your processor module that will contain the bulk of your code submission. You are to implement
 * a 5-stage pipelined processor in this module, accounting for hazards and implementing bypasses as
 * necessary.
 *
 * Ultimately, your processor will be tested by a master skeleton, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file, Wrapper.v, acts as a small wrapper around your processor for this purpose. Refer to Wrapper.v
 * for more details.
 *
 * As a result, this module will NOT contain the RegFile nor the memory modules. Study the inputs 
 * very carefully - the RegFile-related I/Os are merely signals to be sent to the RegFile instantiated
 * in your Wrapper module. This is the same for your memory elements. 
 *
 *
 */
module procCopy(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for RegFile
    ctrl_writeReg,                  // O: Register to write to in RegFile
    ctrl_readRegA,                  // O: Register to read from port A of RegFile
    ctrl_readRegB,                  // O: Register to read from port B of RegFile
    data_writeReg,                  // O: Data to write to for RegFile
    data_readRegA,                  // I: Data from port A of RegFile
    data_readRegB                   // I: Data from port B of RegFile
	 
	);

	// Control signals
	input clock, reset;
	
	// Imem
    output [31:0] address_imem;
	input [31:0] q_imem;

	// Dmem
	output [31:0] address_dmem, data;
	output wren;
	input [31:0] q_dmem;

	// Regfile
	output ctrl_writeEnable;
	output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_writeReg;
	input [31:0] data_readRegA, data_readRegB;

    wire multDivReady, isMult, isDiv; //nneds to be defined here for syntax reasons
    // ========================================================================================PC CONTROL=========================================================================================================================== //
    wire[31:0] nextPC, PC_plus_1, branchPC; 
    wire isBranch;
    register PC_reg(.clock(clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(nextPC), .out(address_imem));
    mux_2 choosePC(.out(nextPC), .in0(PC_plus_1), .in1(branchPC), .select(isBranch));


    // ========================================================================================FETCH STAGE=================================================================================================================== //

    // Latch instruction from imem
    wire[31:0] fdInstruction, fInstruction;
    mux_2 chooseInstructionFetch(.out(fInstruction), .in0(q_imem), .in1(32'b0), .select(isBranch));
    register FD_Instruction(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(fInstruction), .out(fdInstruction));

    //Latch PC (for branching)
    wire[31:0] fd_branch_PC;
    register FD_branch_PC(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(address_imem), .out(fd_branch_PC));
    // ========================================================================================DECODE STAGE============================================================================================================ //

    //helper wires
    wire d_isStore, d_is_bne, d_is_jr, d_is_blt, choose_rd, d_is_bex;
    assign d_isStore = ~fdInstruction[31] & ~fdInstruction[30] & fdInstruction[29] & fdInstruction[28] & fdInstruction[27];
    assign d_is_bne = ~fdInstruction[31] & ~fdInstruction[30] & ~fdInstruction[29] & fdInstruction[28] & ~fdInstruction[27];
    assign d_is_jr = ~fdInstruction[31] & ~fdInstruction[30] & fdInstruction[29] & ~fdInstruction[28] & ~fdInstruction[27];
    assign d_is_blt = ~fdInstruction[31] & ~fdInstruction[30] & fdInstruction[29] & fdInstruction[28] & ~fdInstruction[27];
    assign d_is_bex = fdInstruction[31] & ~fdInstruction[30] & fdInstruction[29] & fdInstruction[28] & ~fdInstruction[27];
    assign choose_rd = d_isStore | d_is_bne | d_is_jr | d_is_blt;

    // Decode registers and immediate
    assign ctrl_readRegA = fdInstruction[21:17]; //rs
    mux_4_5bit readRegBMux(.out(ctrl_readRegB), .in0(fdInstruction[16:12]), .in1(fdInstruction[26:22]), .in2(5'b11110), .in3(5'b0), .select({d_is_bex, choose_rd})); //rt or rd (only rd if sw, bne, jr, or blt)

    wire[31:0] immediate_ext;
    assign immediate_ext = {{15{fdInstruction[16]}}, fdInstruction[16:0]};

    //Multdiv prep
    wire d_isMult, d_isDiv, d_isALUop;
    assign d_isALUop = ~fdInstruction[31] & ~fdInstruction[30] & ~fdInstruction[29] & ~fdInstruction[28] & ~fdInstruction[27];
    assign d_isMult = d_isALUop & (~fdInstruction[6] & ~fdInstruction[5] & fdInstruction[4] & fdInstruction[3] & ~fdInstruction[2]); //global isMult
    assign d_isDiv = d_isALUop & (~fdInstruction[6] & ~fdInstruction[5] & fdInstruction[4] & fdInstruction[3] & fdInstruction[2]); //global isDiv

    //Latch d_isMult
    wire dx_isMult;
    flipflop ffDXisMult(.q(dx_isMult), .d(d_isMult), .clk(~clock), .en((~isMult & ~isDiv) | multDivReady), .clr(reset));

    //Latch d_isDiv
    wire dx_isDiv;
    flipflop ffDXisDiv(.q(dx_isDiv), .d(d_isDiv), .clk(~clock), .en((~isMult & ~isDiv) | multDivReady), .clr(reset));


    // Latch data from rs
    wire[31:0] dx_rs;
    register DX_rs(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(data_readRegA), .out(dx_rs));

    // Latch data from rt or rd
    wire[31:0] dx_rt_rd;
    register DX_rt_rd(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(data_readRegB), .out(dx_rt_rd));

    //Latch immediate
    wire[31:0] dx_immediate_ext;
    register DX_immed_ext(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(immediate_ext), .out(dx_immediate_ext));

    //Latch instruction
    wire[31:0] dxInstruction, dInstruction;
    mux_2 chooseInstructionDecode(.out(dInstruction), .in0(fdInstruction), .in1(32'b0), .select(isBranch));
    register DX_Instruction(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(dInstruction), .out(dxInstruction));

    //Latch PC (for jal)
    wire[31:0] dx_branch_PC;
    register DX_branch_PC(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(fd_branch_PC), .out(dx_branch_PC));
    
    // ==================================================================================================EXECUTE STAGE======================================================================================================= //

    // Helper wires
    wire [31:0] alu_out, data_operandB_in, alu_op_Rtype_ext, aluOp_in;
    wire xMuxChoose, rd_Less_rs, rs_Less_rd, rs_notEqual_rd, isMemOraddi, isBLT, ALUoverflow, overflow;
    assign isMemOraddi = (~dxInstruction[31] & ~dxInstruction[30] & dxInstruction[29] & dxInstruction[27]) | 
                        (~dxInstruction[31] & dxInstruction[30] & ~dxInstruction[29] & ~dxInstruction[28] & ~dxInstruction[27]); //simplified logic for mem ops;
    assign isBLT = ~dxInstruction[31] & ~dxInstruction[30] & dxInstruction[29] & dxInstruction[28] & ~dxInstruction[27];
    assign alu_op_Rtype_ext = {27'b0, dxInstruction[6:2]};

    //select correct value for data_operandB_in and aluOp_in
    mux_2 chooseB(.out(data_operandB_in), .select(isMemOraddi), .in0(dx_rt_rd), .in1(dx_immediate_ext));
    mux_4 chooseALUOP(.out(aluOp_in), .select({isMemOraddi, isBLT}), .in0(alu_op_Rtype_ext), .in1({31'b0, 1'b1}), .in2(32'b0), .in3(32'b0));

    // Use ALU to compute result
    alu ALU(.data_operandA(dx_rs), .data_operandB(data_operandB_in), .ctrl_ALUopcode(aluOp_in[4:0]), .data_result(alu_out), .ctrl_shiftamt(dxInstruction[11:7]), 
            .isLessThan(rs_Less_rd), .isNotEqual(rs_notEqual_rd), .overflow(ALUoverflow));
    assign rd_Less_rs = ~rs_Less_rd & rs_notEqual_rd; 

    //Multdiv
    wire[31:0] multDivRes;
    wire multCtrl, multPosEdge, divCtrl, divPosEdge, x_isALUop, multDivExp;

    assign isMult = dx_isMult; //global isMult
    assign isDiv = dx_isDiv; //global isDiv

    flipflop ffMultCtrl(.q(multCtrl), .d(d_isMult & ~multPosEdge & ~divPosEdge), .clk(~clock), .en(1'b1), .clr(1'b0)); //check clear
    flipflop ffMultPosEdge(.q(multPosEdge), .d(dx_isMult), .clk(clock), .en(1'b1), .clr(multDivReady & ~multCtrl));
    flipflop ffDivCtrl(.q(divCtrl), .d(d_isDiv & ~divPosEdge & ~multPosEdge), .clk(~clock), .en(1'b1), .clr(1'b0)); //check clear
    flipflop ffDivPosEdge(.q(divPosEdge), .d(dx_isDiv), .clk(clock), .en(1'b1), .clr(multDivReady & ~divCtrl));

    multdiv MULTDIV(.data_operandA(dx_rs), .data_operandB(dx_rt_rd), .ctrl_MULT(multCtrl), .ctrl_DIV(divCtrl), .clock(clock), 
                    .data_result(multDivRes), .data_exception(multDivExp), .data_resultRDY(multDivReady));
    
    //Assign overflow
    assign overflow = (~isMult & ~isDiv & ALUoverflow) | ((isMult | isDiv) & multDivExp); //technically should not be called overflow but exception, but too hard to change name everywhere
    

    //Latch multDiv result
    wire[31:0] xm_multDivRes;
    register XM_multDivRes(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(multDivRes), .out(xm_multDivRes));

    // Latch ALU result
    wire [31:0] xm_alu_out;
    register XM_alu_out(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(alu_out), .out(xm_alu_out));

    // Latch instruction
    wire [31:0] xmInstruction;
    register XM_Instruction(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(dxInstruction), .out(xmInstruction));

    //Latch dx_rt_rd
    wire [31:0] xm_rt_rd;
    register XM_rt_rd(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(dx_rt_rd), .out(xm_rt_rd));

    //Latch overflow
    wire xm_overflow;
    flipflop XM_overflow(.clk(~clock), .clr(reset), .en((~isMult & ~isDiv) | multDivReady), .d(overflow), .q(xm_overflow));




    // ---------------------------------Execute stage handle branching, all PC's here are assuming branch co------------------------------------- //
    //define wires
    wire[31:0] jPC, bnePC, jalPC, jrPC, bltPC, bexPC, one_one_zeroPC;

    //PC+1+N
    wire[31:0] PC_plus_1_plus_N;
    adder PC_plus_1_plus_N_add(.sum(PC_plus_1_plus_N), .A(dx_branch_PC), .B({{15{dxInstruction[16]}}, dxInstruction[16:0]}), .Cin(1'b0)); //Don't need to add one to PC, inital fetch one clock cycle delayed

    //jPC
    assign jPC = {5'b0, dxInstruction[26:0]};

    //bnePC
    wire rd_equals_rs;
    isEqual check_rd_rs(.out(rd_equals_rs), .A(dx_rs), .B(dx_rt_rd));
    assign bnePC = PC_plus_1_plus_N;

    //jalPC
    assign jalPC = {5'b0, dxInstruction[26:0]};

    //jrPC
    assign jrPC = dx_rt_rd;

    //bltPCs
    assign bltPC = PC_plus_1_plus_N;
    
    //bexPC
    wire rstatus_equals_zero;
    isEqual isEqual_rstatus_equals_zero(.out(rstatus_equals_zero), .A(dx_rt_rd), .B(32'b0));
    assign bexPC = {5'b0, dxInstruction[26:0]};

    //one_one_zeroPC
    mux_2 chooseOneOneZeroPC(.out(one_one_zeroPC), .in0(bltPC), .in1(bexPC), .select(dxInstruction[31])); //choose between blt and bex

    //select branchPC
    mux_8 chooseBranchPC(.out(branchPC), .in0(32'b0), .in1(jPC), .in2(bnePC), .in3(jalPC), .in4(jrPC), .in5(PC_plus_1), 
                .in6(one_one_zeroPC), .in7(PC_plus_1), .select(dxInstruction[29:27]));

    //determine if there is a branch
    wire x_isJ, x_isBne, x_isJal, x_isJr, x_isBlt, x_isBex;

    assign x_isJ = ~dxInstruction[31] & ~dxInstruction[30] & ~dxInstruction[29] & ~dxInstruction[28] & dxInstruction[27];
    assign x_isBne = ~dxInstruction[31] & ~dxInstruction[30] & ~dxInstruction[29] & dxInstruction[28] & ~dxInstruction[27];
    assign x_isJal = ~dxInstruction[31] & ~dxInstruction[30] & ~dxInstruction[29] & dxInstruction[28] & dxInstruction[27];
    assign x_isJr = ~dxInstruction[31] & ~dxInstruction[30] & dxInstruction[29] & ~dxInstruction[28] & ~dxInstruction[27];
    assign x_isBlt = ~dxInstruction[31] & ~dxInstruction[30] & dxInstruction[29] & dxInstruction[28] & ~dxInstruction[27];
    assign x_isBex = dxInstruction[31] & ~dxInstruction[30] & dxInstruction[29] & dxInstruction[28] & ~dxInstruction[27];

    assign isBranch = x_isJ | (x_isBne & ~rd_equals_rs) | x_isJal | x_isJr | (x_isBlt & rd_Less_rs) | (x_isBex & ~rstatus_equals_zero);


    //Latch jal PC
    wire[31:0] xm_branch_PC;
    register XM_branch_PC(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(dx_branch_PC), .out(xm_branch_PC));

    // ================================================================================================MEMORY STAGE=============================================================================================== //

    //Helper wires
    wire m_isStore;
    assign m_isStore = ~xmInstruction[31] & ~xmInstruction[30] & xmInstruction[29] & xmInstruction[28] & xmInstruction[27];
    

    //perform memory operations
    assign address_dmem = xm_alu_out; //address to access
    assign wren = m_isStore; //write enable
    assign data = xm_rt_rd; //data to write if sw (data from register rd)

    //Latch data from RAM (for lw)
    wire[31:0] mw_RAM_out;
    register MW_RAM_out(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(q_dmem), .out(mw_RAM_out));

    //Latch ALU result
    wire [31:0] mw_alu_out;
    register MW_alu_out(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(xm_alu_out), .out(mw_alu_out));

    //Latch instruction
    wire [31:0] mwInstruction;
    register MW_Instruction(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(xmInstruction), .out(mwInstruction));

    //Latch xm_rt_rd
    wire[31:0] mw_rt_rd;
    register MW_rt_rd(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(xm_rt_rd), .out(mw_rt_rd));

    //Latch xm_overflow
    wire mw_overflow;
    flipflop MW_overflow(.clk(~clock), .clr(reset), .en((~isMult & ~isDiv) | multDivReady), .d(xm_overflow), .q(mw_overflow));

    //Latch jal PC
    wire[31:0] mw_branch_PC;
    register MW_branch_PC(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(xm_branch_PC), .out(mw_branch_PC));

    //Latch xm_multDiv result
    wire[31:0] mw_multDivRes;
    register MW_multDivRes(.clock(~clock), .reset(reset), .WE((~isMult & ~isDiv) | multDivReady), .data(xm_multDivRes), .out(mw_multDivRes));



    // =====================================================================================================WRITEBACK STAGE============================================================================================= //

    //Helper wires
    wire w_isLoad, w_isALUop, w_isJal, w_isAddi, w_isSetx, w_isSub, w_isMul, w_isDiv, w_isNOP;
    assign w_isLoad = ~mwInstruction[31] & mwInstruction[30] & ~mwInstruction[29] & ~mwInstruction[28] & ~mwInstruction[27];
    assign w_isAddi = ~mwInstruction[31] & ~mwInstruction[30] & mwInstruction[29] & ~mwInstruction[28] & mwInstruction[27];
    assign w_isALUop = w_isAddi | (~mwInstruction[31] & ~mwInstruction[30] & ~mwInstruction[29] & ~mwInstruction[28] & ~mwInstruction[27]);
    assign w_isJal = ~mwInstruction[31] & ~mwInstruction[30] & ~mwInstruction[29] & mwInstruction[28] & mwInstruction[27];
    assign w_isSetx = mwInstruction[31] & ~mwInstruction[30] & mwInstruction[29] & ~mwInstruction[28] & mwInstruction[27];
    assign w_isSub = w_isALUop & ~w_isAddi & ((~mwInstruction[6] & ~mwInstruction[5] & ~mwInstruction[4] & ~mwInstruction[3] & mwInstruction[2]));
    assign w_isMul = w_isALUop & ~w_isAddi & ((~mwInstruction[6] & ~mwInstruction[5] & mwInstruction[4] & mwInstruction[3] & ~mwInstruction[2]));
    assign w_isDiv = w_isALUop & ~w_isAddi & ((~mwInstruction[6] & ~mwInstruction[5] & mwInstruction[4] & mwInstruction[3] & mwInstruction[2]));
    isEqual isNOP(.out(w_isNOP), .A(mwInstruction), .B(32'b0));

    //PC+1
    adder PC_adder(.sum(PC_plus_1), .A(address_imem), .B(32'b0), .Cin(1'b1));

    
    // Set destination register data to write
    wire[31:0] errorCode;
    assign data_writeReg = mw_overflow   ? errorCode :
                         w_isSetx      ? {5'b0, mwInstruction[26:0]} :
                         w_isJal       ? mw_branch_PC :
                         w_isLoad      ? mw_RAM_out :
                         (w_isMul | w_isDiv) ? mw_multDivRes :
                         mw_alu_out;

    assign errorCode = w_isDiv  ? {29'b0, 1'b1, 1'b0, 1'b1} :
                       w_isMul  ? {29'b0, 1'b1, 2'b0} :
                       w_isSub  ? {30'b0, 2'b11} :
                       w_isAddi ? {30'b0, 1'b1, 1'b0} :
                       {31'b0, 1'b1};

    //Set desitiation register ctrl
   assign ctrl_writeReg = (w_isSetx | mw_overflow) ? 5'b11110 :
                          w_isJal                  ? 5'b11111 :
                          mwInstruction[26:22];

    // Set write enable
    assign ctrl_writeEnable = (w_isALUop | w_isLoad | w_isJal | w_isSetx) & ~w_isNOP;

endmodule

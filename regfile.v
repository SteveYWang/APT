module regfile(
    input clock,
    input ctrl_writeEnable,
    input ctrl_reset,
    input[4:0] ctrl_writeReg,
    input[4:0] ctrl_readRegA,
    input[4:0] ctrl_readRegB,
    input[31:0] data_writeReg,
    output[31:0] data_readRegA,
    output[31:0] data_readRegB
);
    wire[31:0] regout0,
        regout1,  
        regout2,  
        regout3,  
        regout4,  
        regout5,  
        regout6,  
        regout7,  
        regout8,  
        regout9,  
        regout10,  
        regout11,  
        regout12,  
        regout13,  
        regout14,  
        regout15,  
        regout16,  
        regout17,  
        regout18,  
        regout19,  
        regout20,  
        regout21,  
        regout22,  
        regout23,  
        regout24,  
        regout25,  
        regout26,  
        regout27,  
        regout28,  
        regout29,  
        regout30,  
        regout31;

    wire[31:0] readA, readB, write;
    
    decoder32 read1(.out(readA), .select(ctrl_readRegA), .enable(1'b1));
    decoder32 read2(.out(readB), .select(ctrl_readRegB), .enable(1'b1));
    decoder32 write_(.out(write), .select(ctrl_writeReg), .enable(ctrl_writeEnable));

    register reg0(.out(regout0), .reset(1'b1), .clock(clock), .WE(write[0]), .data(data_writeReg));
    register reg1(.out(regout1), .reset(ctrl_reset), .clock(clock), .WE(write[1]), .data(data_writeReg));  
    register reg2(.out(regout2), .reset(ctrl_reset), .clock(clock), .WE(write[2]), .data(data_writeReg));  
    register reg3(.out(regout3), .reset(ctrl_reset), .clock(clock), .WE(write[3]), .data(data_writeReg));  
    register reg4(.out(regout4), .reset(ctrl_reset), .clock(clock), .WE(write[4]), .data(data_writeReg));  
    register reg5(.out(regout5), .reset(ctrl_reset), .clock(clock), .WE(write[5]), .data(data_writeReg));  
    register reg6(.out(regout6), .reset(ctrl_reset), .clock(clock), .WE(write[6]), .data(data_writeReg));  
    register reg7(.out(regout7), .reset(ctrl_reset), .clock(clock), .WE(write[7]), .data(data_writeReg));  
    register reg8(.out(regout8), .reset(ctrl_reset), .clock(clock), .WE(write[8]), .data(data_writeReg));  
    register reg9(.out(regout9), .reset(ctrl_reset), .clock(clock), .WE(write[9]), .data(data_writeReg));  
    register reg10(.out(regout10), .reset(ctrl_reset), .clock(clock), .WE(write[10]), .data(data_writeReg));  
    register reg11(.out(regout11), .reset(ctrl_reset), .clock(clock), .WE(write[11]), .data(data_writeReg));  
    register reg12(.out(regout12), .reset(ctrl_reset), .clock(clock), .WE(write[12]), .data(data_writeReg));  
    register reg13(.out(regout13), .reset(ctrl_reset), .clock(clock), .WE(write[13]), .data(data_writeReg));  
    register reg14(.out(regout14), .reset(ctrl_reset), .clock(clock), .WE(write[14]), .data(data_writeReg));  
    register reg15(.out(regout15), .reset(ctrl_reset), .clock(clock), .WE(write[15]), .data(data_writeReg));  
    register reg16(.out(regout16), .reset(ctrl_reset), .clock(clock), .WE(write[16]), .data(data_writeReg));  
    register reg17(.out(regout17), .reset(ctrl_reset), .clock(clock), .WE(write[17]), .data(data_writeReg));  
    register reg18(.out(regout18), .reset(ctrl_reset), .clock(clock), .WE(write[18]), .data(data_writeReg));  
    register reg19(.out(regout19), .reset(ctrl_reset), .clock(clock), .WE(write[19]), .data(data_writeReg));  
    register reg20(.out(regout20), .reset(ctrl_reset), .clock(clock), .WE(write[20]), .data(data_writeReg));  
    register reg21(.out(regout21), .reset(ctrl_reset), .clock(clock), .WE(write[21]), .data(data_writeReg));  
    register reg22(.out(regout22), .reset(ctrl_reset), .clock(clock), .WE(write[22]), .data(data_writeReg));  
    register reg23(.out(regout23), .reset(ctrl_reset), .clock(clock), .WE(write[23]), .data(data_writeReg));  
    register reg24(.out(regout24), .reset(ctrl_reset), .clock(clock), .WE(write[24]), .data(data_writeReg));  
    register reg25(.out(regout25), .reset(ctrl_reset), .clock(clock), .WE(write[25]), .data(data_writeReg));  
    register reg26(.out(regout26), .reset(ctrl_reset), .clock(clock), .WE(write[26]), .data(data_writeReg));  
    register reg27(.out(regout27), .reset(ctrl_reset), .clock(clock), .WE(write[27]), .data(data_writeReg));  
    register reg28(.out(regout28), .reset(ctrl_reset), .clock(clock), .WE(write[28]), .data(data_writeReg));  
    register reg29(.out(regout29), .reset(ctrl_reset), .clock(clock), .WE(write[29]), .data(data_writeReg));  
    register reg30(.out(regout30), .reset(ctrl_reset), .clock(clock), .WE(write[30]), .data(data_writeReg));  
    register reg31(.out(regout31), .reset(ctrl_reset), .clock(clock), .WE(write[31]), .data(data_writeReg));  

    wire[31:0] zeroWire = 32'b0;
    tribuffer zeroA(.out(data_readRegA), .oe(readA[0]), .in(zeroWire));
    tribuffer zeroB(.out(data_readRegB), .oe(readB[0]), .in(zeroWire));
    tribuffer oneA(.out(data_readRegA), .oe(readA[1]), .in(regout1));
    tribuffer oneB(.out(data_readRegB), .oe(readB[1]), .in(regout1));
    tribuffer twoA(.out(data_readRegA), .oe(readA[2]), .in(regout2));
    tribuffer twoB(.out(data_readRegB), .oe(readB[2]), .in(regout2));
    tribuffer threeA(.out(data_readRegA), .oe(readA[3]), .in(regout3));
    tribuffer threeB(.out(data_readRegB), .oe(readB[3]), .in(regout3));
    tribuffer fourA(.out(data_readRegA), .oe(readA[4]), .in(regout4));
    tribuffer fourB(.out(data_readRegB), .oe(readB[4]), .in(regout4));
    tribuffer fiveA(.out(data_readRegA), .oe(readA[5]), .in(regout5));
    tribuffer fiveB(.out(data_readRegB), .oe(readB[5]), .in(regout5));
    tribuffer sixA(.out(data_readRegA), .oe(readA[6]), .in(regout6));
    tribuffer sixB(.out(data_readRegB), .oe(readB[6]), .in(regout6));
    tribuffer sevenA(.out(data_readRegA), .oe(readA[7]), .in(regout7));
    tribuffer sevenB(.out(data_readRegB), .oe(readB[7]), .in(regout7));
    tribuffer eightA(.out(data_readRegA), .oe(readA[8]), .in(regout8));
    tribuffer eightB(.out(data_readRegB), .oe(readB[8]), .in(regout8));
    tribuffer nineA(.out(data_readRegA), .oe(readA[9]), .in(regout9));
    tribuffer nineB(.out(data_readRegB), .oe(readB[9]), .in(regout9));
    tribuffer tenA(.out(data_readRegA), .oe(readA[10]), .in(regout10));
    tribuffer tenB(.out(data_readRegB), .oe(readB[10]), .in(regout10));
    tribuffer elevenA(.out(data_readRegA), .oe(readA[11]), .in(regout11));
    tribuffer elevenB(.out(data_readRegB), .oe(readB[11]), .in(regout11));
    tribuffer twelveA(.out(data_readRegA), .oe(readA[12]), .in(regout12));
    tribuffer twelveB(.out(data_readRegB), .oe(readB[12]), .in(regout12));
    tribuffer thirteenA(.out(data_readRegA), .oe(readA[13]), .in(regout13));
    tribuffer thirteenB(.out(data_readRegB), .oe(readB[13]), .in(regout13));
    tribuffer fourteenA(.out(data_readRegA), .oe(readA[14]), .in(regout14));
    tribuffer fourteenB(.out(data_readRegB), .oe(readB[14]), .in(regout14));
    tribuffer fifteenA(.out(data_readRegA), .oe(readA[15]), .in(regout15));
    tribuffer fifteenB(.out(data_readRegB), .oe(readB[15]), .in(regout15));
    tribuffer sixteenA(.out(data_readRegA), .oe(readA[16]), .in(regout16));
    tribuffer sixteenB(.out(data_readRegB), .oe(readB[16]), .in(regout16));
    tribuffer seventeenA(.out(data_readRegA), .oe(readA[17]), .in(regout17));
    tribuffer seventeenB(.out(data_readRegB), .oe(readB[17]), .in(regout17));
    tribuffer eighteenA(.out(data_readRegA), .oe(readA[18]), .in(regout18));
    tribuffer eighteenB(.out(data_readRegB), .oe(readB[18]), .in(regout18));
    tribuffer nineteenA(.out(data_readRegA), .oe(readA[19]), .in(regout19));
    tribuffer nineteenB(.out(data_readRegB), .oe(readB[19]), .in(regout19));
    tribuffer twentyA(.out(data_readRegA), .oe(readA[20]), .in(regout20));
    tribuffer twentyB(.out(data_readRegB), .oe(readB[20]), .in(regout20));
    tribuffer twentyoneA(.out(data_readRegA), .oe(readA[21]), .in(regout21));
    tribuffer twentyoneB(.out(data_readRegB), .oe(readB[21]), .in(regout21));
    tribuffer twentytwoA(.out(data_readRegA), .oe(readA[22]), .in(regout22));
    tribuffer twentytwoB(.out(data_readRegB), .oe(readB[22]), .in(regout22));
    tribuffer twentythreeA(.out(data_readRegA), .oe(readA[23]), .in(regout23));
    tribuffer twentythreeB(.out(data_readRegB), .oe(readB[23]), .in(regout23));
    tribuffer twentyfourA(.out(data_readRegA), .oe(readA[24]), .in(regout24));
    tribuffer twentyfourB(.out(data_readRegB), .oe(readB[24]), .in(regout24));
    tribuffer twentyfiveA(.out(data_readRegA), .oe(readA[25]), .in(regout25));
    tribuffer twentyfiveB(.out(data_readRegB), .oe(readB[25]), .in(regout25));
    tribuffer twentysixA(.out(data_readRegA), .oe(readA[26]), .in(regout26));
    tribuffer twentysixB(.out(data_readRegB), .oe(readB[26]), .in(regout26));
    tribuffer twentysevenA(.out(data_readRegA), .oe(readA[27]), .in(regout27));
    tribuffer twentysevenB(.out(data_readRegB), .oe(readB[27]), .in(regout27));
    tribuffer twentyeightA(.out(data_readRegA), .oe(readA[28]), .in(regout28));
    tribuffer twentyeightB(.out(data_readRegB), .oe(readB[28]), .in(regout28));
    tribuffer twentynineA(.out(data_readRegA), .oe(readA[29]), .in(regout29));
    tribuffer twentynineB(.out(data_readRegB), .oe(readB[29]), .in(regout29));
    tribuffer thirtyA(.out(data_readRegA), .oe(readA[30]), .in(regout30));
    tribuffer thirtyB(.out(data_readRegB), .oe(readB[30]), .in(regout30));
    tribuffer thirtyoneA(.out(data_readRegA), .oe(readA[31]), .in(regout31));
    tribuffer thirtyoneB(.out(data_readRegB), .oe(readB[31]), .in(regout31));

endmodule
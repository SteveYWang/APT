
module boothmult(
    output[31:0] out,
    output ready, exception,
    input[31:0] A_in, B_in,
    input ctrl_MULT, clock
);
    wire[64:0] out_buffer;// actual out is only half the prod register
    wire[31:0] A, B;

    //latch inputs
    register regA(.out(A), .reset(1'b0), .clock(clock), .WE(ctrl_MULT), .data(A_in));
    register regB(.out(B), .reset(1'b0), .clock(clock), .WE(ctrl_MULT), .data(B_in));


    //Booth's algorithm
    wire ctrl_MULT_delay;
    wire[64:0] productIn, extendMultiplier, nextProd;
    assign extendMultiplier[0] = 1'b0;
    assign extendMultiplier[32:1] = B[31:0];
    assign extendMultiplier[64:33] = 32'b0;
    mux65_2 chooseProductIn(.out(productIn), .select(ctrl_MULT_delay | ctrl_MULT), .in0(nextProd), .in1(extendMultiplier));
    flipflop startOp(.q(ctrl_MULT_delay), .d(ctrl_MULT), .clk(clock), .en(1'b1), .clr(1'b0));
    //the issue: ctrl_MULT resets register the same time that the mux selected extendMultiplier

    
    reg65 product(.out(out_buffer), .reset(ctrl_MULT), .clock(clock), .WE(1'b1), .data(productIn));
    findNextProd next(.nextProd(nextProd), .currProd(out_buffer), .multiplicand(A));

    //Final output- also assert exception and ready
    assign out = out_buffer[32:1];
    counter32 count(.ready(ready), .clr(ctrl_MULT_delay), .clock(clock));
    multException ex(.exception(exception), .finalProd(out_buffer), .signA(A[31]), .signB(B[31]));

    //debugging
    /*
    always @ (posedge ready) begin
      $display("A:%d, B:%d, Result:%d, Result:%b, Total:%b Exp:%b", A, B, out, out, out_buffer, exception);
    end
    */
endmodule
module findNextProd(
    output[64:0] nextProd,
    input[64:0] currProd,
    input[31:0] multiplicand
);
    wire[64:0] shiftOnly, addAndShift, subAndShift;

    //find shiftOnly
    assign shiftOnly[63:0] = currProd[64:1];
    assign shiftOnly[64] = currProd[64];

    //find addAndShift
    wire[31:0] add32;
    wire[64:0] add65;
    adder add1(.sum(add32), .A(multiplicand), .B(currProd[64:33]), .Cin(1'b0));
    assign add65[64:33] = add32[31:0];
    assign add65[32:0] = currProd[32:0];
    assign addAndShift[63:0] = add65[64:1];
    assign addAndShift[64] = add65[64];

    //find subAndShift
    wire[31:0] sub32;
    wire[64:0] sub65;
    substract subber(.sub(sub32), .A(currProd[64:33]), .B(multiplicand));
    assign sub65[64:33] = sub32[31:0];
    assign sub65[32:0] = currProd[32:0];
    assign subAndShift[63:0] = sub65[64:1];
    assign subAndShift[64] = sub65[64];

    //select which output
    mux65_4 choose(.out(nextProd), .select(currProd[1:0]), .in0(shiftOnly), .in1(addAndShift), .in2(subAndShift), .in3(shiftOnly));
endmodule




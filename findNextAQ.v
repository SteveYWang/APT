module findNextAQ(
    output[63:0] nextAQ,
    input[63:0] currAQ,
    input[31:0] divisor
);
    //left shift AQ
    wire[63:0] currAQShift;
    assign currAQShift[63:1] = currAQ[62:0];
    assign currAQShift[0] = 1'b0;

    //substract divisor
    wire[63:0] currAQShiftSub;
    substract sub(.sub(currAQShiftSub[63:32]), .A(currAQShift[63:32]), .B(divisor));
    assign currAQShiftSub[31:0] = currAQShift[31:0];

    //find Q[0]
    mux_2_onebit muxQ(.out(nextAQ[0]), .in0(1'b1), .in1(1'b0), .select(currAQShiftSub[63]));

    //find A
    mux_2 muxA(.out(nextAQ[63:32]), .in0(currAQShiftSub[63:32]), .in1(currAQShift[63:32]), .select(currAQShiftSub[63]));

    //fill in Q[31:1]
    assign nextAQ[31:1] = currAQShiftSub[31:1];
endmodule

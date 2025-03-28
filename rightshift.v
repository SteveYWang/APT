module rightshift(
    output[31:0] res,
    input[31:0] A,
    input[4:0] shiftAmt
);
    wire[31:0] shiftOne, shiftTwo, shiftFour, shiftEight, shiftSixteen,
               muxOne, muxTwo, muxThree, muxFour;

    rightShift_one one(shiftOne, A);
    rightShift_two two(shiftTwo, muxOne);
    rightShift_four four(shiftFour, muxTwo);
    rightShift_eight eight(shiftEight, muxThree);
    rightShift_sixteen sixteen(shiftSixteen, muxFour);

    mux_2 firstMux(.out(muxOne), .select(shiftAmt[0]), .in0(A), .in1(shiftOne));
    mux_2 secondMux(.out(muxTwo), .select(shiftAmt[1]), .in0(muxOne), .in1(shiftTwo));
    mux_2 thirdMux(.out(muxThree), .select(shiftAmt[2]), .in0(muxTwo), .in1(shiftFour));
    mux_2 fourthMux(.out(muxFour), .select(shiftAmt[3]), .in0(muxThree), .in1(shiftEight));
    mux_2 fifthMux(.out(res), .select(shiftAmt[4]), .in0(muxFour), .in1(shiftSixteen));
endmodule
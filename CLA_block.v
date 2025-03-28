module CLA_block(
    output[7:0] sum, 
    output G, 
    output P,
    input[7:0] A,
    input[7:0] B,
    input Cin
);
    wire c0, c1, c2, c3, c4, c5, c6, c7;
    wire G, P;

    //make c0=Cin
    assign c0 = Cin;

    carry_creator_CLA carrys(c1, c2, c3, c4, c5, c6, c7, P, G, A, B, c0);

    //use two bit adder to find sum bits
    two_bit_add add0(sum[0], A[0], B[0], c0); //S, A, B, Cin
    two_bit_add add1(sum[1], A[1], B[1], c1);
    two_bit_add add2(sum[2], A[2], B[2], c2);
    two_bit_add add3(sum[3], A[3], B[3], c3);
    two_bit_add add4(sum[4], A[4], B[4], c4);
    two_bit_add add5(sum[5], A[5], B[5], c5);
    two_bit_add add6(sum[6], A[6], B[6], c6);
    two_bit_add add7(sum[7], A[7], B[7], c7);
endmodule


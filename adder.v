module adder(
    output[31:0] sum,
    output overflow,
    input[31:0] A,
    input[31:0] B,
    input Cin
);
    //wires and carrys
    wire c8, c16, c24, c32;
    wire G0, P0, G1, P1, G2, P2, G3, P3;
    carry_creator_adder carry_creator(c8, c16, c24, c32, Cin, G0, P0, G1, P1, G2, P2, G3, P3);

    //compute sum
    CLA_block block_one(sum[7:0], G0, P0, A[7:0], B[7:0], Cin);
    CLA_block block_two(sum[15:8], G1, P1, A[15:8], B[15:8], c8);
    CLA_block block_three(sum[23:16], G2, P2, A[23:16], B[23:16], c16);
    CLA_block block_four(sum[31:24], G3, P3, A[31:24], B[31:24], c24);

    //determine if overflow
    wire matchSign, differ, bothZero, bothOne;
    nor bothZero_nor(bothZero, A[31], B[31]);
    and bothOne_and(bothOne, A[31], B[31]);
    or matchSign_or(matchSign, bothOne, bothZero);
    my_xor differ_xor(differ, A[31], sum[31]);
    and overflow_and(overflow, differ, matchSign);
endmodule
module carry_creator_CLA(
    output c1,
    output c2,
    output c3,
    output c4,
    output c5,
    output c6,
    output c7,
    output P,
    output G,
    input[7:0] A,
    input[7:0] B,
    input c0
);
    wire g0, p0, g1, p1, g2, p2, g3, p3, g4, p4, g5, p5, g6, p6, g7, p7;

    //find p's and g's
    and g0_and(g0, A[0], B[0]);
    and g1_and(g1, A[1], B[1]);
    and g2_and(g2, A[2], B[2]);
    and g3_and(g3, A[3], B[3]);
    and g4_and(g4, A[4], B[4]);
    and g5_and(g5, A[5], B[5]);
    and g6_and(g6, A[6], B[6]);
    and g7_and(g7, A[7], B[7]);
    or p0_or(p0, A[0], B[0]);
    or p1_or(p1, A[1], B[1]);
    or p2_or(p2, A[2], B[2]);
    or p3_or(p3, A[3], B[3]);
    or p4_or(p4, A[4], B[4]);
    or p5_or(p5, A[5], B[5]);
    or p6_or(p6, A[6], B[6]);
    or p7_or(p7, A[7], B[7]);

    //c1
    wire p0c0;
    and p0c0_and(p0c0, p0, c0);
    or or_c1(c1, g0, p0c0);

    //c2
    wire p1g0, p0p1c0;
    and p1g0_and(p1g0, p1, g0);
    and p0p1c0_and(p0p1c0, p0, p1, c0);
    or or_c2(c2, g1, p1g0, p0p1c0);

    //c3
    wire p2g1, p1p2g0, p0p1p2c0;
    and p2g1_and(p2g1, p2, g1);
    and plp2g0_and(p1p2g0, p1, p2, g0);
    and p0p1p2c0_and(p0p1p2c0, p0, p1, p2, c0);
    or or_c3(c3, g2, p2g1, p1p2g0, p0p1p2c0);

    //c4
    wire p3g2, p2p3g1, p1p2p3g0, p0p1p2p3c0;
    and p3g2_and(p3g2, p3, g2);
    and p2p3g1_and(p2p3g1, p2, p3, g1);
    and p1p2p3g0_and(p1p2p3g0, p1, p2, p3, g0);
    and p0p1p2p3c0_and(p0p1p2p3c0, p0, p1, p2, p3, c0);
    or or_c4(c4, g3, p3g2, p2p3g1, p1p2p3g0, p0p1p2p3c0);

    //c5
    wire p4g3, p3p4g2, p2p3p4g1, p1p2p3p4g0, p0p1p2p3p4c0;
    and p4g3_and(p4g3, p4, g3);
    and p3p4g2_and(p3p4g2, p3, p4, g2);
    and p2p3p4g1_and(p2p3p4g1, p2, p3, p4, g1);
    and p1p2p3p4g0_and(p1p2p3p4g0, p1, p2, p3, p4, g0);
    and p0p1p2p3p4c0_and(p0p1p2p3p4c0, p0, p1, p2, p3, p4, c0);
    or or_c5(c5, g4, p4g3, p3p4g2, p2p3p4g1, p1p2p3p4g0, p0p1p2p3p4c0);

    //c6
    wire p5g4, p4p5g3, p3p4p5g2, p2p3p4p5g1, p1p2p3p4p5g0, p0p1p2p3p4p5c0;
    and p5g4_and(p5g4, p5, g4);
    and p4p5g3_and(p4p5g3, p4, p5, g3);
    and p3p4p5g2_and(p3p4p5g2, p3, p4, p5, g2);
    and p2p3p4p5g1_and(p2p3p4p5g1, p2, p3, p4, p5, g1);
    and p1p2p3p4p5g0_and(p1p2p3p4p5g0, p1, p2, p3, p4, p5, g0);
    and p0p1p2p3p4p5c0_and(p0p1p2p3p4p5c0, p0, p1, p2, p3, p4, p5, c0);
    or or_c6(c6, g5, p5g4, p4p5g3, p3p4p5g2, p2p3p4p5g1, p1p2p3p4p5g0, p0p1p2p3p4p5c0);

    //c7
    wire p6g5, p5p6g4, p4p5p6g3, p3p4p5p6g2, p2p3p4p5p6g1, p1p2p3p4p5p6g0, p0p1p2p3p4p5p6c0;
    and p6g5_and(p6g5, p6, g5);
    and p5p6g4_and(p5p6g4, p5, p6, g4);
    and p4p5p6g3_and(p4p5p6g3, p4, p5, p6, g3);
    and p3p4p5p6g2_and(p3p4p5p6g2, p3, p4, p5, p6, g2);
    and p2p3p4p5p6g1_and(p2p3p4p5p6g1, p2, p3, p4, p5, p6, g1);
    and p1p2p3p4p5p6g0_and(p1p2p3p4p5p6g0, p1, p2, p3, p4, p5, p6, g0);
    and p0p1p2p3p4p5p6c0_and(p0p1p2p3p4p5p6c0, p0, p1, p2, p3, p4, p5, p6, c0);
    or or_c7(c7, g6, p6g5, p5p6g4, p4p5p6g3, p3p4p5p6g2, p2p3p4p5p6g1, p1p2p3p4p5p6g0, p0p1p2p3p4p5p6c0);

    //G
    wire p7g6, p6p7g5, p5p6p7g4, p4p5p6p7g3, p3p4p5p6p7g2, p2p3p4p5p6p7g1, p1p2p3p4p5p6p7g0;
    and p7g6_and(p7g6, p7, g6);
    and p6p7g5_and(p6p7g5, p6, p7, g5);
    and p5p6p7g4_and(p5p6p7g4, p5, p6, p7, g4);
    and p4p5p6p7g3_and(p4p5p6p7g3, p4, p5, p6, p7, g3);
    and p3p4p5p6p7g2_and(p3p4p5p6p7g2, p3, p4, p5, p6, p7, g2);
    and p2p3p4p5p6p7g1_and(p2p3p4p5p6p7g1, p2, p3, p4, p5, p6, p7, g1);
    and p1p2p3p4p5p6p7g0_and(p1p2p3p4p5p6p7g0, p1, p2, p3, p4, p5, p6, p7, g0);
    or G_or(G, g7, p7g6, p6p7g5, p5p6p7g4, p4p5p6p7g3, p3p4p5p6p7g2, p2p3p4p5p6p7g1, p1p2p3p4p5p6p7g0);

    //P
    and P_and(P, p0, p1, p2, p3, p4, p5, p6, p7);
endmodule

    


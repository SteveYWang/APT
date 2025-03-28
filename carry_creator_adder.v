module carry_creator_adder(
    output c8,
    output c16,
    output c24,
    output c32,
    input c0,
    input G0,
    input P0,
    input G1,
    input P1,
    input G2,
    input P2,
    input G3,
    input P3
);
    //c8
    wire P0c0;
    and P0c0_and(P0c0, P0, c0);
    or c8_or(c8, G0, P0c0);

    //c16
    wire P1G0, P0P1c0;
    and P1G0_and(P1G0, P1, G0);
    and P0P1c0_and(P0P1c0, P0, P1, c0);
    or c16_or(c16, G1, P1G0, P0P1c0);

    //c24
    wire P2G1, P1P2G0, P0P1P2c0;
    and P2G1_and(P2G1, P2, G1);
    and P1P2G0_and(P1P2G0, P1, P2, G0);
    and P0P1P2c0_and(P0P1P2c0, P0, P1, P2, c0);
    or c24_or(c24, G2, P2G1, P1P2G0, P0P1P2c0);

    //c32
    wire P3G2, P2P3G1, P1P2P3G0, P0P1P2P3c0;
    and P3G2_and(P3G2, P3, G2);
    and P2P3G1_and(P2P3G1, P2, P3, G1);
    and P1P2P3G0_and(P1P2P3G0, P1, P2, P3, G0);
    and P0P1P2P3c0_and(P0P1P2P3c0, P0, P1, P2, P3, c0);
    or c32_or(c32, P3G2, P2P3G1, P1P2P3G0, P0P1P2P3c0);
endmodule
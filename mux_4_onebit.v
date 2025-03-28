module mux_4_onebit(
    output out,
    input [1:0] select,
    input in0,
    input in1,
    input in2,
    input in3
);
    wire w1, w2;
    mux_2_onebit first_top(w1, select[0], in0, in1);
    mux_2_onebit first_bottom(w2, select[0], in2, in3);
    mux_2_onebit second(out, select[1], w1, w2);
endmodule
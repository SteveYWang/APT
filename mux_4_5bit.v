module mux_4_5bit(
    output [4:0] out,
    input [1:0] select,
    input [4:0] in0,
    input [4:0] in1,
    input [4:0] in2,
    input [4:0] in3
);
    wire [4:0] w1, w2;
    mux_2_5bit first_top(w1, select[0], in0, in1);
    mux_2_5bit first_bottom(w2, select[0], in2, in3);
    mux_2_5bit second(out, select[1], w1, w2);
endmodule
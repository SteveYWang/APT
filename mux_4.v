module mux_4(
    output [31:0] out,
    input [1:0] select,
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3
);
    wire [31:0] w1, w2;
    mux_2 first_top(w1, select[0], in0, in1);
    mux_2 first_bottom(w2, select[0], in2, in3);
    mux_2 second(out, select[1], w1, w2);
endmodule
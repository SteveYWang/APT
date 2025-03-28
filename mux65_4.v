module mux65_4(
    output [64:0] out,
    input [1:0] select,
    input [64:0] in0,
    input [64:0] in1,
    input [64:0] in2,
    input [64:0] in3
);
    wire [64:0] w1, w2;
    mux65_2 first_top(w1, select[0], in0, in1);
    mux65_2 first_bottom(w2, select[0], in2, in3);
    mux65_2 second(out, select[1], w1, w2);
endmodule
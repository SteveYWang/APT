module mux65_2(
    output[64:0] out,
    input select,
    input [64:0] in0,
    input [64:0] in1 
);
    assign out = select ? in1 : in0;
endmodule
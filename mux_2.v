module mux_2(
    output[31:0] out,
    input select,
    input [31:0] in0,
    input [31:0] in1 
);
    assign out = select ? in1 : in0;
endmodule
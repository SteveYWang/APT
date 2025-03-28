module mux64_2(
    output[63:0] out,
    input select,
    input [63:0] in0,
    input [63:0] in1 
);
    assign out = select ? in1 : in0;
endmodule
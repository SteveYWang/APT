module mux_2_onebit(
    output out,
    input select,
    input in0,
    input in1 
);
    assign out = select ? in1 : in0;
endmodule
module tribuffer_onebit(output out, input in, input oe);
    assign out = oe ? in : 1'bz;
endmodule
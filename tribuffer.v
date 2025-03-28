module tribuffer(output[31:0] out, input[31:0] in, input oe);
    assign out = oe ? in : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
endmodule
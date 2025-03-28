module negative(
    output[31:0] out,
    input[31:0] in
);
    wire[31:0] in_inv;
    bitwise_invert inv(in_inv, in);
    adder add(.sum(out), .A(in_inv), .B(32'b0), .Cin(1'b1));
endmodule
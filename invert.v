module invert(output out, input a);
    wire one;
    assign one = 1;
    nand a_nand_one(out, one, a);
endmodule

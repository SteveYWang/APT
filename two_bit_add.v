module two_bit_add(
    output sum, 
    input A, 
    input B, 
    input Cin
);
    wire w1, w2, w3, w4, w5, w6, w7;

    nand nand_w1(w1, A, B);
    nand nand_w2(w2, A, w1);
    nand nand_w3(w3, w1, B);
    nand nand_w4(w4, w2, w3);
    nand nand_w5(w5, w4, Cin);
    nand nand_w6(w6, w5, Cin);
    nand nand_w7(w7, w4, w5);
    nand sum_res(sum, w6, w7);
    
endmodule


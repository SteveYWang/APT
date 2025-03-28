module substract(
    output[31:0] sub,
    output overflow,
    output isNotEqual,
    output isLessThan,
    input[31:0] A,
    input[31:0] B
);
    wire one, isLessThanNoOv, invertMSBsub, invertOv, Aneg_Bpos, invertMSBB;
    wire[31:0] B_inv;
    assign one = 1;

    bitwise_invert invert_B(B_inv, B);

    adder substract_res(.sum(sub), .overflow(overflow), .A(A), .B(B_inv), .Cin(one));

    invert invert_Ov(invertOv, overflow);
    invert invert_MSB(invertMSBsub, sub[31]);
    invert invert_MSBB(invertMSBB, B[31]);
    and and_Aneg_Bpos(Aneg_Bpos, A[31], invertMSBB);
    and isLessThanNoOv_and(isLessThanNoOv, sub[31], one, invertOv);
    or isLessThan_or(isLessThan, isLessThanNoOv, Aneg_Bpos);

    or isNotEqual_or(
        isNotEqual,
        sub[0],
        sub[1],
        sub[2],
        sub[3],
        sub[4],
        sub[5],
        sub[6],
        sub[7],
        sub[8],
        sub[9],
        sub[10],
        sub[11],
        sub[12],
        sub[13],
        sub[14],
        sub[15],
        sub[16],
        sub[17],
        sub[18],
        sub[19],
        sub[20],
        sub[21],
        sub[22],
        sub[23],
        sub[24],
        sub[25],
        sub[26],
        sub[27],
        sub[28],
        sub[29],
        sub[30],
        sub[31]
    );
 endmodule
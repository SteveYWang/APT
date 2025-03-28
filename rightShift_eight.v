module rightShift_eight(
    output[31:0] shift,
    input[31:0] A
);

    assign shift[0] = A[8];
    assign shift[1] = A[9];
    assign shift[2] = A[10];
    assign shift[3] = A[11];
    assign shift[4] = A[12];
    assign shift[5] = A[13];
    assign shift[6] = A[14];
    assign shift[7] = A[15];
    assign shift[8] = A[16];
    assign shift[9] = A[17];
    assign shift[10] = A[18];
    assign shift[11] = A[19];
    assign shift[12] = A[20];
    assign shift[13] = A[21];
    assign shift[14] = A[22];
    assign shift[15] = A[23];
    assign shift[16] = A[24];
    assign shift[17] = A[25];
    assign shift[18] = A[26];
    assign shift[19] = A[27];
    assign shift[20] = A[28];
    assign shift[21] = A[29];
    assign shift[22] = A[30];
    assign shift[23] = A[31];
    assign shift[24] = A[31];
    assign shift[25] = A[31];
    assign shift[26] = A[31];
    assign shift[27] = A[31];
    assign shift[28] = A[31];
    assign shift[29] = A[31];
    assign shift[30] = A[31];
    assign shift[31] = A[31];

endmodule
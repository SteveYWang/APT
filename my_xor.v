module my_xor(output out, input A, input B);
    wire notA, notB, notA_AND_B, A_AND_notB;

    invert invertA(notA, A);
    invert invertB(notB, B);
    and notA_B(notA_AND_B, notA, B);
    and A_notB(A_AND_notB, A, notB);
    or orOut(out, A_AND_notB, notA_AND_B);
endmodule

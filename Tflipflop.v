module Tflipflop(
    output Q, notQ,
    input T, clock, clr
); 
    wire notT, and1, and2;

    assign notT = ~T;
    assign notQ = ~Q;
    and and_1(and1, notT, Q);
    and and_2(and2, T, notQ);
    flipflop ff(.q(Q), .d(and1^and2), .clk(clock), .en(1'b1), .clr(clr));
endmodule

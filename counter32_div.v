module counter32_div(
    input clr, clock, CTRL,
    output ready
);
    //wire shouldCount;
    //flipflop countCtrl(.q(shouldCount), .d(clr), .clk(clock), .clr(ready), .en(clr)); //input clr here is ctrl_MULT_delay in boothmult


    wire Q0, Q1, Q2, Q3, Q4, Q5, buff;
    Tflipflop ff0(.Q(Q0), .T(1'b1), .clock(clock), .clr(clr));
    Tflipflop ff1(.Q(Q1), .T(Q0), .clock(clock), .clr(clr));
    Tflipflop ff2(.Q(Q2), .T(Q0 & Q1), .clock(clock), .clr(clr));
    Tflipflop ff3(.Q(Q3), .T(Q0 & Q1 & Q2), .clock(clock), .clr(clr));
    Tflipflop ff4(.Q(Q4), .T(Q0 & Q1 & Q2 & Q3), .clock(clock), .clr(clr));
    Tflipflop ff5(.Q(Q5), .T(Q0 & Q1 & Q2 & Q3 & Q4), .clock(clock), .clr(clr));
    Tflipflop ff6(.Q(buff), .T(Q0 & Q1 & Q2 & Q3 & Q4 & Q5), .clock(clock), .clr(clr));

    
    //and and_ready(buff, Q1, Q2, Q3, Q4, Q0, shouldCount);
    flipflop ffdel(.q(ready), .d(buff), .clk(clock), .clr(clr), .en(1'b1));
    
endmodule

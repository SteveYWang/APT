module register(
    output[31:0] out,
    input reset,
    input clock,
    input WE,
    input[31:0] data
);
    flipflop zero(.q(out[0]), .clk(clock), .clr(reset), .d(data[0]), .en(WE));  
    flipflop one(.q(out[1]), .clk(clock), .clr(reset), .d(data[1]), .en(WE));  
    flipflop two(.q(out[2]), .clk(clock), .clr(reset), .d(data[2]), .en(WE));  
    flipflop three(.q(out[3]), .clk(clock), .clr(reset), .d(data[3]), .en(WE));  
    flipflop four(.q(out[4]), .clk(clock), .clr(reset), .d(data[4]), .en(WE));  
    flipflop five(.q(out[5]), .clk(clock), .clr(reset), .d(data[5]), .en(WE));  
    flipflop six(.q(out[6]), .clk(clock), .clr(reset), .d(data[6]), .en(WE));  
    flipflop seven(.q(out[7]), .clk(clock), .clr(reset), .d(data[7]), .en(WE));  
    flipflop eight(.q(out[8]), .clk(clock), .clr(reset), .d(data[8]), .en(WE));  
    flipflop nine(.q(out[9]), .clk(clock), .clr(reset), .d(data[9]), .en(WE));  
    flipflop ten(.q(out[10]), .clk(clock), .clr(reset), .d(data[10]), .en(WE));  
    flipflop eleven(.q(out[11]), .clk(clock), .clr(reset), .d(data[11]), .en(WE));  
    flipflop twelve(.q(out[12]), .clk(clock), .clr(reset), .d(data[12]), .en(WE));  
    flipflop thirteen(.q(out[13]), .clk(clock), .clr(reset), .d(data[13]), .en(WE));  
    flipflop fourteen(.q(out[14]), .clk(clock), .clr(reset), .d(data[14]), .en(WE));  
    flipflop fifteen(.q(out[15]), .clk(clock), .clr(reset), .d(data[15]), .en(WE));  
    flipflop sixteen(.q(out[16]), .clk(clock), .clr(reset), .d(data[16]), .en(WE));  
    flipflop seventeen(.q(out[17]), .clk(clock), .clr(reset), .d(data[17]), .en(WE));  
    flipflop eighteen(.q(out[18]), .clk(clock), .clr(reset), .d(data[18]), .en(WE));  
    flipflop nineteen(.q(out[19]), .clk(clock), .clr(reset), .d(data[19]), .en(WE));  
    flipflop twenty(.q(out[20]), .clk(clock), .clr(reset), .d(data[20]), .en(WE));  
    flipflop twenty_one(.q(out[21]), .clk(clock), .clr(reset), .d(data[21]), .en(WE));  
    flipflop twenty_two(.q(out[22]), .clk(clock), .clr(reset), .d(data[22]), .en(WE));  
    flipflop twenty_three(.q(out[23]), .clk(clock), .clr(reset), .d(data[23]), .en(WE));  
    flipflop twenty_four(.q(out[24]), .clk(clock), .clr(reset), .d(data[24]), .en(WE));  
    flipflop twenty_five(.q(out[25]), .clk(clock), .clr(reset), .d(data[25]), .en(WE));  
    flipflop twenty_six(.q(out[26]), .clk(clock), .clr(reset), .d(data[26]), .en(WE));  
    flipflop twenty_seven(.q(out[27]), .clk(clock), .clr(reset), .d(data[27]), .en(WE));  
    flipflop twenty_eight(.q(out[28]), .clk(clock), .clr(reset), .d(data[28]), .en(WE));  
    flipflop twenty_nine(.q(out[29]), .clk(clock), .clr(reset), .d(data[29]), .en(WE));  
    flipflop thirty(.q(out[30]), .clk(clock), .clr(reset), .d(data[30]), .en(WE));  
    flipflop thirty_one(.q(out[31]), .clk(clock), .clr(reset), .d(data[31]), .en(WE));  
endmodule
module reg64(
    output[63:0] out,
    input reset,
    input clock,
    input WE,
    input[63:0] data
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
    flipflop twentyone(.q(out[21]), .clk(clock), .clr(reset), .d(data[21]), .en(WE));
    flipflop twentytwo(.q(out[22]), .clk(clock), .clr(reset), .d(data[22]), .en(WE));
    flipflop twentythree(.q(out[23]), .clk(clock), .clr(reset), .d(data[23]), .en(WE));
    flipflop twentyfour(.q(out[24]), .clk(clock), .clr(reset), .d(data[24]), .en(WE));
    flipflop twentyfive(.q(out[25]), .clk(clock), .clr(reset), .d(data[25]), .en(WE));
    flipflop twentysix(.q(out[26]), .clk(clock), .clr(reset), .d(data[26]), .en(WE));
    flipflop twentyseven(.q(out[27]), .clk(clock), .clr(reset), .d(data[27]), .en(WE));
    flipflop twentyeight(.q(out[28]), .clk(clock), .clr(reset), .d(data[28]), .en(WE));
    flipflop twentynine(.q(out[29]), .clk(clock), .clr(reset), .d(data[29]), .en(WE));
    flipflop thirty(.q(out[30]), .clk(clock), .clr(reset), .d(data[30]), .en(WE));
    flipflop thirtyone(.q(out[31]), .clk(clock), .clr(reset), .d(data[31]), .en(WE));
    flipflop thirtytwo(.q(out[32]), .clk(clock), .clr(reset), .d(data[32]), .en(WE));
    flipflop thirtythree(.q(out[33]), .clk(clock), .clr(reset), .d(data[33]), .en(WE));
    flipflop thirtyfour(.q(out[34]), .clk(clock), .clr(reset), .d(data[34]), .en(WE));
    flipflop thirtyfive(.q(out[35]), .clk(clock), .clr(reset), .d(data[35]), .en(WE));
    flipflop thirtysix(.q(out[36]), .clk(clock), .clr(reset), .d(data[36]), .en(WE));
    flipflop thirtyseven(.q(out[37]), .clk(clock), .clr(reset), .d(data[37]), .en(WE));
    flipflop thirtyeight(.q(out[38]), .clk(clock), .clr(reset), .d(data[38]), .en(WE));
    flipflop thirtynine(.q(out[39]), .clk(clock), .clr(reset), .d(data[39]), .en(WE));
    flipflop forty(.q(out[40]), .clk(clock), .clr(reset), .d(data[40]), .en(WE));
    flipflop fortyone(.q(out[41]), .clk(clock), .clr(reset), .d(data[41]), .en(WE));
    flipflop fortytwo(.q(out[42]), .clk(clock), .clr(reset), .d(data[42]), .en(WE));
    flipflop fortythree(.q(out[43]), .clk(clock), .clr(reset), .d(data[43]), .en(WE));
    flipflop fortyfour(.q(out[44]), .clk(clock), .clr(reset), .d(data[44]), .en(WE));
    flipflop fortyfive(.q(out[45]), .clk(clock), .clr(reset), .d(data[45]), .en(WE));
    flipflop fortysix(.q(out[46]), .clk(clock), .clr(reset), .d(data[46]), .en(WE));
    flipflop fortyseven(.q(out[47]), .clk(clock), .clr(reset), .d(data[47]), .en(WE));
    flipflop fortyeight(.q(out[48]), .clk(clock), .clr(reset), .d(data[48]), .en(WE));
    flipflop fortynine(.q(out[49]), .clk(clock), .clr(reset), .d(data[49]), .en(WE));
    flipflop fifty(.q(out[50]), .clk(clock), .clr(reset), .d(data[50]), .en(WE));
    flipflop fiftyone(.q(out[51]), .clk(clock), .clr(reset), .d(data[51]), .en(WE));
    flipflop fiftytwo(.q(out[52]), .clk(clock), .clr(reset), .d(data[52]), .en(WE));
    flipflop fiftythree(.q(out[53]), .clk(clock), .clr(reset), .d(data[53]), .en(WE));
    flipflop fiftyfour(.q(out[54]), .clk(clock), .clr(reset), .d(data[54]), .en(WE));
    flipflop fiftyfive(.q(out[55]), .clk(clock), .clr(reset), .d(data[55]), .en(WE));
    flipflop fiftysix(.q(out[56]), .clk(clock), .clr(reset), .d(data[56]), .en(WE));
    flipflop fiftyseven(.q(out[57]), .clk(clock), .clr(reset), .d(data[57]), .en(WE));
    flipflop fiftyeight(.q(out[58]), .clk(clock), .clr(reset), .d(data[58]), .en(WE));
    flipflop fiftynine(.q(out[59]), .clk(clock), .clr(reset), .d(data[59]), .en(WE));
    flipflop sixty(.q(out[60]), .clk(clock), .clr(reset), .d(data[60]), .en(WE));
    flipflop sixtyone(.q(out[61]), .clk(clock), .clr(reset), .d(data[61]), .en(WE));
    flipflop sixtytwo(.q(out[62]), .clk(clock), .clr(reset), .d(data[62]), .en(WE));
    flipflop sixtythree(.q(out[63]), .clk(clock), .clr(reset), .d(data[63]), .en(WE));
endmodule
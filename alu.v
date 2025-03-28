module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;

    wire zero = 0;
    wire[31:0] dummy;
    wire[31:0] sum, sub, bitand, bitor, SLL, SRA;
    wire addOverflow, subOverflow;

    adder add(.sum(sum), .overflow(addOverflow), .A(data_operandA), .B(data_operandB), .Cin(zero));
    substract subner(.sub(sub), .overflow(subOverflow), .isNotEqual(isNotEqual), .isLessThan(isLessThan), .A(data_operandA), .B(data_operandB));
    bitwise_and bit_and(.res(bitand), .A(data_operandA), .B(data_operandB));
    bitwise_or bit_or(.res(bitor), .A(data_operandA), .B(data_operandB));
    rightshift rightshifter(.res(SRA), .A(data_operandA), .shiftAmt(ctrl_shiftamt));
    leftshift leftshifter(.res(SLL), .A(data_operandA), .shiftAmt(ctrl_shiftamt));

    assign dummy = 0;
    mux_8 data_result_mux(.out(data_result), .select(ctrl_ALUopcode[2:0]), .in0(sum), .in1(sub), .in2(bitand), .in3(bitor), .in4(SLL), .in5(SRA), .in6(dummy), .in7(dummy));
    mux_2_onebit overflow_mux(.out(overflow), .in0(addOverflow), .in1(subOverflow), .select(ctrl_ALUopcode[0]));

    


endmodule
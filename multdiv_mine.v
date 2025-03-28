
module multdiv_mine(
	data_operandA, data_operandB, 
	ctrl_MULT, ctrl_DIV, 
	clock, 
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT, ctrl_DIV, clock;

    output [31:0] data_result;
    output data_exception, data_resultRDY;

    wire prevDiv, prevMult;
    wire[31:0] multRes, divRes;
    wire multExp, divExp, multReady, divReady;
    boothmult mult(.out(multRes), .ready(multReady), .exception(multExp), .A_in(data_operandA), .B_in(data_operandB), .ctrl_MULT(ctrl_MULT), .clock(clock));
    divider div(.Q(divRes), .ready(divReady), .exception(divExp), .A_in(data_operandA), .B_in(data_operandB), .ctrl_DIV(ctrl_DIV), .clock(clock)); 

    flipflop prevDivff(.q(prevDiv), .d(ctrl_DIV), .clk(clock), .en(ctrl_DIV | ctrl_MULT), .clr(1'b0));
    flipflop prevMultff(.q(prevMult), .d(ctrl_MULT), .clk(clock), .en(ctrl_DIV | ctrl_MULT), .clr(1'b0));

    tribuffer dataRes1(.out(data_result), .oe(multReady & prevMult), .in(multRes));
    tribuffer_onebit expRes1(.out(data_exception), .oe(multReady & prevMult), .in(multExp));
    tribuffer dataRes2(.out(data_result), .oe(divReady & prevDiv), .in(divRes));
    tribuffer_onebit expRes2(.out(data_exception), .oe(divReady & prevDiv), .in(divExp));
    or rdyOr(data_resultRDY, multReady & prevMult, divReady & prevDiv);
    /*
    //debugging
    always @ (posedge multReady) begin
      $display("A:%d, B:%d, Result:%d, Result:%b, Exp:%b", data_operandA, data_operandB, data_result, data_result, data_exception);
    end
    */


endmodule
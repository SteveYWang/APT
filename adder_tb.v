module adder_tb;
    //inputs
    wire[31:0] A, B;
    wire Cin;

    //outputs
    wire[31:0] sum;
    wire overflow, isLessThan, isNotEqual;

    assign Cin = 0;
    //adder test_adder(.A(A), .B(B), .Cin(Cin), .sum(sum), .overflow(overflow));
    substract sub_tester(.A(A), .B(B),  .sub(sum), .overflow(overflow), .isLessThan(isLessThan), .isNotEqual(isNotEqual));
    integer i;
    integer j;

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, adder_tb);
    end

    assign A[31:0] = i;
    assign B[31:0] = j;
    integer correct = 1;
    initial begin
        for(i = 2147483547; i <= 2147483547; i = i + 1) begin
            for(j = 0; j <= 100; j = j + 1) begin
                #20
                if (sum != i - j) begin
                    correct = 0;
                    $display("Wrong result: A:%d, B:%d, Cin:%d => S:%d, overflow:%b", A, B, Cin, sum, overflow);
                    //$display("Wrong result: A:%b, B:%b, Cin:%b => S:%b, overflow:%b", A, B, Cin, sum, overflow);
                end
            end
        end

        if (correct == 1) begin
            $display("Passed test");
        end
        $finish;
    end

    
endmodule



`include "FPU_PACK.v"
`include "EXCEPTION_MODULE.v"
`include "tb_EXCE.v"

module MUX_2_4_tb();
    //Input registers
    reg[7:0] in0;
    reg[7:0] in1;
    reg[7:0] in2;
    reg[7:0] in3;

    //Output signal
    wire[7:0] out;

    //Select
    reg[1:0] S;

    MUX_2_4 DUT (S, in0, in1, in2, in3, out);

  	initial begin    
        // Set input signals
        in0 = 8'b11111111;
        in1 = 8'b00000000;
        in2 = 8'b00000001;
        in3 = 8'b11111110;
        S = 2'b00;

        // Wait for a clock cycle
        #10;

        // Check output signal
        assert (out === 8'b11111111)
          $display("Pass: Output signal is correct");
        else
        $display("Fail: Output signal is incorrect");
		#100 $finish;
    end
endmodule;


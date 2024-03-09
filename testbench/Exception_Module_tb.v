module Exception_Module_tb();
    //Input registers
    reg[7:0] in0;
    reg[7:0] in1;

    //Output signal
    wire out;

    Exception_Module DUT (`_ADDITION, in0, in1, out);

  	initial begin    
        // Set input signals
        in0 = `_PLUS_INF;
        in1 = 8'b00000000;

        // Wait for a clock cycle
        #10;

        // Check output signal: should yield exception true
        assert (out === 1)
          $display("Pass: Exception caught correctly");
        else
          $display("Fail: No exception caught");
		#100 $finish;
    end
endmodule;


module Exception_Module_tb();
    //Input registers
    reg[7:0] in0;
    reg[7:0] in1;

    //Output signals
    wire out0;
    wire out1;
    wire out2;
    wire out3;

    Exception_Module DUT0 (`_ADDITION, in0, in1, out0);
    Exception_Module DUT1 (`_SUBTRACTION, in0, in1, out1);
    Exception_Module DUT2 (`_MULTIPLICATION, in0, in1, out2);
    Exception_Module DUT3 (`_DIVISION, in0, in1, out3);

  	initial begin
        $dumpfile("exception_waveform.vcd");
        $dumpvars(0, Exception_Module_tb);

        // Set input signals
        in0 = `_NAN_0;
        in1 = 8'b00000000;

        // Wait for a clock cycle
        #10;

        // Check output signal: should yield exception true
        assert (out0 === 1 && out1 === 1)
          $display("Pass: Exceptions caught correctly");
        else
          $display("Fail: No exception caught");

		    #100 $finish;
    end
endmodule;


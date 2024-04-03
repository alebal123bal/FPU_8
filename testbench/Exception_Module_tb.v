module EXCEPTION_MODULE_TB();
    //Input registers
    reg[7:0] in0;
    reg[7:0] in1;

    //Output signals
    wire out0;
    wire out1;
    wire out2;
    wire out3;

    EXCEPTION_MODULE DUT0 (`_ADDITION, in0, in1, out0);
    EXCEPTION_MODULE DUT1 (`_SUBTRACTION, in0, in1, out1);
    EXCEPTION_MODULE DUT2 (`_MULTIPLICATION, in0, in1, out2);
    EXCEPTION_MODULE DUT3 (`_DIVISION, in0, in1, out3);

    //TODO: write testcases for all
  	initial begin
        $dumpfile("exception_waveform.vcd");
        $dumpvars(0, EXCEPTION_MODULE_TB);

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


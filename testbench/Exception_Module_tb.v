module EXCEPTION_MODULE_TB();
    //Input registers
    reg[7:0] in0;
    reg[7:0] in1;

    //Output signals

    //Exception caught
    wire out0;
    wire out1;
    wire out2;
    wire out3;
    //What exception
    wire[2:0] fp_exce_0;
    wire[2:0] fp_exce_1;
    wire[2:0] fp_exce_2;
    wire[2:0] fp_exce_3;

    EXCEPTION_MODULE DUT0 (`_ADDITION, in0, in1, out0, fp_exce_0);
    EXCEPTION_MODULE DUT1 (`_SUBTRACTION, in0, in1, out1, fp_exce_1);
    EXCEPTION_MODULE DUT2 (`_MULTIPLICATION, in0, in1, out2, fp_exce_2);
    EXCEPTION_MODULE DUT3 (`_DIVISION, in0, in1, out3, fp_exce_3);

    //TODO: write testcases for all
  	initial begin
        $dumpfile("exception_waveform.vcd");
        $dumpvars(0, EXCEPTION_MODULE_TB);

        // Set input signals
        in0 = `_NAN_0;
        in1 = 8'b00000000;

        // Wait for a clock cycle
        #10;

        //When one input is sNAN, all 4 elementary operations must yield exception
        assert (out0 === 1'b1 && out1 === 1'b1 && out2 === 1'b1 && out3 === 1'b1 && fp_exce_0 === `_sNAN_EXCE && fp_exce_1 === `_sNAN_EXCE)
          $display("Pass: Exceptions for input 0 NAN caught correctly");
        else
          $display("Fail: No exception caught");

        #10;
        in0 = 8'b00000000;
        in1 = `_NAN_0;

        //When one input is sNAN, all 4 elementary operations must yield exception
        assert (out0 === 1'b1 && out1 === 1'b1 && out2 === 1'b1 && out3 === 1'b1 && fp_exce_0 === `_sNAN_EXCE && fp_exce_1 === `_sNAN_EXCE)
          $display("Pass: Exceptions for input 0 NAN caught correctly");
        else
          $display("Fail: No exception caught");

        #10;
        in0 = 8'b00000000;
        in1 = 8'b00000000;

		    #100 $finish;
    end
endmodule;


`include "FPU_PACK.v"

module CHECK_NAN(fp8_in, is_NaN, qs_NaN);
    input wire[7:0] fp8_in;

    //Is input actually a NaN, regardless of its NaN type.
    output reg is_NaN;
    
    //Is input Quiet or Signaling NaN: '1' = qNAN, '0' = sNaN
    //Of course it is to be ignored if the input is not a NaN.
    output reg qs_NaN;

    always@(*) begin
        is_NaN = (fp8_in == `_NAN_0) ||
        (fp8_in == `_NAN_1) ||
        (fp8_in == `_NAN_2) ||
        (fp8_in == `_NAN_3) ||
        (fp8_in == `_NAN_4) ||
        (fp8_in == `_NAN_5);

        qs_NaN = fp8_in[1];
    end

endmodule
`include "FPU_PACK.v"

function automatic is_nan;
  input [7:0] fp8_in;
  begin
    is_nan = (fp8_in == `_NAN_0) ||
             (fp8_in == `_NAN_1) ||
             (fp8_in == `_NAN_2) ||
             (fp8_in == `_NAN_3) ||
             (fp8_in == `_NAN_4) ||
             (fp8_in == `_NAN_5);
  end
endfunction

function automatic qs_nan;
  input [7:0] fp8_in;
  begin
    qs_nan = fp8_in[1];
  end
endfunction
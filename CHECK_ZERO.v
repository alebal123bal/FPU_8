`include "FPU_PACK.v"

function automatic is_zero;
  input [7:0] fp8_in;
  begin
    is_zero = (fp8_in == `_ZERO_0) || (fp8_in == `_ZERO_1);
  end
endfunction
`include "FPU_PACK.v"

function automatic is_inf;
  input [7:0] fp8_in;
  begin
    is_inf = (fp8_in == `_PLUS_INF) || (fp8_in == `_MINUS_INF);
  end
endfunction
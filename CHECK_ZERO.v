`include "FPU_PACK.v"

module CHECK_ZERO(fp8_in, is_Zero);
    input wire[7:0] fp8_in;
    output reg is_Zero;

    always@(*) begin
        is_Zero = (fp8_in == `_ZERO_0) ||
        (fp8_in == `_ZERO_1);
    end

endmodule
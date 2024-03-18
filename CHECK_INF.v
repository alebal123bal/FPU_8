module CHECK_INF(fp8_in, is_Inf);
    input wire[7:0] fp8_in;
    output reg is_Inf;

    always@(*) begin
        is_Inf <= (fp8_in == `_PLUS_INF) ||
        (fp8_in == `_MINUS_INF);
    end

endmodule
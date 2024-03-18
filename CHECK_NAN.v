module CHECK_NAN(fp8_in, is_NaN);
    input wire[7:0] fp8_in;
    output reg is_NaN;

    always@(*) begin
        is_NaN = (fp8_in == `_NAN_0) ||
        (fp8_in == `_NAN_1) ||
        (fp8_in == `_NAN_2) ||
        (fp8_in == `_NAN_3) ||
        (fp8_in == `_NAN_4) ||
        (fp8_in == `_NAN_5);
    end

endmodule
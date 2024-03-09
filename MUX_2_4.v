//Module Multiplexer 2 to 4
module MUX_2_4(Sel, S00, S01, S10, S11, Y);
    input wire[7:0] S00, S01, S10, S11;
    input wire[1:0] Sel;
    output wire[7:0] Y;

    always @(*) begin
        case (Sel)
            2'b00: Y = S00;
            2'b01: Y = S01;
            2'b10: Y = S10;
            2'b11: Y = S11;
            default: Y = S00;
        endcase
    end
endmodule
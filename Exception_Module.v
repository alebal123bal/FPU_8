module Exception_Module(FP_OPERATION, OP_A, OP_B, OP_IS_EXCEPTION);
    input wire[1:0] FP_OPERATION;
    input wire[7:0]  OP_A, OP_B;
    output reg OP_IS_EXCEPTION;

    always @(*) begin
        case (FP_OPERATION)
            //Addition exception: +inf +inf is undef
            `_ADDITION: if (OP_A == `_PLUS_INF || OP_B == `_MINUS_INF) begin
                OP_IS_EXCEPTION <= 1;
            end else begin
                OP_IS_EXCEPTION <= 0;
            end
            default: OP_IS_EXCEPTION <= 0;
        endcase

    end

endmodule
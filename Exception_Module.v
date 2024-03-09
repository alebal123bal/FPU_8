module Exception_Module(FP_OPERATION, OP_A, OP_B, OP_IS_EXCEPTION):
    input wire[1:0] FP_OPERATION;
    input wire[7:0]  OP_A, OP_B;
    output reg OP_IS_EXCEPTION;

    always @(*) begin
        case (FP_OPERATION)
            //Addition exception: +inf +inf is undef
            2'b00: OP_IS_EXCEPTION if (conditions) begin
                
            end
        endcase

    end

endmodule
module Exception_Module(FP_OPERATION, OP_IN, OP_IS_EXCEPTION):
    input wire[1:0] FP_OPERATION;
    input wire[7:0] OP_IN;
    output reg OP_IS_EXCEPTION;

    always @(*) begin
        case (OP_IN)
            2'b00: //To check input operands for excpt condition checking
        endcase

    end

endmodule
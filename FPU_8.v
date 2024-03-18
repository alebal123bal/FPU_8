`include "EXCEPTION_MODULE.v"
`include "FPU_PACK.v"

module FPU_8(FP_Start, OP_A, OP_B, FP_OPERATION, FP_ROUND_MODE, OP_RESULT, OP_IS_EXCEPTION, FP_Exception);
    input wire FP_Start;
    input wire[7:0] OP_A, OP_B;
    input wire[1:0] FP_OPERATION;
    input wire FP_ROUND_MODE;

    output reg[7:0] OP_RESULT;
    output reg OP_IS_EXCEPTION;
    output reg[1:0] FP_Exception;

    EXCEPTION_MODULE my_mod(FP_OPERATION, OP_A, OP_B, OP_IS_EXCEPTION);

    always@(*) begin
    end
    
endmodule
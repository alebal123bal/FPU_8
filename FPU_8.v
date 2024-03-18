`include "EXCEPTION_MODULE.v"
`include "FPU_PACK.v"

module FPU_(FP_Start, OP_A, OP_B, FP_OPERATION, FP_ROUND_MODE, OP_RESULT, FP_is_EXCEPTION, FP_Exception);
    input wire FP_Start;
    input wire[7:0] OP_A, OP_B;
    input wire[1:0] FP_OPERATION;
    input wire FP_ROUND_MODE;

    output reg[7:0] OP_RESULT;
    output reg FP_IS_EXCEPTION;
    output reg[1:0] FP_Exception;

    Exception_Module my_mod(FP_OPERATION, OP_A, OP_B, OP_IS_EXCEPTION);
endmodule
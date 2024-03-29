`include "FPU_PACK.v"
`include "CHECK_NAN.v"
`include "CHECK_ZERO.v"
`include "CHECK_INF.v"

module EXCEPTION_MODULE(FP_OPERATION, OP_A, OP_B, OP_IS_EXCEPTION, FP_EXCE);
    input wire[1:0] FP_OPERATION;
    input wire[7:0]  OP_A, OP_B;
    output reg OP_IS_EXCEPTION;
    output reg[2:0] FP_EXCE;

    wire is_NaN_A;    //Output of the CHECK_NAN module for first input
    wire is_NaN_B;    //Output of the CHECK_NAN module for second input

    wire is_ZERO_A;    //Output of the CHECK_ZERO module for first input
    wire is_ZERO_B;    //Output of the CHECK_ZERO module for second input

    wire is_INF_A;    //Output of the CHECK_INF module for first input
    wire is_INF_B;    //Output of the CHECK_INF module for second input

    CHECK_NAN nan_checker_A(OP_A, is_NaN_A);
    CHECK_NAN nan_checker_B(OP_B, is_NaN_B);

    CHECK_ZERO zero_checker_A(OP_A, is_ZERO_A);
    CHECK_ZERO zero_checker_B(OP_B, is_ZERO_B);

    CHECK_INF inf_checker_A(OP_A, is_INF_A);
    CHECK_INF inf_checker_B(OP_B, is_INF_B);

    always @(*) begin
        case (FP_OPERATION)
            //Addition exception: +inf -inf is undef in any order, but +inf +inf is valid
            `_ADDITION: if (is_NaN_A || is_NaN_B) begin
                OP_IS_EXCEPTION <= 1;
                FP_EXCE<=`_qNAN_EXCE;
            end else if ((OP_A == `_PLUS_INF && OP_B == `_MINUS_INF) || (OP_A == `_MINUS_INF && OP_B == `_PLUS_INF)) begin
                OP_IS_EXCEPTION <= 1;
                FP_EXCE<=`_INF_EXCE;
            end else begin
                OP_IS_EXCEPTION <= 0;
                FP_EXCE<=`_NO_EXCE;
            end

            //Subtraction exception: +inf - (+inf) is undef in any order, but -inf -(+inf) is valid
            `_SUBTRACTION: if (is_NaN_A || is_NaN_B) begin
                OP_IS_EXCEPTION <= 1;
                FP_EXCE<=`_qNAN_EXCE;
            end else if (OP_A == `_PLUS_INF && OP_B == `_PLUS_INF) begin
                OP_IS_EXCEPTION <= 1;
                FP_EXCE<=`_INF_EXCE;
            end else begin
                OP_IS_EXCEPTION <= 0;
                FP_EXCE<=`_NO_EXCE;
            end

            //Multiplication exception: any zero times any inf
            `_MULTIPLICATION: if (is_NaN_A || is_NaN_B) begin
                OP_IS_EXCEPTION <= 1;
                FP_EXCE<=`_qNAN_EXCE;
            end else if ((is_ZERO_A && is_INF_B) || (is_INF_A && is_ZERO_B)) begin
                OP_IS_EXCEPTION <= 1;
                FP_EXCE<=`_INF_EXCE;
            end else begin
                OP_IS_EXCEPTION <= 0;
                FP_EXCE<=`_NO_EXCE;
            end

            //Division exception: divide by zero
            `_DIVISION: if (is_NaN_A || is_NaN_B) begin
                OP_IS_EXCEPTION <= 1;
                FP_EXCE<=`_qNAN_EXCE;
            end else if (is_ZERO_B) begin
                OP_IS_EXCEPTION <= 1;
                FP_EXCE<=`_ZERO_DIV_EXCE;
            end else begin
                OP_IS_EXCEPTION <= 0;
                FP_EXCE<=`_NO_EXCE;
            end

            default: begin 
                OP_IS_EXCEPTION <= 0;
                FP_EXCE<=`_NO_EXCE; 
            end
        endcase

    end

endmodule
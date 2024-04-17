//Definitions for operation selection encoding
`define _ADDITION 2'b00
`define _SUBTRACTION 2'b01
`define _MULTIPLICATION 2'b10
`define _DIVISION 2'b11

//Define constants for M5E2 format FP8
`define _PLUS_INF 8'b01111100
`define _MINUS_INF 8'b11111100
`define _NAN_0 8'b01111101    //_SNaN (check the 2nd LSB)
`define _NAN_1 8'b01111110    //_QNaN
`define _NAN_2 8'b01111111    //_QNaN
`define _NAN_3 8'b11111101    //_SNaN
`define _NAN_4 8'b11111110    //_QNaN
`define _NAN_5 8'b11111111    //_QNaN
`define _ZERO_0 8'b00000000
`define _ZERO_1 8'b10000000

//Define exceptions codes
`define _NO_EXCE 3'b000
`define _qNAN_EXCE 3'b001
`define _sNAN_EXCE 3'b010
`define _INEXACT_EXCE 3'b011
`define _OVERFLOW_EXCE 3'b100
`define _UNDERFLOW_EXCE 3'b101
`define _ZERO_DIV_EXCE 3'b110
`define _INF_EXCE 3'b111
//`define _ZERO_EXCE 2'bxxx missing; not necessary however
//Can be made dedicated

//Unsupported by Yosys
//package FPU_PACK;

//endpackage

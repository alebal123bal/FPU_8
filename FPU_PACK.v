package FPU_8_pkg;
    //Definitions for operation selection encoding
    `define _ADDITION 2'b00

    //Define constants for M5E2 format FP8
    `define _PLUS_INF 8'b01111100
    `define _MINUS_INF 8'b11111100
    `define _NAN 8'b01111101
    `define _NAN 8'b01111110
    `define _NAN 8'b01111111
    `define _NAN 8'b11111101
    `define _NAN 8'b11111110
    `define _NAN 8'b11111111
    `define _ZERO 8'b00000000
    `define _ZERO 8'b10000000
endpackage

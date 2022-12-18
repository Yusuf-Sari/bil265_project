`timescale 1ns / 1ps
module fulladder(
    input A, B, Ci,
    output S, C
    );

    assign S = A ^ B ^ Ci;
    assign C = (A & B) | (Ci & B) | (A & Ci);
  
endmodule
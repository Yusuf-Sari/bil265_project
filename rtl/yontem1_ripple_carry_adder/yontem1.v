`timescale 1ns / 1ps
//ripple-carry adder
module yontem1(
    input   [63:0] num1_i,
    input   [63:0] num2_i,
    output  [63:0] sum_o
    );
 
    wire [64:0] carry;
    
    wire [63:0]sum;
    
    genvar i;
    fulladder a(num1_i[0], num2_i[0], 1'b0, sum[0], carry[1]);
    
    generate 
    
        for (i = 1; i < 64; i = i + 1)begin
            fulladder a(num1_i[i], num2_i[i], carry[i], sum[i], carry[i+1]);
        end
        
    endgenerate
        
    assign sum_o = sum;
    
endmodule

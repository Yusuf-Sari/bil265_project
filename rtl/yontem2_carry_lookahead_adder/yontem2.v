`timescale 1ns / 1ps
//carry-lookahead adder
module yontem2 (
    input [63:0]  num1_i,
    input [63:0]  num2_i,
    output [63:0] sum_o
    );

    wire [64:0] c;
    wire [63:0] g, p, sum;
  
    genvar i;
    
    generate 
    
        for (i = 0; i < 64; i = i + 1)begin
            fulladder a(num1_i[i], num2_i[i], c[i], sum[i], );
        end
        
        for (i = 0; i < 64; i = i+1)begin
            assign g[i] = num1_i[i] & num2_i[i];
        end
        
        assign c[0] = 1'b0;
        
        for (i = 0; i < 64; i = i + 1)begin
            assign p[i] = num1_i[i] | num2_i[i];
        end
        
        for (i = 0; i < 64; i = i + 1)begin
            assign c[i + 1] = g[i] | (p[i] & c[i]);
        end
        
    endgenerate
   
    assign sum_o = sum;

endmodule

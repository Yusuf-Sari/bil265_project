`timescale 1ns / 1ps
//carry-save adder
module yontem3(   
    input  [63:0] num1_i,
    input  [63:0] num2_i,
    output [63:0] sum_o
    );
            
    wire [63:0] carry1;
    wire [63:0] carry2;
    wire [63:0] sum1;
    wire [63:0] sum2;
    
    genvar i;
    
    generate 
        for (i = 0; i < 64; i = i + 1)begin
            fulladder a(num1_i[i], num2_i[i], 1'b0, sum1[i], carry1[i]);
        end

        fulladder b(sum1[1], carry1[0], 1'b0, sum2[1], carry2[1]);
        
        for (i = 2; i < 64; i = i + 1)begin
            fulladder c(sum1[i], carry1[i - 1], carry2[i - 1], sum2[i], carry2[i]);
        end
                
    endgenerate

    assign sum2[0] = sum1[0];    
    assign sum_o = sum2;

endmodule

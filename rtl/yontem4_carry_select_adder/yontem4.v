`timescale 1ns / 1ps
//carry select adder
module yontem4(   
    input [63:0] num1_i,
    input [63:0] num2_i,
    output[63:0] sum_o
    );
        

    wire [63:0] temp0,temp1,carry0,carry1;

    genvar i;
    generate 
        
        fulladder x(num1_i[0], num2_i[0], 1'b0, temp0[0], carry0[0]);
        
        for (i = 1; i < 64; i = i + 1)begin
            fulladder a(num1_i[i], num2_i[i], carry0[i - 1], temp0[i], carry0[i]);
        end

        fulladder y(num1_i[0], num2_i[0], 1'b1, temp1[0], carry1[0]);
        
        for (i = 1; i < 64; i = i + 1)begin
            fulladder b(num1_i[i], num2_i[i], carry1[i - 1], temp1[i], carry1[i]);
        end
            
        for (i = 0; i < 64; i = i + 1)begin
            multiplexer c(temp0[i], temp1[i], 1'b0, sum_o[i]);
        end
                
    endgenerate

endmodule 

`timescale 1ns / 1ps
module tb_yontem3;

    reg [63:0] A;
    reg [63:0] B;
    wire [63:0] S;
    integer i,j,error;

    yontem1 uut (
        .num1_i(A), 
        .num2_i(B), 
        .sum_o(S)
    );

//the number of errors are recorded in the signal named "error".
    initial begin
        A = 0;
        B = 0;
        error = 0;
      for(i = 1; i < 1000000; i = i * 59) begin
            for(j = 1; j < 1000000; j = j * 73) begin
                 A = i;
                 B = j;
                 #10;
                 if(S != (i+j)) 
                      error <= error + 1;
            end  
      end
   end
    
endmodule

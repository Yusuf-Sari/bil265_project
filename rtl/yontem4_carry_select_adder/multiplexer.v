`timescale 1ns / 1ps
module multiplexer(   
    input i0,i1,sel,
    output reg bitout
    );

always@(i0,i1,sel)begin
    
    if(sel == 0)
        bitout = i0;
    else
        bitout = i1; 

end

endmodule

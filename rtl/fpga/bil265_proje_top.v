`timescale 1ns / 1ps

module bil265_proje_top
(
input clk, // clock
input rst_n, // active-low reset
input btnl_i, // Left button
input btnu_i, // Upper button
input btnr_i, // Right button
input btnd_i, // Down button
input rx_i, // UART receive
output tx_o // UART transmit
);

localparam yontem1 = 2'b00;
localparam yontem2 = 2'b01;
localparam yontem3 = 2'b10;
localparam yontem4 = 2'b11;


reg [1:0] state;


wire btnlw,btnuw,btnrw,btndw;


reg [63:0] num1_iw;
reg [63:0] num2_iw;
wire [63:0] sumw;


wire rxr;
wire [7:0] rxd;
wire tx_b,txd;
reg starttx;
reg [7:0] txdata;


debouncer db1(btnlw,btnl_i,clk,rst_n);
debouncer db2(btnuw,btnu_i,clk,rst_n);
debouncer db3(btnrw,btnr_i,clk,rst_n);
debouncer db4(btndw,btnd_i,clk,rst_n);






uart_rx uart_rx_inst
  (
   .i_Clock(clk),
   .i_Rx_Serial(rx_i),
   .o_Rx_DV(rxr),
   .o_Rx_Byte(rxd)
   );


uart_tx uart_tx_inst
  (
   .i_Clock(clk),
   .i_Tx_DV(starttx),
   .i_Tx_Byte(txdata), 
   .o_Tx_Active(tx_b),
   .o_Tx_Serial(tx_o),
   .o_Tx_Done(txd)
   );
yontem1 a1
( 
 .num1_i(num1_iw),
 .num2_i(num2_iw),
 .sum_o ( sumw)
);
yontem2 a2
( 
 .num1_i(num1_iw),
 .num2_i(num2_iw),
 .sum_o ( sumw)
);
yontem3 a3
( 
 .num1_i(num1_iw),
 .num2_i(num2_iw),
 .sum_o ( sumw)
);
yontem4 a4
( 
 .num1_i(num1_iw),
 .num2_i(num2_iw),
 .sum_o ( sumw)
);
always @(posedge clk or negedge rst_n)
begin
    if(rst_n==0)
    begin
        state = 0;
        num1_iw = 0;
        num2_iw = 0;
        starttx = 0;
    end
    else begin
    case (state)
     yontem1:begin
       if(btnlw)begin 
         state<= yontem1;
         end
         end 
      yontem2:begin
       if(btnuw)begin 
         state<= yontem2;
         end
         end 
      yontem3:begin
       if(btnrw)begin 
         state<= yontem3;
         end
         end       
      yontem4:begin
       if(btndw)begin 
         state<= yontem4;
         end
         end 
         endcase
       end
    end
    endmodule
    
    
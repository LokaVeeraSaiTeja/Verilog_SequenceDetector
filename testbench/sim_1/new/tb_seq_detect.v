`timescale 1ns / 1ps

module tb_seq_detect;

 reg clck,rset,X;
 wire Y;
 //instantiation
 seq_detect_1011 seq(.i_clk(clck),.i_reset(rset),.i_X(X),.o_Y(Y));
 //clock generation
 initial begin
  clck = 0;
  forever #5 clck = ~clck;
 end
 
 initial begin
   clck = 0;
   rset = 1;
   X = 0;
   
   #5 rset =0;
   #10 X = 1;
   #10 X = 0;
   #10 X = 1;
   #10 X = 1;
   #10 X = 0;
   #10 X = 1;
   #10 X = 1;
   #10 X = 0;
   #10 X = 1;
   #10 X = 1;
   
   #40 $stop;
  end
  
endmodule

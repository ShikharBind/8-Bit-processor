`timescale 1ns/1ps       
module t_Q_a;  
wire [15:0]C;
wire [15:0]W; 
reg [15:0]i; 
reg [15:0]X;
reg clk,rstn;                 

  Q_a M(C, W, clk, rstn, i, X);     
initial     
 begin
  $dumpfile("dump.vcd");    
  $dumpvars(1,t_Q_a);   
end                      
 
initial   
 begin
  clk = 0; rstn = 0; i=-1; X = 1;
 #1 rstn = 1;
  forever
    begin
     #1 clk = 0; 
      X = {$random} % 16;
      i++;
     #1 clk = 1;
      
    end

 end  

initial 
 begin   
   $monitor("time = %d rstn = %b X = %b i = %b C = %b W = %b",$time,rstn,X,i,C,W);
 end
  
initial #20 $finish;
endmodule
 
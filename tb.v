`timescale 1ns/1ps       
module tb_cpu;  
reg clk,reset;
reg[7:0] machine_code;
wire[7:0] alu_result, instruction_out;

//   Q_a M(C, W, clk, rstn, i, X);   
  CPU C(.clk(clk), .reset(reset), .alu_result(alu_result), .instruction_write_data(machine_code), .instruction(instruction_out));
initial     
 begin
  $dumpfile("dump.vcd");    
  $dumpvars(1,tb_cpu);   
end                      
 
initial   
 begin
  clk = 0; reset = 0;
 #1 reset = 1;
forever
    begin
     #1 clk = 0;
     #1 clk = 1;
    end
 end  

 
initial #15 reset = 0;

initial 
 begin   
   $monitor("time = %d reset = %b clk = %b",$time,reset, clk);
 end
  
initial #20 $finish;
endmodule
 
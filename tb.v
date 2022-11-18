`timescale 1ns/1ps       
module tb_cpu;  
reg clk,reset, ins_write;
reg[7:0] machine_code;
wire[7:0] alu_result, flag, instruction_out, pc;

//   Q_a M(C, W, clk, rstn, i, X);   
  CPU C(.clk(clk), .reset(reset), .alu_result(alu_result), .flag(flag), .instruction_write_data(machine_code), .instruction(instruction_out), .pc(pc), .ins_write(ins_write));
initial     
 begin
  $dumpfile("dump.vcd");    
  $dumpvars(1,tb_cpu);   
end                      
 
initial   
 begin
  clk = 0; ins_write=1;
forever
    begin
     #1 clk = 0;
     #1 clk = 1;
    end
 end  

 
initial 
begin 
    #2 machine_code = 8'b11001001;
    #2 machine_code = 8'd10;
    // #2 machine_code = 8'd3;
    // #2 machine_code = 8'd4;
    #1 ins_write = 0;
    #1 reset = 1;
    #10 reset = 0;
end

initial 
 begin   
   $monitor($time," %b %b %b", pc, instruction_out, alu_result);
 end
  
initial #50 $finish;
endmodule
 
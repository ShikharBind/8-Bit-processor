`include "Memory.v"
`include "CU.v"
`include "ALU.v"


module CPU(
    input clk, reset, ins_read,
    input ins_write,
    input[7:0] instruction_write_data,
    output[7:0] alu_result, flag, instruction, 
    output reg[7:0] pc
);


// registers
// reg[7:0] pc;
reg[7:0] register[3:0];
wire[7:0] immediate_value;

//memory interface
wire mem_read, mem_write, ins_read;
// reg ins_write;
// assign ins_write = ins_write_in;
assign ins_read = ~ins_write;
wire[3:0] mem_access_addr;
wire[7:0] mem_write_data, mem_read_data;


// Control Unit interface
wire [3:0] opcode;
wire [1:0] rd, rs;
wire alu_src, immediate, reg_write;


//initializing registers
integer i;
initial 
begin  
    pc <= 8'd0; 

    for(i=0;i<4;i=i+1)  
    register[i] <= 8'd0; 
end 

// controlling program counter
always @(posedge clk or posedge reset or instruction_write_data)  
 begin
    if(ins_write==1'b0)  begin 
      if(reset)  
      begin 
           pc <= 8'd0; 
      end
      else begin
        if(pc < 255) pc <= pc + 1;
        else pc <= pc;  
      end
    end
    else  begin
    pc <= pc + 1;
    end
 end 


Instruction_Memory instruction_memory(.clk(clk),.mem_read(ins_read),.mem_write(ins_write),
                .access_addr(pc),.write_data(instruction_write_data),
                .read_data(instruction));

 Data_Memory data_memory(.clk(clk),.mem_read(mem_read),.mem_write(mem_write),
                .access_addr(mem_access_addr),.write_data(mem_write_data),
                .read_data(mem_read_data));
 
 Control_Unit control_unit(.inst(instruction), .reset(reset), .opcode(opcode), .rd(rd), .rs(rs),
            .mem_read(mem_read), .mem_write(mem_write), .imm(immediate), .alu_src(alu_src), .reg_write(reg_write), .immediate_value(immediate_value));

ALU alu(.clk(clk), .a(register[rd]), .b(register[rs]), .immv(immediate_value),
        .alu_control(opcode), .alu_result(alu_result), .flag(flag));

endmodule
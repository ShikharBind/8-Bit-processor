module CPU(
    input clk,reset,
    output[7:0] alu_result;
);


// registers
reg[7:0] pc;
reg[7:0] register[3:0];

//memory interface
wire mem_read, mem_write;
wire[7:0] mem_access_addr, mem_write_data, mem_read_data;


// Control Unit interface
wire [7:0] instruction;
wire [3:0] opcode;
wire [1:0] rd, rs;
wire alu_src, immeadiate, reg_write;


//initializing registers
initial 
begin  
    for(i=0;i<4;i=i+1)  
    register[i] <= 8'd0;  
end 

// controlling program counter
always @(posedge clk or posedge reset)  
 begin   
      if(reset)   
           pc <= 8'd0;  
      else  
           pc <= pc + 1;  
 end  

 Memory memory(.clk(clk),.mem_read(mem_read),.mem_write(mem_write),
                .access_addr(mem_access_addr),.write_data(mem_write_data),
                .read_data(mem_read_data));
 
 Control_Unit control_unit(.inst(instruction), .reset(reset), .opcode(opcode), .rd(rd), .rs(rs),
            .mem_read(mem_read), .mem_write(mem_write), .imm(immeadiate), .alu_src(alu_src), .reg_write(reg_write));

endmodule
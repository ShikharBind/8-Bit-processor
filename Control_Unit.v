module Control_Unit(
    input[7:0] inst, //instruction
    input reset,
    output reg[3:0] opcode,
    output reg[1:0] rd, rs
    output reg mem_read, mem_write, imm, alu_src, reg_write
);

 always @(*)  
 begin  
      if(reset == 1'b1) begin  
                opcode = 4'd0;
                rd = 2'b00;
                rs = 2'b00;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b0;
                imm = 1'b0;
                reg_write = 1'b0;
      end  
      else begin  
      opcode = inst[7:4];
      case(opcode)   
      4'b0000: begin // add  
                rd = 2'b00;
                rs = 2'b00;
                mem_read = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b0;
                imm = 1'b0;
                reg_write = 1'b0;
            end 
      endcase
      end
end
endmodule

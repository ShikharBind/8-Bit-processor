module Control_Unit(
    input[7:0] inst, //instruction
    input reset,
    output reg[3:0] opcode,
    output reg[1:0] rd, rs,
    output reg mem_read, mem_write, imm, alu_src, reg_write,
    output[7:0] immediate_value
);
reg isim4;
Immto8 imm28(.isim4(isim4), .inst(inst[3:0]), .imm8(immediate_value));

 always @(*)  
 begin  
      if(reset == 1'b1) begin  
                opcode <= 4'd0;
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b0;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
      end  
      else begin  
      opcode = inst[7:4];
      case(opcode)   
       4'b0000: begin // LD  
                rd <= 2'b00;
                rs <= 2'bxx;
                isim4 <= 1'b1;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b1;
                imm <= 1'b0;
                reg_write <= 1'b1;
                end

      4'b0001:  begin // ST 
                rd <= 2'b00;
                rs <= 2'b00;
                isim4 <= 1'b1;
                mem_read <= 1'b0;
                mem_write <= 1'b1;
                // alu_src <= 1'b1;
                imm <= 1'b0;
                reg_write <= 1'b0;;
                end

     4'b0011:   begin // MR  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end

     4'b0010:   begin // MI  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b1;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end

     4'b0100:   begin // SUM  
                rd <= inst[3:2];
                rs <= inst[1:0];
                mem_read <= 1'b1;
                mem_write <= 1'b1;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end

     4'b1100:   begin // SMI  
                rd <= inst[3:2];
                rs <= 2'bxx;
                isim4 <= 1'b0;
                mem_read <= 1'b0;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b1;
                reg_write <= 1'b0;
                // immediate_value <= imm8;
                end

    4'b0101:    begin // SB  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b1;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end

     4'b1101:   begin // SBI  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end

     4'b0111:   begin // CM  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end

     4'b1111:   begin // CMI  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end

     4'b0110:   begin // ANR  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end

     4'b1110:   begin // ANI  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end  

     4'b1000:   begin // ORR  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end  

     4'b1001:   begin // ORI  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end  

     4'b1010:   begin // XRR  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end 

     4'b1011:   begin // XRI  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b1;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b0;
                end  

     default:   begin //DEFAULT  
                rd <= 2'b00;
                rs <= 2'b00;
                mem_read <= 1'b0;
                mem_write <= 1'b0;
                // alu_src <= 1'b0;
                imm <= 1'b0;
                reg_write <= 1'b1;
                end                        
      endcase
      end
end
endmodule

module Immto8(input isim4, input[3:0] inst, output reg[7:0] imm8);
integer i;
always @(inst)
begin
    if(isim4) begin
        imm8[3:0] <= inst[3:0];
        for(i=4;i<8;i=i+1) begin
            imm8[i] <= inst[3];
        end
    end 
    else begin
        imm8[1:0] <= inst[1:0];
        for(i=2;i<8;i=i+1) begin
            imm8[i] <= inst[1];
        end
    end
    // #0.5 $display("%b",imm8);
end
endmodule

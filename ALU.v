module ALU(
  input clk,
  input  [7:0] a,  //src1
  input  [7:0] b, immv,  //src2
  input  [3:0] alu_control, //function selection
  output reg [7:0] alu_result, flag  //alu_result
);

always @(negedge clk)
begin 
 case(alu_control)
//  4'b0000: alu_result = 0; // LD
//  4'b0001: alu_result = 0; // ST
 4'b0011: alu_result = b;    // MR
 4'b0010: alu_result = b;  //MI
 4'b0100: alu_result = a + b;  // SUM
 4'b1100: alu_result = a + immv; // SMI
 4'b0101: alu_result = a - b; // SB
 4'b1101: alu_result = a - b; // SBI
 4'b0111: alu_result = (a < b) ? 8'b1:8'b0; // CM
 4'b1111: alu_result = (a < b) ? 8'b1:8'b0; // CMI
 4'b0110: alu_result = a & b;    // ANR
 4'b1110: alu_result = a & b;  // ANI
 4'b1000: alu_result = a | b;  // ORR
 4'b1001: alu_result = a | b; // ORI
 4'b1010: alu_result = a ^ b;  // XRR
 4'b1011: alu_result = a ^ b; // XRI
 default: alu_result = 8'bxxxxxxxx; // DEFAULT
 endcase
//  $display("%b", alu_control);
end
 
endmodule
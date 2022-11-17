 module Memory  
 (  
      input  clk, mem_read, mem_write
      input[7:0]  access_addr, write_data,  
      output[7:0] read_data  
 );  
      integer i;  
      reg [7:0] ram [255:0]; 
      initial begin  
           for(i=0;i<256;i=i+1)  
                ram[i] <= 8'd0;  
      end  
      always @(posedge clk) begin  
           if (mem_write)  
                ram[access_addr] <= write_data;  
      end  
      assign read_data = (mem_read==1'b1) ? ram[access_addr]: 8'd0;   
 endmodule 
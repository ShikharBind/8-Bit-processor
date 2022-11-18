module DTU(
    input clk, mem_read, mem_write,
    input[7:0] data,
    input[7:0] access_addr_im,
    output reg[7:0] write_data,// read_data
    output reg[3:0] mem_access_addr
);

always @(posedge mem_read or posedge mem_write) 
begin
    mem_access_addr <= access_addr_im[3:0];
    // if(mem_write)
    write_data <= data;
    // else if(mem_read)
    // read_data <= 

end

endmodule
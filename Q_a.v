module Q_a(output reg[15:0]C,
           output reg[15:0]W,
		   input clk, rstn,
           input [15:0] i,
           input [15:0] X
           );

always @(posedge clk) 
       begin
	    if (!rstn) 
		begin
	      C <= 0;
          W <= 0;
	    end 
		else 
		begin
	    	C <= X;
			W <= i;            
	    end
	  end
endmodule
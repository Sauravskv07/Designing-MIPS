`include "dff.v"
module reg32(q,d,clk,reset);
	input [0:31] d;
	output [0:31] q;
	//reg [0:31] q;
	input clk,reset;
	genvar j;

	generate for (j=0; j<32;j=j+1) 
		begin: mux_loop
			dff d1(q[j],d[j],clk,reset);
		end
	endgenerate
endmodule

`include "DECODER.v"
module FADDER(in,sum,carry);
	input [0:2] in;
	output sum,carry;
	wire [0:7] out;
	
	DECODER add1(out,in);
	assign sum=out[1]|out[2]|out[4]|out[7];
	assign carry=out[3]|out[5]|out[6]|out[7];
endmodule
	
	

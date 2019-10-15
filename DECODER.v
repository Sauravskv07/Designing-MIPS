module DECODER(out,in);
	input [0:1] in;
	output [0:3] out;
	wire a0,a1;
	
	not n1(a0,in[0]);
	not n2(a1,in[1]);
	
	and (out[0],a1,a0);
	and (out[1],a1,in[0]);
	and (out[2],in[1],a0);
	and (out[3],in[1],in[0]);

endmodule

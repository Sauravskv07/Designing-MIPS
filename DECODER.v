module DECODER(out,in);
	input [0:2] in;
	output [0:7] out;
	wire a0,a1,a2;
	
	not n1(a0,in[0]);
	not n2(a1,in[1]);
	not n3(a2,in[2]);
	
	and (out[0],a2,a1,a0);
	and (out[1],a2,a1,in[0]);
	and (out[2],a2,in[1],a0);
	and (out[3],a2,in[1],in[0]);
	and (out[4],in[2],a1,a0);
	and (out[5],in[2],a1,in[0]);
	and (out[6],in[2],in[1],a0);
	and (out[7],in[2],in[1],in[0]);
endmodule

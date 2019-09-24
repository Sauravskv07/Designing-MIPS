`include "FADDER.v"
module 8_ADDER(in1,in2,carryin,sum,carryout);
	input [0:7] in1;
	input [0:7] in2;
	input carryin;
	output [0:7] sum;
	output carryout;
	
	FADDER f1(in1[0],in2[0],carryin,sum[0],w1);
	FADDER f1(in1[1],in2[1],w1,sum[1],w2);
	FADDER f1(in1[2],in2[2],w2,sum[2],w3);
	FADDER f1(in1[3],in2[3],w3,sum[3],w4);
	FADDER f1(in1[4],in2[4],w4,sum[4],w5);
	FADDER f1(in1[5],in2[5],w5,sum[5],w6);
	FADDER f1(in1[6],in2[6],w6,sum[6],w7);
	FADDER f1(in1[7],in2[7],w7,sum[7],carryout);
endmodule
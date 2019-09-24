`include "mux32Bit4to1.v"
`include "bit32AndGate.v"
`include "bit32OrGate.v"
`include "bit32FullAdder.v"

module ALU(in1,in2,Binvert,Carryin,sel,Result,CarryOut);
	input [31:0] in1,in2;
	input Binvert,Carryin;
	input [1:0] sel;
	output [31:0] Result;
	output CarryOut;
	
	wire [31:0]out1;
	wire [31:0]out2;
	wire [31:0]out3;
	wire [31:0]in3;
	wire [31:0]in4;
	
	assign in3= ~in2;
	
	assign in4 = (Binvert)?in2:in3;
	
	bit32AndGate and32(out1,in1,in2);
	bit32OrGate or32(out2,in1,in2);
	bit32FullAdder sum32(CarryOut,out3,in1,in4,Carryin);

	mux32Bit4to1 result(Result,out1,out2,out3,sel[1],sel[0]);
	
endmodule
	
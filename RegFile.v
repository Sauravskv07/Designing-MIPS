`include "DECODER.v"
`include "32Bit4to1Mux.v"
`include "reg32.v"

module RegFile(clk,reset,ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2);

	input clk,reset,RegWrite
	input [0:1] WriteReg,ReadReg1,ReadReg2;
	output [0:31] ReadData1,ReadData2;
	input [0:31] WriteData;
	
	wire [0:3] w;
	wire [0:31] w1,w2,w3,w4;
	
	DECODER d1(w,WriteReg);
	
	wire clk1,clk2,clk3,clk4;
	
	assign clk1= clk & w[0] & RegWrite;
	assign clk2= clk & w[1] & RegWrite;
	assign clk3= clk & w[2] & RegWrite;
	assign clk4= clk & w[3] & RegWrite;
	
	reg32 r1(w1,WriteData,clk1,reset);
	reg32 r2(w2,WriteData,clk2,reset);
	reg32 r3(w3,WriteData,clk3,reset);
	reg32 r4(w4,WriteData,clk4,reset);
	
	mux32Bit4to1  Read1(ReadReg1,w1,w2,w3,w4,ReadReg1[0],ReadReg1[1]);
	mux32Bit4to1  Read2(ReadReg2,w1,w2,w3,w4,ReadReg2[0],ReadReg2[1]);

endmodule
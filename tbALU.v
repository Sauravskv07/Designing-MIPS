`include "ALU.v"
module tbALU();
	reg Binvert, Carryin;
	reg [1:0] Operation;
	reg [31:0] in1,in2;
	wire [31:0] Result;
	wire CarryOut;
	ALU al1(in1,in2,Binvert,Carryin,Operation,Result,CarryOut);
	initial
	begin
		in1=32'ha5a5a5a5;
		in2=32'h5a5a5a5a;
		Operation=2'b00;
		Binvert=1'b0;
		Carryin=1'b0; //must perform AND resulting in zero
		#100 Operation=2'b01; //OR
		#100 Operation=2'b10; //ADD
		#100 Binvert=1'b1;//SUB
		#200 $finish;
	end
endmodule
module controllerMIPS(PCWrite, PCWriteCond, IorD, MemRead, MemWrite, IRWrite, MemtoReg, PCSource, ALUOp, ALUSrcB, ALUSrcA, RegWrite, RegDst, NS, Op, CLK)
	input [5:0] Op;
	input CLK;
	output PCWrite, PCWriteCond, IorD, MemRead, MemWrite, IRWrite, MemtoReg, PCSource, ALUSrcB, ALUSrcA, RegWrite, RegDst;
	output [3:0] NS;
	output [2:0] ALUOp, ALUSrcB, PCSource;
	wire [16:0] w;
	reg [3:0] S;
	
	initial
	S = 4'b 0000;
	always @(posedge CLK)
	begin
		
	assign w[0] = (~S[3])&(~S[2])&(~S[1])&(~S[0]);
	assign w[1] = (~S[3])&(~S[2])&(~S[1])&(S[0]);
	assign w[2] = (~S[3])&(~S[2])&(S[1])&(~S[0]);
	assign w[3] = (~S[3])&(~S[2])&(S[1])&(S[0]);
	assign w[4] = (~S[3])&(S[2])&(~S[1])&(~S[0]);
	assign w[5] = (~S[3])&(S[2])&(~S[1])&(S[0]);
	assign w[6] = (~S[3])&(S[2])&(S[1])&(~S[0]);
	assign w[7] = (~S[3])&(S[2])&(S[1])&(S[0]);
	assign w[8] = (S[3])&(~S[2])&(~S[1])&(~S[0]);
	assign w[9] = (S[3])&(~S[2])&(~S[1])&(S[0]);
	assign w[10] = (~Op[5])&(~Op[4])&(~Op[3])&(~Op[2])&(Op[1])&(~Op[0])&(~S[3])&(~S[2])&(~S[1])&(S[0]);
	assign w[11] = (~Op[5])&(~Op[4])&(~Op[3])&(Op[2])&(~Op[1])&(~Op[0])&(~S[3])&(~S[2])&(~S[1])&(S[0]);
	assign w[12] = (~Op[5])&(~Op[4])&(~Op[3])&(~Op[2])&(~Op[1])&(~Op[0])&(~S[3])&(~S[2])&(~S[1])&(S[0]);
	assign w[13] = (Op[5])&(~Op[4])&(Op[3])&(~Op[2])&(Op[1])&(Op[0])&(~S[3])&(~S[2])&(S[1])&(~S[0]);
	assign w[14] = (Op[5])&(~Op[4])&(~Op[3])&(~Op[2])&(Op[1])&(Op[0])&(~S[3])&(~S[2])&(~S[1])&(S[0]);
	assign w[15] = (Op[5])&(~Op[4])&(Op[3])&(~Op[2])&(Op[1])&(Op[0])&(~S[3])&(~S[2])&(~S[1])&(S[0]);
	assign w[16] = (Op[5])&(~Op[4])&(~Op[3])&(~Op[2])&(Op[1])&(Op[0])&(~S[3])&(~S[2])&(S[1])&(~S[0]);	
	
	assign PCWrite = w[0]||w[9];
	assign PCWriteCond = w[8];
	assign IorD = w[3]||w[5];
	assign MemRead = w[0]||w[3];
	assign MemWrite = w[5];
	assign IRWrite = w[0];
	assign MemtoReg = w[4];
	assign PCSource[1] = w[9];
	assign PCSource[0] = w[8];
	assign ALUOp[1] = w[6];
	assign ALUOp[0] = w[8];	
	assign ALUSrcB[1] = w[1]||w[2];
	assign ALUSrcB[0] = w[0]||w[1];
	assign ALUSrcA = w[2]||w[5]||w[8];
	assign RegWrite = w[4]||w[7];
	assign RegDst = w[7];
	assign NS[3] = w[10]||w[11];
	assign NS[2] = w[3]||w[6]||w[12]||w[13];
	assign NS[1] = w[6]||w[12]||w[14]||w[15]||w[16];
	assign NS[0] = w[0]||w[6]||w[10]||w[13]||w[16];
	
	assign S[3:0]=NS[3:0];
	end
endmodule
	
	
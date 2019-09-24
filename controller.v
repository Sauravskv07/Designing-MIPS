module controller(RegDst,ALUSrc, MemtoReg, RegWrite,MemRead, MemWrite,Branch,ALUOp1,ALUOp2,Op);
	input [5:0] Op;
	output RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp2;
	wire Rformat,Beq,Lw,Sw;
	
	assign Rformat=(~Op[0])&(~Op[1])&(~Op[2])&(~Op[3])&(~Op[4])&(~Op[5]);
	assign Lw=(Op[0])&(Op[1])&(~Op[2])&(~Op[3])&(~Op[4])&(Op[5]);
	assign Sw=(Op[0])&(Op[1])&(~Op[2])&(Op[3])&(~Op[4])&(Op[5]);
	assign Beq=(~Op[0])&(~Op[1])&(Op[2])&(~Op[3])&(~Op[4])&(~Op[5]);
	
	assign RegDst=(Rformat) & (~Lw);
	assign ALUSrc=(~Rformat) & (Lw) & (Sw) & (~Beq);
	assign MemtoReg=(~Rformat) & (Lw)
	assign RegWrite=(Rformat) & (Lw) & (~Sw) & (~Beq);
	assign MemRead=(~Rformat) & (Lw) & (~Sw) & (~Beq);
	assign MemWrite=(~Rformat) & (~Lw) & (Sw) & (~Beq);
	assign Branch=(~Rformat) & (~Lw) & (~Sw) & (Beq);
	assign ALUOp1=(Rformat) & (~Lw) & (~Sw) & (~Beq);
	assign ALUOp2=(~Rformat) & (~Lw) & (~Sw) & (Beq);
	
endmodule
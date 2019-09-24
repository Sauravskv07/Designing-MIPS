`include "FADDER.v"
module tb_FADDER;
	reg [0:2] in;
	wire carry,sum;

	FADDER fadd(in,sum,carry);
	initial
	begin
	$monitor("in=%b | sum=%b | carry=%b",in,sum,carry);
	end
	initial
	begin
		in=3'b000;
		#3 in=3'b100;
		#3 in=3'b010;
		#3 in=3'b110;
		#3 in=3'b001;
		#3 in=3'b101;
		#3 in=3'b011;
		#3 in=3'b111;
end
endmodule
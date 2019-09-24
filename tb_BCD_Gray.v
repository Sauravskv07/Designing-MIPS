`include "BCD_Gray.v"
module testbench;
reg a,b,c,d;
wire e,f,g,h;
BCD_Gray dut(.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h));
initial
	begin
		$dumpfile("BCD_Gray.vcd");
		$dumpvars;

		#0 a=1'b0;b=1'b0;c=1'b0;d=1'b0;
		#10 a=1'b1;
		#20 a=1'b0;b=1'b1;
		#30 a=1'b1;b=1'b1;
		#40 $finish;
	end
endmodule
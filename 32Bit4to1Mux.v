`include "mux4to1.v"
module mux32Bit4to1(out,in1,in2,in3,in4,sel1,sel2);
	input [32:0] in1,in2,in3,in4;
	output [32:0] out;
	input sel1,sel2;
	genvar j;
	//this is the variable that is be used in the generate
	//block
	generate for (j=0; j<32;j=j+1) 
		begin: mux_loop
		//mux_loop is the name of the loop
			mux4to1 m1(out[j],sel1,sel2,in1[j],in2[j],in3[j],in4[j]);
		//mux2to1 is instantiated every time it is called
		end
	endgenerate

endmodule
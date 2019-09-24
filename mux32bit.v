`include "mux4_1.v"
module mux32bit(regData,q1,q2,q3,q4,reg_no)
	input [0:31] q1,q2,q3,q4;
	output [0:31] regData;
	input [0:1] reg_no;
	genvar j;

	generate for (j=0; j<32;j=j+1) 
		begin: mux_loop
			mux4_1 m(regData[j],q1[j],q2[j],q3[j],q4[j],reg_no);
		end
	endgenerate
endmodule
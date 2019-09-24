module mux4_1(regData,q1,q2,q3,q4,reg_no);
	input [0:1] reg_no;
	input q1,q2,q3,q4;
	output regData;

	wire n1,n2,a1,a2,a3,a4;
	
	not n(n1,reg_no[1]);
	not nn(n2,reg_no[0]);
	and (a1,q1,n1,n2);
	and (a2,q2,n2,reg_no[1]);
	and (a3,q3,reg_no[0],n1);
	and (a4,q4,reg_no[0],reg_no[1]);
	
	or or1(regData,a1,a2,a3,a4);

endmodule
	
	
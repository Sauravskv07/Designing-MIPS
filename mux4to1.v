module mux4to1(out,sel1,sel2,in1,in2,in3,in4);
	
	input in1,in2,in3,in4,sel1,sel2;
	output out;
	wire not_sel1,not_sel2,w1,w2,w3,w4,w5,w6;
	
	not (not_sel1,sel1);
	not (not_sel2,sel2);
	and (w1,in1,not_sel1,not_sel2);
	and (w2,in2,not_sel1,sel2);
	and (w3,in3,sel1,not_sel2);
	and (w4,in4,sel1,sel2);
	
	or (w5,w1,w2);
	or (w6,w3,w4);
	
	or (out,w5,w6);
	
endmodule
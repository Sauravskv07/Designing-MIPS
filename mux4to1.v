module mux4to1(out,sel1,sel2,in1,in2,in3);
	
	input in1,in2,in3,sel1,sel2;
	output out;
	wire not_sel1,not_sel2,w1,w2,w3,w4;
	
	not (not_sel1,sel1);
	not (not_sel2,sel2);
	and (w1,in1,not_sel1,not_sel2);
	and (w2,in2,not_sel1,sel2);
	and (w3,in3,sel1,not_sel2);
	
	or (w4,w1,w2);
	or (out,w3,w4);
	
endmodule
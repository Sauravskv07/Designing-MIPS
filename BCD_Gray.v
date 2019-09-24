module BCD_Gray (a,b,c,d,e,f,g,h);
	input a,b,c,d;
	output e,f,g,h;
	
	and (h,d,d);
	xor (g,d,c);
	xor (f,g,b);
	xor (e,f,a);
	
endmodule
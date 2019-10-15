module dff(q, d, clock, clearb);
	input d, clearb, clock;
	output q;
	reg q;
	
	initial
		q=1'b0;

	always @ (posedge clock)
		begin
			if (!clearb) q <= 1'b0;
			else q <= d;
		end
endmodule
module jkff_async_clear(j,k,clearb,clock,q);
input j,k,clearb,clock;
output q;
reg q;
always @ (negedge clearb or posedge clock)
begin
if (!clearb) 
q <= 1'b0;
else if (!j & k)
q <= 1'b0;
else if(!k & j)
q <= 1'b1;
else if(k & j)
q <= !q;
else
q <= q;
end
endmodule
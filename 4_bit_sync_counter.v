`include "jkff_async_clear.v"
module 4_bit_sync_counter(EN,CLK,Q);
parameter n = 4;
input EN;
input CLK;
output [n-1:0] Q;
reg [n-1:0] Q;
wire w1,w2;

jkff_async_clear jk0(1'b1,1'b1,CLK,EN,Q[0]);
jkff_async_clear jk1(Q[0],Q[0],CLK,EN,Q[1]);
jkff_async_clear(w1,w1,CLK,EN,Q[2]);
jkff_async_clear(w2,w2,CLK,EN,Q[3]);

initial
Q=4'd10;
always @(posedge CLK or negedge EN)
begin
w1 <= Q[0]& Q[1];
w2 <= w1 & Q[2];
end
endmodule
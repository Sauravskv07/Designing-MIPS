`include "bit_sync_counter.v"
module tb_bit_sync_counter;
parameter n=4;
reg EN,CLK;
wire [n-1:0] Q;
bit_sync_counter counter1(EN,CLK,Q);
initial
begin
CLK=0;
end
always
#2 CLK=~CLK;
initial
$monitor($time,"EN=%b Q=%b\n",EN,Q);
initial
begin
EN=0;
#4 EN=1;
#4 EN=0;
#4 EN=1;
#50
$finish;
end
endmodule
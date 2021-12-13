`timescale 1ns / 10ps

module FSM_tb;

reg CLK,nRESET, in;
wire out;

integer i;
parameter iter = 100;


always
	#2.5 CLK = ~CLK;

//moore imoore(nRESET, CLK, in, out);
mealy imealy(nRESET, CLK, in, out);

initial begin

$dumpvars;
CLK=1'b1;
nRESET = 1'b1;

#5 nRESET = 1'b0;
#5 nRESET = 1'b1;
for(i = 0; i < iter; i = i + 1)
	#5 in = $random;
$finish;
end
endmodule

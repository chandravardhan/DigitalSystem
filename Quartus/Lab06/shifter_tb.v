module shifter_tb;

reg [3:0] shift;
reg lr;
reg signed [15:0] in;
wire signed [15:0] out;
reg signed [15:0] ans;

integer i, count;
parameter iter = 1000;	


shifter shifter0(shift, lr, in, out);

initial begin
count = 0;

for(i = 0;i < iter; i = i + 1) begin
	
	in = $random;
	lr = $random;
	shift = $random;
	
	if(lr == 1) ans = in >>> shift;
	else ans = in <<< shift;
	#10; // wait for calculate
	if({out} == {ans}) count = count + 1;
	else begin
		if(lr == 1) $display("%d >> %d = %d, but %d\n", in, shift, ans, out);						
		else $display("%d << %d = %d, but %d\n", in, shift, ans, out);		
	end
	
end
$display("accept count : %d\n",count);

end

endmodule

module rotator_tb;

reg [3:0] shift;
reg lr;
reg [15:0] in;
wire [15:0] out;
reg [15:0] ans;

integer i, count;
parameter iter = 1000;	

rotator rotator0(shift, lr, in, out);

initial begin
count = 0;

for(i = 0;i < iter; i = i + 1) begin	
	lr = $random;
	shift = $random;
	in = $random;
	
	if(shift == 0) ans = in;
	else if(lr == 1) ans = (in >> shift) | (in << (16 - shift));
	else ans = (in << shift) | (in >> (16 - shift));
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

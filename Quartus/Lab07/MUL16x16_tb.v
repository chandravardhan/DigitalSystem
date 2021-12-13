module MUL16x16_tb;

reg [15:0] x,y;
wire ov;
wire [30:0] z;
reg [30:0] check;
reg vov;

parameter iter = 10;
integer i;
integer correct_cnt;
integer seed = 3;

MUL16x16 mul(x,y,z,ov);

initial begin
	correct_cnt = 0;
	for(i = 0; i < iter; i=i+1) begin				
		x = $random(seed);
		y = $random(seed);
		{vov, check} = x * y;
		#10 
		if({vov, check} == {ov, z}) 
			correct_cnt = correct_cnt + 1;
		else
			$display($time, " : %d * %d = %d, but was (%d)\n",x,y,{vov, check},{ov, z});						
	end
	
	$display("correct count = %d\n",correct_cnt);
end 

endmodule

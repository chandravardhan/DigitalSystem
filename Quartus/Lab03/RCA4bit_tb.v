module RCA4bit_tb;
	reg [3:0] x,y;
	reg cin;
		
	wire [3:0] s;
	wire cout;
		
	integer i,j;
		
	RCA4bit RCA4bit_0(.x(x), .y(y), .cin(cin), .cout(cout), .s(s));
			
	initial begin
		x = 4'b0000;
		y = 4'b0000;
		
		for(i = 0; i < 16; i = i + 1) begin
			for(j = 0; j < 16; j = j + 1) begin
				cin = 1'b0;
				#50;
				cin = 1'b1;
				#50;
				
				y = y+1;
			end
			y = 4'b0;
			x = x+1;
		end
	end
endmodule

module RCA8bit_tb;
	reg [7:0] x,y;
	reg cin;
		
	wire [7:0] s;
	wire cout;
		
	integer i;
	parameter iter = 1000;
	
	RCA8bit RCA8bit_0(.x(x), .y(y), .cin(cin), .cout(cout), .s(s));
			
	initial begin
		for(i = 0; i < iter; i = i + 1) begin
			x=$random;
			y=$random;
			cin=$random;
			#100;			
		end
	end
endmodule

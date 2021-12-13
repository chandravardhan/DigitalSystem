module FA(a, b, c, cout, sum);
	input a,b,c;
	output sum, cout;
	
	assign {cout, sum} = a + b + c;
	endmodule
	
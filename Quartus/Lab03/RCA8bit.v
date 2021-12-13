module RCA8bit(x,y,cin,cout,s);
	input [7:0] x,y;
	input cin;
	
	output [7:0] s;
	output cout;
	
	wire [6:0] c;
	
	FA FA0 (.a(x[0]), .b(y[0]), .c(cin), .cout(c[0]), .sum(s[0]));
	FA FA1 (.a(x[1]), .b(y[1]), .c(c[0]), .cout(c[1]), .sum(s[1]));
	FA FA2 (.a(x[2]), .b(y[2]), .c(c[1]), .cout(c[2]), .sum(s[2]));
	FA FA3 (.a(x[3]), .b(y[3]), .c(c[2]), .cout(c[3]), .sum(s[3]));
	FA FA4 (.a(x[4]), .b(y[4]), .c(c[3]), .cout(c[4]), .sum(s[4]));
	FA FA5 (.a(x[5]), .b(y[5]), .c(c[4]), .cout(c[5]), .sum(s[5]));
	FA FA6 (.a(x[6]), .b(y[6]), .c(c[5]), .cout(c[6]), .sum(s[6]));
	FA FA7 (.a(x[7]), .b(y[7]), .c(c[6]), .cout(cout), .sum(s[7]));
	
endmodule

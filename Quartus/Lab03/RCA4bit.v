module RCA4bit (x,y,cin,cout,s);
	input [3:0] x,y;
	input cin;
	
	output [3:0] s;
	output cout;
	
	wire [2:0] c;
	
	FA FA0 (.a(x[0]), .b(y[0]), .c(cin), .sum(s[0]), .cout(c[0]));
	FA FA1 (.a(x[1]), .b(y[1]), .c(c[0]), .sum(s[1]), .cout(c[1]));
	FA FA2 (.a(x[2]), .b(y[2]), .c(c[1]), .sum(s[2]), .cout(c[2]));
	FA FA3 (.a(x[3]), .b(y[3]), .c(c[2]), .sum(s[3]), .cout(cout));
	
endmodule

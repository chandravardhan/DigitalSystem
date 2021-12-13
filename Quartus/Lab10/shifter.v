module shifter(shift, lr, signext, in, out);
input [3:0] shift;
input lr,signext;
input [15:0] in;
output [15:0] out;

wire [15:0] ta;
wire [15:0] tb;
wire [15:0] tc;
wire [15:0] td;

assign ta = shift[0] ? ( lr ? {(signext? in[15]:1'b0),in[15:1]} : {in[14:0], 1'b0} ) : in;
assign tb = shift[1] ? ( lr ? {(signext? {2{ta[15]}}:2'b0) , ta[15:2]} : {ta[13:0],2'b0}) : ta;
assign tc = shift[2] ? ( lr ? {(signext? {4{tb[15]}}:4'b0), tb[15:4]} : {tb[11:0],4'b0}) : tb;
assign td = shift[3] ? ( lr ? {(signext? {8{tc[15]}}:8'b0), tc[15:8]} : {tc[7:0], 8'b0}) : tc;

assign out = td;

endmodule

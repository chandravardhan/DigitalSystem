module rotator(shift, lr, in, out);
input [3:0] shift;
input lr;
input [15:0] in;
output [15:0] out;

wire [15:0] ta;
wire [15:0] tb;
wire [15:0] tc;
wire [15:0] td;

assign ta = shift[0] ? ( lr ? {in[0],in[15:1]} : {in[14:0], in[15]} ) : in;
assign tb = shift[1] ? ( lr ? {ta[1:0], ta[15:2]} : {ta[13:0],ta[15:14]}) : ta;
assign tc = shift[2] ? ( lr ? {tb[3:0], tb[15:4]} : {tb[11:0],tb[15:12]}) : tb;
assign td = shift[3] ? ( lr ? {tc[7:0], tc[15:8]} : {tc[7:0], tc[15:8]})  : tc;

assign out = td;

endmodule

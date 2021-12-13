
`define add 4'b0001
`define sub 4'b0010
`define mov 4'b0011

`define shl 4'b0101
`define asr 4'b0110
`define shr 4'b0111

`define rol 4'b1000
`define ror 4'b1001

`define _and 4'b1011
`define _or  4'b1100
`define _not 4'b1110

`define mul 4'b1111


module alu (valA, valB, aluop, cc, result);
	input [15:0] valA;
	input [15:0] valB;
	input [ 3:0] aluop;

	
	output [ 3:0] cc;
	output [15:0] result;
	
	wire [15:0] 
		and16b, or16b, xor16b, not16b, rotate_out,
		shift_out, add_out, svalB, result;
	wire lr, signext, add_co, mul_ov, is_sub;
	wire [31:0] mul_res;
	
	wire [3:0] cc;
	wire N,Z,C,V;
	
	assign and16b = valA & valB;
	assign or16b = valA | valB;
	assign xor16b = valA ^ valB;
	assign not16b = ~valB;
	
	assign lr = (aluop == `asr || aluop == `shr || aluop == `ror); 
	assign signext = (aluop == `asr);
	shifter shifter0 (valB, lr, signext, valA, shift_out);
	rotator rotator0 (valB, lr, valA, rotate_out);
	
	MUL16x16 mul0(valA,valB,mul_res,mul_ov);
	
	assign is_sub = (aluop == `sub);
	assign svalB = is_sub ? ~valB : valB;
	adder iadder (valA, svalB, is_sub, add_co, add_out);
	
	assign result =
	(aluop == `add) ? add_out :
	(aluop == `sub) ? add_out :
	(aluop == `_and) ? and16b :
	(aluop == `_or) ? or16b :
	(aluop == `_not) ? not16b :
	(aluop == `asr) ? shift_out :
	(aluop == `shr) ? shift_out :
	(aluop == `shl) ? shift_out :
	(aluop == `rol) ? rotate_out :
	(aluop == `ror) ? rotate_out :
	(aluop == `mul) ? mul_res[15:0] : 16'bx;
	
	assign N = result[15];
	assign Z = ~|result;
	assign C = 
	// Add
	(aluop==`add) ? add_co : 
	// Multiply
	(aluop==`mul) ? mul_res[16] : 
	// default
	1'b0;
	
	assign V = 	
	// Add
	(aluop == `add) ?
	( valA[15] &  svalB[15] & ~add_out[15]) |		// -a + -b = +c : 1 1 0
	(~valA[15] & ~svalB[15] &  add_out[15]) :		// +a + +b = -c : 0 0 1
	(aluop == `mul) ?
	( valA[15] &  valB[15] &  mul_res[15]) |		// -a * -b = -c : 1 1 1
	(~valA[15] & ~valB[15] &  mul_res[15]) |		// +a * +b = -c : 0 0 1
	( valA[15] & ~valB[15] & ~mul_res[15]) |		// -a * +b = +c : 1 0 0
	(~valA[15] &  valB[15] & ~mul_res[15]) :		// +a * -b = +c : 0 1 0
	// default
	1'b0;
	
	assign cc = {N,Z,C,V};
	
endmodule

module adder(x, y, cin, cout, sum);
	input [15:0] x,y;
	input cin;
	output cout;
	output [15:0] sum;
	
	wire [14:0] c;
	
	FA FA00 (x[0],y[0],cin, c[0], sum[0]);
	FA FA01 (x[1],y[1],c[0], c[1], sum[1]);
	FA FA02 (x[2],y[2],c[1], c[2], sum[2]);
	FA FA03 (x[3],y[3],c[2], c[3], sum[3]);
	FA FA04 (x[4],y[4],c[3], c[4], sum[4]);
	FA FA05 (x[5],y[5],c[4], c[5], sum[5]);
	FA FA06 (x[6],y[6],c[5], c[6], sum[6]);
	FA FA07 (x[7],y[7],c[6], c[7], sum[7]);
	FA FA08 (x[8],y[8],c[7], c[8], sum[8]);
	FA FA09 (x[9],y[9],c[8], c[9], sum[9]);
	FA FA10 (x[10],y[10],c[9], c[10], sum[10]);
	FA FA11 (x[11],y[11],c[10], c[11], sum[11]);
	FA FA12 (x[12],y[12],c[11], c[12], sum[12]);
	FA FA13 (x[13],y[13],c[12], c[13], sum[13]);
	FA FA14 (x[14],y[14],c[13], c[14], sum[14]);
	FA FA15 (x[15],y[15],c[14], cout, sum[15]);
	
endmodule

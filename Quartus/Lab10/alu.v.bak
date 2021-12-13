
`define ADD 4'b0001
`define MUL 4'b0010
//`define SUB 4'b0001

`define ASR 4'b0100
`define LSR 4'b0101
`define RR  4'b0110

`define SHL 4'b1001
`define RL  4'b1010

`define AND 4'b1100
`define OR  4'b1101
`define XOR 4'b1110
`define NOT 4'b1111

module alu (valA, valB, aluop, sub, cc, result);
	input [15:0] valA;
	input [15:0] valB;
	input [ 3:0] aluop;
	input sub;
	
	output [ 3:0] cc;
	output [15:0] result;
	
	wire [15:0] 
		and16b, or16b, xor16b, not16b, rotate_out,
		shift_out, add_out, svalB, result;
	wire lr, signext, add_co, mul_ov;
	wire [31:0] mul_res;
	
	wire [3:0] cc;
	wire N,Z,C,V;
	
	assign and16b = valA & valB;
	assign or16b = valA | valB;
	assign xor16b = valA ^ valB;
	assign not16b = ~valB;
	
	assign lr = (aluop[3:2] == 2'b01); 
	assign signext = (aluop == `ASR);
	shifter shifter0 (valB, lr, signext, valA, shift_out);
	rotator rotator0 (valB, lr, valA, rotate_out);
	
	MUL16x16 mul0(valA,valB,mul_res,mul_ov);
	
	assign svalB = sub ? ~valB : valB;
	kogge_stone myAdder (valA, svalB, sub, add_co, add_out);
	
	assign result =
	(aluop == `ADD) ? add_out :
	(aluop == `AND) ? and16b :
	(aluop == `OR) ? or16b :
	(aluop == `XOR) ? xor16b :
	(aluop == `NOT) ? not16b :
	(aluop == `ASR) ? shift_out :
	(aluop == `LSR) ? shift_out :
	(aluop == `SHL) ? shift_out :
	(aluop == `RL) ? rotate_out :
	(aluop == `RR) ? rotate_out :
	(aluop == `MUL) ? mul_res[15:0] : 16'bx;
	
	assign N = result[15];
	assign Z = ~|result;
	assign C = 
	// Add
	(aluop==`ADD) ? add_co : 
	// Multiply
	(aluop==`MUL) ? mul_res[16] : 
	// default
	1'b0;
	
	assign V = 	
	// Add
	(aluop == `ADD) ?
	( valA[15] &  svalB[15] & ~add_out[15]) |		// -a + -b = +c : 1 1 0
	(~valA[15] & ~svalB[15] &  add_out[15]) :		// +a + +b = -c : 0 0 1
	(aluop == `MUL) ?
	( valA[15] &  valB[15] &  mul_res[15]) |		// -a * -b = -c : 1 1 1
	(~valA[15] & ~valB[15] &  mul_res[15]) |		// +a * +b = -c : 0 0 1
	( valA[15] & ~valB[15] & ~mul_res[15]) |		// -a * +b = +c : 1 0 0
	(~valA[15] &  valB[15] & ~mul_res[15]) :		// +a * -b = +c : 0 1 0
	// default
	1'b0;
	
	assign cc = {N,Z,C,V};
	
endmodule

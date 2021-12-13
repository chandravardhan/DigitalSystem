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

module alu_tb;

	reg [15:0] valA,valB;
	reg [3:0] aluop;
	wire [15:0] res;
	wire [3:0] cc;
	reg sub;
	
	alu alu0(valA,valB,aluop,sub,cc,res);
	
	initial begin
	
		// ov
		valA = 16'b0111_1111_1111_1111;
		valB = 16'b0000_0000_0000_0001;
		aluop = `ADD;
		sub = 1'b0;
		#10;
		
		// zero over carry
		valA = 16'b1000_0000_0000_0000;
		valB = 16'b1000_0000_0000_0000;
		aluop = `ADD;
		sub = 1'b0;
		#10;
		
		valA = 16'b0000_0000_0000_1000;
		valB = 16'b0000_0000_0000_1000;
		aluop = `ADD;
		sub = 1'b0;
		#10;
		valA = 16'b0000_0000_0111_1000;
		valB = 16'b0000_0000_0000_1100;
		aluop = `ADD;
		sub = 1'b1;
		#10;
		sub = 1'b0;
		valA = 16'b0001_1101_0111_1000;
		valB = 16'b0111_1111_0100_1100;
		aluop = `AND;
		#10;		
		valA = 16'b0001_1101_0111_1000;
		valB = 16'b0111_1111_0100_1100;
		aluop = `OR;
		#10;		
		valA = 16'b0001_1101_0111_1000;
		valB = 16'b0111_1111_0100_1100;
		aluop = `XOR;
		#10;	
		valA = 16'bx;
		valB = 16'b0111_1111_0100_1100;
		aluop = `NOT;
		#10;	
		valA = 16'b1001_1101_0111_1000;
		valB = 16'b0000_0000_0000_1000;
		aluop = `LSR;
		#10;
		valA = 16'b1001_1101_0111_1000;
		valB = 16'b0000_0000_0000_1000;
		aluop = `ASR;
		#10;	
		valA = 16'b1001_1101_0111_1000;
		valB = 16'b0000_0000_0000_1000;
		aluop = `SHL;
		#10;		
		valA = 16'b1001_1101_0111_1000;
		valB = 16'b0000_0000_0000_0100;
		aluop = `RL;
		#10;		
		valA = 16'b1001_1101_0111_1000;
		valB = 16'b0000_0000_0000_0100;
		aluop = `RR;
		#10;
		valA = 16'b0000_0000_0000_1100;
		valB = 16'b0000_0000_0000_0100;
		aluop = `MUL;
		#10;			
	end
	
endmodule


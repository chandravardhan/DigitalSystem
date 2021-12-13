`define ADD 	5'b00000
`define ADDI	5'b00001
`define SUB		5'b00010
`define SUBI	5'b00011
`define MOV		5'b00100
`define MOVI	5'b00101
`define SHL		5'b00110
`define SHLI	5'b00111
`define SHR		5'b01000
`define SHRI	5'b01001
`define ASR		5'b01010
`define ASRI	5'b01011
`define ROL		5'b01100
`define ROLI	5'b01101
`define ROR		5'b01110
`define RORI	5'b01111
`define AND		5'b10000
`define ANDI	5'b10001
`define OR		5'b10010
`define ORI		5'b10011
`define NOT		5'b10100
`define MUL		5'b10101
`define MULI	5'b10110


`define READ 1'b1
`define WRITE 1'b0

module cpu (clk, nRESET);

	input clk;
	input nRESET;
	reg [15:0] pc;
	reg [ 3:0] NZCV;
	
	wire [15:0] instr;

	wire unary;
	wire sgned;
	wire imode;
	wire [3:0] aluop;
	wire setcc;
	wire [2:0] rD, rA, rB;
	wire [3:0] imm;
	wire wben;

	wire [15:0] valA, valB, svalA, svalB, valE;
	wire [ 3:0] cc;

	/* PC register */ 
	always @(posedge clk or negedge nRESET) 
		if (!nRESET) pc <= 16'b0;
		else pc <= pc+2;
	
	/* instruction memory */ 
	memory imem (clk, `READ, pc, instr);
	/* instruction decoder */ 
	decoder idec (instr, unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben);
	/* register file */ 
	register_file ireg_file (clk, nRESET, wben, rD, valE, rA, rB, valA, valB);

	/* ALU */ 
	assign svalA = unary ? 16'b0 : valA;
	assign svalB = imode ? sgned ? {{12{imm[3]}}, imm}/*sign ext*/ : {12'b0, imm}/*zero ext*/ : valB;
	alu ialu (svalA, svalB, aluop, cc, valE);

	/* condition code register */ 
	always @(posedge clk or negedge nRESET) begin
		if (!nRESET) NZCV <= 4'b0;
		else if(setcc) NZCV <= cc;	
		else NZCV <= 4'bx;
	end

endmodule

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

module decoder (instr, unary, sgned, imode, aluop, setcc, rD, rA, rB, imm, wben);
	input [15:0] instr;
	output reg unary;
	output reg sgned;
	output reg imode;
	output reg setcc;
	output reg [3:0] aluop; // ADD,SUB,SHL,SHR,AND,OR,NOT (3 bits for 7 ops) output setcc;
	output reg [2:0] rD;
	output reg [2:0] rA;
	output reg [2:0] rB;
	output reg [3:0] imm;
	output reg wben;
	wire [4:0] opcode;
	
	assign opcode = instr[4:0];

	always @(instr) 
	case (opcode) 
	 //`OP : {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {unry,sgnd,imod,alop,setcc    ,rD        ,rA         ,rB          ,imm         ,wben}
		`ADD: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b0,1'b1,1'b0,`add,instr[5] ,instr[8:6],instr[11:9],instr[14:12],4'bx        ,1'b1};
		`ADDI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = {1'b0,1'b1,1'b1,`add,instr[5] ,instr[8:6],instr[11:9],3'bx        ,instr[15:12],1'b1};
		`SUB: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b0,1'b1,1'b0,`sub,instr[5] ,instr[8:6],instr[11:9],instr[14:12],4'bx        ,1'b1};
		`SUBI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = {1'b0,1'b1,1'b1,`sub,instr[5] ,instr[8:6],instr[11:9],3'bx        ,instr[15:12],1'b1};
		`MOV: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b1,1'b1,1'b0,`add,1'b0     ,instr[8:6],3'bx       ,instr[14:12],4'bx        ,1'b1};
		`MOVI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = {1'b1,1'b1,1'b1,`add,1'b0     ,instr[8:6],3'bx       ,3'bx        ,instr[15:12],1'b1};
		`SHL: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b0,1'b0,1'b0,`shl,instr[5] ,instr[8:6],instr[11:9],instr[14:12],4'bx        ,1'b1};
		`SHLI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = {1'b0,1'b0,1'b1,`shl,1'b0     ,instr[8:6],instr[11:9],3'bx        ,instr[15:12],1'b1};
		`SHR: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b0,1'b0,1'b0,`shr,instr[5] ,instr[8:6],instr[11:9],instr[14:12],4'bx        ,1'b1};
		`SHRI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = {1'b0,1'b0,1'b1,`shr,1'b0     ,instr[8:6],instr[11:9],3'bx        ,instr[15:12],1'b1};
		`ASR: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b0,1'b1,1'b0,`asr,instr[5] ,instr[8:6],instr[11:9],instr[14:12],4'bx        ,1'b1};
		`ASRI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = {1'b0,1'b1,1'b1,`asr,1'b0     ,instr[8:6],instr[11:9],3'bx        ,instr[15:12],1'b1};
		`ROL: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b0,1'b0,1'b0,`rol,instr[5] ,instr[8:6],instr[11:9],instr[14:12],4'bx        ,1'b1};
		`ROLI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = {1'b0,1'b0,1'b1,`rol,1'b0     ,instr[8:6],instr[11:9],3'bx        ,instr[15:12],1'b1};
		`ROR: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b0,1'b0,1'b0,`ror,instr[5] ,instr[8:6],instr[11:9],instr[14:12],4'bx        ,1'b1};
		`RORI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = {1'b0,1'b0,1'b1,`ror,1'b0     ,instr[8:6],instr[11:9],3'bx        ,instr[15:12],1'b1};
		`AND: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b0,1'b0,1'b0,`_and,instr[5],instr[8:6],instr[11:9],instr[14:12],4'bx        ,1'b1};
		`ANDI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = {1'b0,1'b0,1'b1,`_and,1'b0    ,instr[8:6],instr[11:9],3'bx        ,instr[15:12],1'b1};
		`OR: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =   {1'b0,1'b0,1'b0,`_or ,instr[5],instr[8:6],instr[11:9],instr[14:12],4'bx        ,1'b1};
		`ORI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b0,1'b0,1'b1,`_or ,1'b0    ,instr[8:6],instr[11:9],3'bx        ,instr[15:12],1'b1};
		`NOT: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b1,1'b0,1'b0,`_not,1'b0    ,instr[8:6],3'bx       ,instr[14:12],4'bx        ,1'b1};
		`MUL: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} =  {1'b0,1'b1,1'b0,`mul,instr[5] ,instr[8:6],instr[11:9],instr[14:12],4'bx        ,1'b1};
		`MULI: {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = {1'b0,1'b1,1'b1,`mul,1'b0     ,instr[8:6],instr[11:9],3'bx        ,instr[15:12],1'b1};
		default : {unary,sgned,imode,aluop,setcc,rD,rA,rB,imm,wben} = 22'bx;
	endcase
	
endmodule


module memory (clk, op, addr, data);
input clk;
input op;
input [15:0] addr;
output [15:0] data;

reg [7:0] mem [0:65535];

assign data = {mem[addr], mem[addr+1]};

endmodule



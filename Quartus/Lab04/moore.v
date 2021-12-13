`define INIT 4'b0000
`define I1 4'b0001
`define I2 4'b0010
`define I3 4'b0011
`define I4 4'b0100
`define O1 4'b0101
`define O2 4'b0110
`define O3 4'b0111
`define O4 4'b1000

module moore(nRESET, CLK, in, out);
	input nRESET, CLK, in;
	output out;
	reg [3:0] curState, nextState;
	reg out;
	
	always @ (posedge CLK or negedge nRESET)
		if (!nRESET) curState <= `INIT;
		else curState <= nextState;
	
	always @ (curState or in)
		casex(curState)
			`INIT: begin
				if (in == 1) nextState = `I1;
				else nextState = `O1;
				out = 1'b0;
			end
			// ONE to FOUR to process 1s
			`I1: begin
				if (in == 1) nextState = `I2;
				else nextState = `O1;
				out = 1'b0;
			end
			`I2: begin
				if (in == 1) nextState = `I3;
				else nextState = `O1;
				out = 1'b0;
			end
			`I3: begin
				if (in == 1) nextState = `I4;
				else nextState = `O1;
				out = 1'b0;
			end			
			`I4: begin
				if (in == 1) nextState = `I4;
				else nextState = `O1;
				out = 1'b1;
			end
			// FIVE to EIGHT to process 0s	
			`O1: begin
				if (in == 0) nextState = `O2;
				else nextState = `I1;
				out = 1'b0;
			end
			`O2: begin
				if (in == 0) nextState = `O3;
				else nextState = `I1;
				out = 1'b0;
			end			
			`O3: begin
				if (in == 0) nextState = `O4;
				else nextState = `I1;
				out = 1'b0;
			end
			`O4: begin
				if (in == 0) nextState = `O4;
				else nextState = `I1;
				out = 1'b1;
			end
			default: begin
				nextState = `INIT;
				out=1'b0;
			end
	endcase
endmodule

`define INIT 3'b000
`define I1 3'b001
`define I2 3'b010
`define I3 3'b011
`define O1 3'b100
`define O2 3'b101
`define O3 3'b110

module mealy(nRESET, CLK, in, out);
	input nRESET, CLK, in;
	output out;
	reg [2:0] curState, nextState;
	reg out;
	
	always @ (posedge CLK or negedge nRESET)
		if (!nRESET) curState <= `INIT;
		else curState <= nextState;
	
	always @ (curState or in)
		casex(curState)
			`INIT: 
				if (in == 1) begin
					nextState = `I1;
					out = 1'b0;
				end
				else begin
					nextState = `O1;
					out = 1'b0;
				end
			// ONE to THREE to process 1s
			`I1:
				if (in == 1) begin
					nextState = `I2;
					out = 1'b0;
				end
				else begin
					nextState = `O1;
					out = 1'b0;
				end
			`I2:
				if (in == 1) begin
					nextState = `I3;
					out = 1'b0;
				end
				else begin
					nextState = `O1;
					out = 1'b0;
				end
			`I3:
				if (in == 1) begin
					nextState = `I3;
					out = 1'b1;
				end
				else begin
					nextState = `O1;
					out = 1'b0;
				end
			// FOUR to SIX to process 0s	
			`O1:
				if (in == 0) begin
					nextState = `O2;
					out = 1'b0;
				end
				else begin
					nextState = `I1;
					out = 1'b0;
				end
			`O2:
				if (in == 0) begin
					nextState = `O3;
					out = 1'b0;
				end
				else begin
					nextState = `I1;
					out = 1'b0;
				end					
			`O3:
				if (in == 0) begin
					nextState = `O3;
					out = 1'b1;
				end
				else begin
					nextState = `I1;
					out = 1'b0;
				end
			default: begin
				nextState = `INIT;
				out=1'b0;
			end
	endcase
endmodule

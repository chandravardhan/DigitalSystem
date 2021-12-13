module dec_2_to_4_tb;

wire [3:0] Out;
reg [1:0] In;

dec_2_to_4 dec_2_to_40(Out, In);

initial begin
	In = 2'b00;

	#100
	In = 2'b01;

	#100
	In = 2'b10;

	#100
	In = 2'b11;
	
	#100;
	end
endmodule


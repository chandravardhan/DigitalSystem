module register_file (clk, nRESET, write_enable, write_addr, write_data, 
								read_addr_A, read_addr_B, 
								read_data_A, read_data_B);
	input clk;
	input nRESET;
	input write_enable;
	input [2:0] write_addr;
	input [15:0] write_data;
	
	// register index
	input [2:0] read_addr_A;
	input [2:0] read_addr_B;
	
	// data in register
	output [15:0] read_data_A;
	output [15:0] read_data_B;
	
	// register
	reg [15:0] reg_0;
	reg [15:0] reg_1;
	reg [15:0] reg_2;
	reg [15:0] reg_3;
	reg [15:0] reg_4;
	reg [15:0] reg_5;
	reg [15:0] reg_6;
	reg [15:0] reg_7;
	
	// muxing
	wire [7:0] decoder_out;
	wire [7:0] reg_enable;
	
	assign decoder_out = 
		(write_addr == 3'b000) ? 8'b0000_0001 :
		(write_addr == 3'b001) ? 8'b0000_0010 :
		(write_addr == 3'b010) ? 8'b0000_0100 :
		(write_addr == 3'b011) ? 8'b0000_1000 :
		(write_addr == 3'b100) ? 8'b0001_0000 :
		(write_addr == 3'b101) ? 8'b0010_0000 :
		(write_addr == 3'b110) ? 8'b0100_0000 :
		(write_addr == 3'b111) ? 8'b1000_0000 : 8'bx;
		
	assign reg_enable[0] = write_enable & decoder_out[0];
	assign reg_enable[1] = write_enable & decoder_out[1];
	assign reg_enable[2] = write_enable & decoder_out[2];
	assign reg_enable[3] = write_enable & decoder_out[3];
	assign reg_enable[4] = write_enable & decoder_out[4];
	assign reg_enable[5] = write_enable & decoder_out[5];
	assign reg_enable[6] = write_enable & decoder_out[6];
	assign reg_enable[7] = write_enable & decoder_out[7];
	
	always @ (posedge clk or negedge nRESET) 
		if (!nRESET) reg_0 <= 16'b0;
		else if (reg_enable[0]) reg_0 <= write_data;
	always @ (posedge clk or negedge nRESET) 
		if (!nRESET) reg_1 <= 16'b0;
		else if (reg_enable[1]) reg_1 <= write_data;
	always @ (posedge clk or negedge nRESET) 
		if (!nRESET) reg_2 <= 16'b0;
		else if (reg_enable[2]) reg_2 <= write_data;
	always @ (posedge clk or negedge nRESET) 
		if (!nRESET) reg_3 <= 16'b0;
		else if (reg_enable[3]) reg_3 <= write_data;	
	always @ (posedge clk or negedge nRESET) 
		if (!nRESET) reg_4 <= 16'b0;
		else if (reg_enable[4]) reg_4 <= write_data;
	always @ (posedge clk or negedge nRESET) 
		if (!nRESET) reg_5 <= 16'b0;
		else if (reg_enable[5]) reg_5 <= write_data;
	always @ (posedge clk or negedge nRESET) 
		if (!nRESET) reg_6 <= 16'b0;
		else if (reg_enable[6]) reg_6 <= write_data;
	always @ (posedge clk or negedge nRESET) 
		if (!nRESET) reg_7 <= 16'b0;
		else if (reg_enable[7]) reg_7 <= write_data;	
		
	assign read_data_A = 
		(read_addr_A == 3'b000) ? reg_0 :
		(read_addr_A == 3'b001) ? reg_1 :
		(read_addr_A == 3'b010) ? reg_2 :
		(read_addr_A == 3'b011) ? reg_3 :
		
		(read_addr_A == 3'b100) ? reg_4 :
		(read_addr_A == 3'b101) ? reg_5 :
		(read_addr_A == 3'b110) ? reg_6 :
		(read_addr_A == 3'b111) ? reg_7 : 16'bx;

	assign read_data_B = 
		(read_addr_B == 3'b000) ? reg_0 :
		(read_addr_B == 3'b001) ? reg_1 :
		(read_addr_B == 3'b010) ? reg_2 :
		(read_addr_B == 3'b011) ? reg_3 :
		
		(read_addr_B == 3'b100) ? reg_4 :
		(read_addr_B == 3'b101) ? reg_5 :
		(read_addr_B == 3'b110) ? reg_6 :
		(read_addr_B == 3'b111) ? reg_7 : 16'bx;	

		
endmodule

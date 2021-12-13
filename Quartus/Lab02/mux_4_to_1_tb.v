module mux_4_to_1_tb;
wire Out;
reg In0, In1, In2, In3;
reg [1:0] Sel;

mux_4_to_1 mux_4_to_10(Out, In0, In1, In2, In3, Sel);

initial begin

	Sel = 2'b00;
	
	{In3, In2, In1, In0} = 4'bxxx0;
	#100
	
	{In3, In2, In1, In0} = 4'bxxx1;
	#100
	
	Sel = 2'b01;
	
	{In3, In2, In1, In0} = 4'bxx0x;
	#100
	
	{In3, In2, In1, In0} = 4'bxx1x;
	#100
	
	Sel = 2'b10;
	
	{In3, In2, In1, In0} = 4'bx0xx;
	#100
	
	{In3, In2, In1, In0} = 4'bx1xx;
	#100
	
	Sel = 2'b11;
	
	{In3, In2, In1, In0} = 4'b0xxx;
	#100
	
	{In3, In2, In1, In0} = 4'b1xxx;
	#100;
	end
endmodule
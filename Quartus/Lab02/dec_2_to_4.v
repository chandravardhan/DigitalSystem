module dec_2_to_4(Out, In);
	/* Behavioral style */
	output Out;
	input In;
	reg [3:0] Out;
	wire [1:0] In;
	
	always @ (In) begin
		casex(In)
			2'b00 : Out = 4'b0001;
			2'b01 : Out = 4'b0010;
			2'b10 : Out = 4'b0100;
			2'b11 : Out = 4'b1000;
			default: Out=4'b0000;
		endcase
	end
			
endmodule
	/* Structural Style */
	/*
	output Out;
	input In;
	
	wire [1:0] In;
	wire [1:0] NotIn;
	wire [3:0] Out;
	
	not not0(NotIn[0], In[0]);
	not not1(NotIn[1], In[1]);
	
	and and0(Out[0], NotIn[1], NotIn[0]);
	and and1(Out[1], NotIn[1], In[0]);
	and and2(Out[2], In[1], NotIn[0]);
	and and3(Out[3], In[1], In[0]);
	*/
	/* Dataflow style */
	/*
	output Out;
	input In;
	
	wire [1:0] In;
	wire [3:0] Out;

	assign Out[0] = !In[1] & !In[0];
	assign Out[1] = !In[1] & In[0];
	assign Out[2] = In[1] & !In[0];
	assign Out[3] = In[1] & In[0];
	*/
		

	
	
	
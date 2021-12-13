module mux_4_to_1(Out, In0, In1, In2, In3, Sel);
	/* Structural Style */
	output Out;
	input In0, In1, In2, In3, Sel;
		
	wire [1:0] Sel;
	wire [1:0] NotSel;
	wire Y0, Y1, Y2, Y3;
		
	not not0(NotSel[0], Sel[0]);
	not not1(NotSel[1], Sel[1]);
	
	and and0(Y0, In0, NotSel[1], NotSel[0]);
	and and1(Y1, In1, NotSel[1], Sel[0]);
	and and2(Y2, In2, Sel[1], NotSel[0]);
	and and3(Y3, In3, Sel[1], Sel[0]);
	or or0(Out, Y0, Y1, Y2, Y3);			
endmodule

/* Dataflow Style */
/*
	output Out;
	input In0, In1, In2, In3, Sel;
	
	wire [1:0] Sel;
	wire Out;
	
	assign Out = 
	(Sel == 2'b00) ? In0 : 
	(Sel == 2'b01) ? In1 : 
	(Sel == 2'b10) ? In2 : 
	(Sel == 2'b11) ? In3 : 1'bx;
*/


/* Behavioral Style */
/*
	output Out;
	input In0, In1, In2, In3, Sel;
	
	wire [1:0] Sel;
	reg Out;
	
	always @ (In0 or In1 or In2 or In3 or Sel) begin
		casex(Sel)
		2'b00 : Out = In0;
		2'b01 : Out = In1;
		2'b10 : Out = In2;
		2'b11 : Out = In3;
		default : Out = 1'bx;
		endcase
	end
*/
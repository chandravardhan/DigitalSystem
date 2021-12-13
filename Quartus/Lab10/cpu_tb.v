module cpu_tb;

	reg clk, nRESET;
	
	always #2.5 clk = ~clk;
	
	cpu icpu(clk, nRESET);
	
	integer i;
	
	initial begin 
		$readmemb("my_program.txt",icpu.imem.mem);
		
		clk = 1'b1;
		nRESET = 1'b1;
		
		#5 nRESET = 1'b0;
		#5 nRESET = 1'b1;
		
		#500;
		$finish;
	end
endmodule

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:29:03 11/04/2022
// Design Name:   top
// Module Name:   C:/Users/SHIVANI/Desktop/KGP_RISC_PROCESSOR/top_test.v
// Project Name:  KGP_RISC_PROCESSOR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_test;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] out_top;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rst(rst), 
		.out_top(out_top)
	);
	initial begin
		forever #10 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#20 rst=0;
		// Add stimulus here
		
		$monitor($time,"\tout=%d",out_top);

	end
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:58:11 10/26/2022
// Design Name:   sign_extend_15
// Module Name:   C:/Users/Admin/Desktop/Sem 5/COA Lab/Processor/KGP_RISC/data_path/sign_extend/sign_extend/sign_extend_15_test.v
// Project Name:  sign_extend
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_extend_15
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sign_extend_15_test;

	// Inputs
	reg [16:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	sign_extend_15 uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor ($time, "\tin=%d\tout=%d",in,out);
		#100 in = 10455;
		#100 in = -10455;

	end
      
endmodule
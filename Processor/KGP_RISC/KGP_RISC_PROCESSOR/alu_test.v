`timescale 1ns / 1ps

module alu_test;

	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;
	reg [2:0] alu_control;

	// Outputs
	wire [31:0] out;
	wire zero_flag;
	wire msb_flag;
	wire carry_flag;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.in1(in1), 
		.in2(in2), 
		.alu_control(alu_control), 
		.out(out), 
		.zero_flag(zero_flag), 
		.msb_flag(msb_flag), 
		.carry_flag(carry_flag)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		alu_control = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
		$monitor ($time, "\tin1=%d\tin2=%d\talu_control=%d\tout=%d\tzero_flag=%d\tmsb_flag=%d\tcarry_flag=%d",in1,in2,alu_control,out,zero_flag,msb_flag,carry_flag);
		#100 in1 = 32'd8; in2 = 32'd9;alu_control = 3'd0;
		#100 in1 = 32'd54; in2 = 3240834;alu_control = 3'd1;
		#100 in1 = 32'd3; in2 = 5;alu_control = 3'd2;
		#100 in1 = 32'd1023; in2 = 3;alu_control = 3'd3;
		#100 in1 = 32'b11111101000011110101110110101010; in2 = 5;alu_control = 3'd4;
		#100 in1 = 23; in2 = 7;alu_control = 3'd5;
		#100 in1 = 7; in2 = 8;alu_control = 3'd6;
		#100 in1 = 13; in2 = 11;alu_control = 3'd7;

	end
      
endmodule


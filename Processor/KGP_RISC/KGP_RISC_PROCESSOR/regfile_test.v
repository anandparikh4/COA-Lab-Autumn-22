`timescale 1ns / 1ps

module regfile_test;
	reg clk;
	reg rst;
	reg [31:0] write_data;
	reg [4:0] write_reg;
	reg regwrite;
	reg [4:0] read_reg1;
	reg [4:0] read_reg2;

	wire [31:0] read_data1;
	wire [31:0] read_data2;

	regfile uut (
		.clk(clk), 
		.rst(rst), 
		.write_data(write_data), 
		.write_reg(write_reg), 
		.regwrite(regwrite), 
		.read_reg1(read_reg1), 
		.read_reg2(read_reg2), 
		.read_data1(read_data1), 
		.read_data2(read_data2)
	);
	initial begin
	forever #10 clk = ~clk;
	end
	initial begin
		clk = 0;
		rst = 0;
		write_data = 0;
		write_reg = 0;
		regwrite = 0;
		read_reg1 = 0;
		read_reg2 = 0;

		$monitor ($time, "\tclk=%d\trst=%d\twrite_data=%d\twrite_reg=%d\treg_write=%d\tread_reg1=%d\tread_reg2=%d\tread_data1=%d\tread_data2=%d",clk,rst,write_data,write_reg,regwrite,read_reg1,read_reg2,read_data1,read_data2);
		#100 
		rst = 1;
		write_data = 0;
		write_reg = 0;
		regwrite = 0;
		read_reg1 = 0;
		read_reg2 = 0;
		
		#100 
		rst = 0;
		write_data = 35;
		write_reg = 12;
		regwrite = 1;
		read_reg1 = 12;
		read_reg2 = 1;
		
		#100 
		rst = 0;
		write_data = 9;
		write_reg = 8;
		regwrite = 1;
		read_reg1 = 12;
		read_reg2 = 3;
		
		
	
	end
      
endmodule


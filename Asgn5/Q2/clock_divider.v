`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:50 09/13/2022 
// Design Name: 
// Module Name:    clock_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module clock_divider(input clk_in , output reg clk_out);

parameter max_cnt = 2500000;

reg [31:0] curr_cnt;

initial
	begin
		curr_cnt <= 32'd0;
		clk_out <= 0;
	end

always @(posedge clk_in)
	begin
	
		if(curr_cnt == max_cnt-1)
			begin
				curr_cnt <= 32'd0;
				clk_out <= ~clk_out;
			end
			
		else
			curr_cnt <= curr_cnt+1;
			
	end
	
endmodule

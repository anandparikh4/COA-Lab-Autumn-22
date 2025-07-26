`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:52 09/13/2022 
// Design Name: 
// Module Name:    wrapper 
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
module wrapper(input clk , input rst , output reg[3:0] cnt_out);

wire clk_div_net;
reg clk_div;

wire [3:0] upcounter_net;

clock_divider cd1 (.clk_in(clk) ,.clk_out(clk_div_net));

initial 
	begin
		cnt_out <= 4'd0;
		clk_div <= 4'd0;
	end

always @ (posedge clk)
	begin
		clk_div <= clk_div_net;
	end
	
always @ (posedge clk_div or negedge rst)
	begin
		if(rst == 0)
			cnt_out <= 0;
		else
			cnt_out <= upcounter_net;
	end
	
up_counter_behavioral upc1 (.cnt_in(cnt_out) , .cnt_out(upcounter_net));

endmodule

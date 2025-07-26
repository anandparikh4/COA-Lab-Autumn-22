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
module wrapper(input clk , input rst , output [3:0] cnt_out);

wire clk_div_net;
reg clk_div;

wire [3:0] upcounter_net;

clock_divider cd1 (.clk_in(clk) ,.clk_out(clk_div_net));
/*
initial 
	begin
		cnt_out <= 4'd0;
		clk_div <= 1'd0;
	end

always @ (posedge clk)
	begin
		clk_div <= clk_div_net;
	end
*/

wire clk_div_out;

// check reset
dff d1 (.clk(clk) , .rst() , .D(clk_div_net) , .Q(clk_div_out) );

/*
always @ (posedge clk_div or negedge rst)
	begin
		if(rst == 0)
			cnt_out <= 0;
		else
			cnt_out <= upcounter_net;
	end
*/

dff d2 (.clk(clk_div_out) , .rst(rst) , .D(upcounter_net[0]) , .Q (cnt_out[0]) );
dff d3 (.clk(clk_div_out) , .rst(rst) , .D(upcounter_net[1]) , .Q (cnt_out[1]) );
dff d4 (.clk(clk_div_out) , .rst(rst) , .D(upcounter_net[2]) , .Q (cnt_out[2]) );
dff d5 (.clk(clk_div_out) , .rst(rst) , .D(upcounter_net[3]) , .Q (cnt_out[3]) );

add_by_one_optimized_CLA CLA1 (.in(cnt_out) , .out(upcounter_net));

endmodule

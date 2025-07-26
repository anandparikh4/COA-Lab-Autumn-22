`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:54:53 09/13/2022 
// Design Name: 
// Module Name:    up_counter_behavioral 
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
module up_counter_behavioral(input [3:0] cnt_in,output [3:0] cnt_out);

assign cnt_out = cnt_in + 1;

endmodule

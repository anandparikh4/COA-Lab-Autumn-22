`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:43 09/13/2022 
// Design Name: 
// Module Name:    add_by_one_optimized_CLA 
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
module add_by_one_optimized_CLA(input [3:0] in , output [3:0] out);

wire C1,C2,C3;

assign C1 = in[0];
assign C2 = in[0] & in[1];
assign C3 = in[0] & in[1] & in[2];

assign out[0] = ~in[0];
assign out[1] = in[1] ^ C1;
assign out[2] = in[2] ^ C2;
assign out[3] = in[3] ^ C3;

endmodule

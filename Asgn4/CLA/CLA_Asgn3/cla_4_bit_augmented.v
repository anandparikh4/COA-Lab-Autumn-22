`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:25 08/29/2022 
// Design Name: 
// Module Name:    cla_4_bit_augmented 
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
module cla_4_bit_augmented(input[3:0] A,input[3:0] B,output P_out,output G_out);

wire [3:0] P;
wire [3:0] G;

assign P = A ^ B;
assign G = A & B;

assign P_out = P[3] & P[2] & P[1] & P[0];
assign G_out = (G[3]) | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]);

endmodule

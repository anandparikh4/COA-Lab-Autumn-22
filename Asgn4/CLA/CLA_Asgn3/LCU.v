`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:46:45 08/29/2022 
// Design Name: 
// Module Name:    LCU 
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
module LCU(input [3:0] P_LCU , input [3:0] G_LCU , input C0 ,  output C1 , output C2 , output C3 , output C4);

assign C1 = (G_LCU[0]) | (P_LCU[0] & C0) ;
assign C2 = (G_LCU[1]) | (P_LCU[1] & G_LCU[0]) | (P_LCU[1] & P_LCU[0] & C0) ;
assign C3 = (G_LCU[2]) | (P_LCU[2] & G_LCU[1]) | (P_LCU[2] & P_LCU[1] & G_LCU[0]) | (P_LCU[2] & P_LCU[1] & P_LCU[0] & C0) ;
assign C4 = (G_LCU[3]) | (P_LCU[3] & G_LCU[2]) | (P_LCU[3] & P_LCU[2] & G_LCU[1]) | (P_LCU[3] & P_LCU[2] & P_LCU[1] & G_LCU[0]) | (P_LCU[3] & P_LCU[2] & P_LCU[1] & P_LCU[0] & C0);

endmodule

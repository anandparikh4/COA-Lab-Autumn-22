`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:08 10/19/2022 
// Design Name: 
// Module Name:    LCU_16_to_32 
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

module LCU_16_to_32(input [1:0] P_LCU , input [1:0] G_LCU , input C0 ,  output C1 , output C2);

assign C1 = (G_LCU[0]) | (P_LCU[0] & C0) ;
assign C2 = (G_LCU[1]) | (P_LCU[1] & G_LCU[0]) | (P_LCU[1] & P_LCU[0] & C0) ;

endmodule

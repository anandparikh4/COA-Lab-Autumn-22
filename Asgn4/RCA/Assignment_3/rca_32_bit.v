`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:26 08/25/2022 
// Design Name: 
// Module Name:    rca_32_bit 
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

module rca_32_bit(input[31:0] a,input[31:0] b,input c0,output [31:0] s,output c);

wire c_out1;

rca_16_bit r1 (.a(a[15:0]) , .b(b[15:0]) , .c(c0) , .s(s[15:0]) , .c(c_out1));

rca_16_bit r2 (.a(a[31:16]) , .b(b[31:16]) , .c(c_out1) , .s(s[31:16]) , .c(c)); 

endmodule

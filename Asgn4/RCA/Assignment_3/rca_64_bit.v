`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:28 08/25/2022 
// Design Name: 
// Module Name:    rca_64_bit 
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

module rca_64_bit(input[63:0] a,input[63:0] b,input c0,output [63:0] s,output c);

wire c_out1;

rca_32_bit r1 (.a(a[31:0]) , .b(b[31:0]) , .c(c0) , .s(s[31:0]) , .c(c_out1));

rca_32_bit r2 (.a(a[63:32]) , .b(b[63:32]) , .c(c_out1) , .s(s[63:32]) , .c(c)); 

endmodule

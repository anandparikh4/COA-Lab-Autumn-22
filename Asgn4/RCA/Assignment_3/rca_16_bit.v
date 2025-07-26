`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:14 08/25/2022 
// Design Name: 
// Module Name:    rca_16_bit 
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

module rca_16_bit(input[15:0] a,input[15:0] b,input c0,output [15:0] s,output c);

wire c_out1;

ripple_carry_addr r1 (.a(a[7:0]) , .b(b[7:0]) , .c(c0) , .s(s[7:0]) , .c(c_out1));

ripple_carry_addr r2 (.a(a[15:8]) , .b(b[15:8]) , .c(c_out1) , .s(s[15:8]) , .c(c)); 

endmodule

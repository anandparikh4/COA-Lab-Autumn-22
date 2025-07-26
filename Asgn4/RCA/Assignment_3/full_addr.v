`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:07:59 08/25/2022 
// Design Name: 
// Module Name:    full_addr 
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
module full_addr(input a,input b,input c0,output s,output c);
wire g2_out,g3_out,g4_out;
xor g1(s,a,b,c0);
and g2(g2_out,a,b);
xor g3(g3_out,a,b);
and g4(g4_out,g3_out,c0);
or  g5(c,g2_out,g4_out);
endmodule

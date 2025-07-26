`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:49 08/25/2022 
// Design Name: 
// Module Name:    ripple_carry_addr 
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
module ripple_carry_addr(input[7:0] a,input[7:0] b,input c0,output [7:0] s,output c);
wire c_out1,c_out2,c_out3,c_out4,c_out5,c_out6,c_out7;
full_addr addr1(.a(a[0]),.b(b[0]),.c0(c0),.s(s[0]),.c(c_out1));
full_addr addr2(.a(a[1]),.b(b[1]),.c0(c_out1),.s(s[1]),.c(c_out2));
full_addr addr3(.a(a[2]),.b(b[2]),.c0(c_out2),.s(s[2]),.c(c_out3));
full_addr addr4(.a(a[3]),.b(b[3]),.c0(c_out3),.s(s[3]),.c(c_out4));
full_addr addr5(.a(a[4]),.b(b[4]),.c0(c_out4),.s(s[4]),.c(c_out5));
full_addr addr6(.a(a[5]),.b(b[5]),.c0(c_out5),.s(s[5]),.c(c_out6));
full_addr addr7(.a(a[6]),.b(b[6]),.c0(c_out6),.s(s[6]),.c(c_out7));
full_addr addr8(.a(a[7]),.b(b[7]),.c0(c_out7),.s(s[7]),.c(c));

endmodule

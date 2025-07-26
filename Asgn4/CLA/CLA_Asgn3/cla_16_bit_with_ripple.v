`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:57:00 08/29/2022 
// Design Name: 
// Module Name:    cla_16_bit_with_ripple 
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
module cla_16_bit_with_ripple(input[15:0] A,input[15:0] B,input C0,output[15:0] S,output C16);
wire C1,C2,C3;

cla_4_bit cla_1( .A(A[3:0]) , .B(B[3:0]) , .C0(C0) , .S(S[3:0]) , .C4(C1) );
cla_4_bit cla_2( .A(A[7:4]) , .B(B[7:4]) , .C0(C1) , .S(S[7:4]) , .C4(C2) );
cla_4_bit cla_3( .A(A[11:8]) , .B(B[11:8]) , .C0(C2) , .S(S[11:8]) , .C4(C3) );
cla_4_bit cla_4( .A(A[15:12]) , .B(B[15:12]) , .C0(C3) , .S(S[15:12]) , .C4(C16) );

endmodule

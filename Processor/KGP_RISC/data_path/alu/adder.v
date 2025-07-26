`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Verilog Assignment-1
//Question 2
//Group 81
//Group members:
//Soni Aditya Bharatbhai 20CS10060
//Anand Manojkumar Parikh 20CS10007
//////////////////////////////////////////////////////////////////////////////////
/*
use 2 16 bit CLAs to make a 32 bit CLA in the same fashion
		
*/
module adder(input[31:0] A,input[31:0] B,input C0,output[31:0] S,output C32);

wire [1:0] P;
wire [1:0] G;

wire C16;

cla_16_bit_augmented cla_aug_1( .A(A[15:0]) , .B(B[15:0]) , .C0(C0) , .P_out(P[0]) , .G_out(G[0])  , .S(S[15:0]) , .C16() );
cla_16_bit_augmented cla_aug_2( .A(A[31:16]) , .B(B[31:16]) , .C0(C16) , .P_out(P[1]) , .G_out(G[1]) , .S(S[31:16]) , .C16() );

LCU_16_to_32 L2(.P_LCU(P[1:0]) , .G_LCU(G[1:0]) , .C0(C0) , .C1(C16) , .C2(C32));

endmodule
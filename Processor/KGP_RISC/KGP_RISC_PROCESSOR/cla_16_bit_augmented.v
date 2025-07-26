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
	cla_16_bit adder takes as input two 16-bit numbers in A and B, and takes input carry C0. It computes the
	sum and stores it in S and the output carry is stores in C16.
	
	Approach:
		We use 4 cla_4_bit adders to compute the sum and the output carry.
		We first compute the block propagate and block generate values for all the 4 cla_4_bit blocks 
		by using the module cla_4_bit_augmented. 
		
		Next we use the Look Ahead Carry Unit LCU L1 to find all the intermediate carry values and also the output carry C16.
		Now that we know all the intermediate carry values we can compute the sum by using the four cla_4_bit adder circuits.
		
*/
module cla_16_bit_augmented(input[15:0] A,input[15:0] B,input C0,output[15:0] S,output C16, output P_out, output G_out);

wire [3:0] P;
wire [3:0] G;

wire C1,C2,C3;

cla_4_bit_augmented cla_aug_1( .A(A[3:0]) , .B(B[3:0]) , .C0(C0) , .P_out(P[0]) , .G_out(G[0])  , .S(S[3:0]) , .C4() );
cla_4_bit_augmented cla_aug_2( .A(A[7:4]) , .B(B[7:4]) , .C0(C1) , .P_out(P[1]) , .G_out(G[1]) , .S(S[7:4]) , .C4() );
cla_4_bit_augmented cla_aug_3( .A(A[11:8]) , .B(B[11:8]) , .C0(C2) , .P_out(P[2]) , .G_out(G[2]) , .S(S[11:8]) , .C4() );
cla_4_bit_augmented cla_aug_4( .A(A[15:12]) , .B(B[15:12]) , .C0(C3) , .P_out(P[3]) , .G_out(G[3]) , .S(S[15:12]) , .C4() );

LCU_4_to_16 L1(.P_LCU(P[3:0]) , .G_LCU(G[3:0]) , .C0(C0) , .C1(C1) , .C2(C2) , .C3(C3) , .C4(C16) );

assign P_out = P[3] & P[2] & P[1] & P[0];
assign G_out = (G[3]) | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]);

endmodule
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
	cla_4_bit_augmented computes the block propagate P_out and block generate G_out in addition to sum S and carry C4.
	These values depend on the two 4-bit inputs A and B.
	The boolean equations are:
		Pi = A[i]^B[i] for all i=0,1,2,3
		Gi = A[i]&B[i] for all i=0,1,2,3

		P_out = P3&P2&P1&P0
		G_out = G3 + P3G2 + P3P2G1 + P3P2P1G0
*/
module cla_4_bit_augmented(input[3:0] A,input[3:0] B, input C0 , output P_out,output G_out, output [3:0] S , output C4);

wire C1,C2,C3;
wire [3:0] P;
wire [3:0] G;

assign P = A ^ B; 
assign G = A & B;

assign C1 = (G[0]) | (P[0] & C0);
assign C2 = (G[1]) | (P[1] & G[0]) | (P[1] & P[0] & C0);
assign C3 = (G[2]) | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C0);
assign C4 = (G[3]) | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C0);

assign S[0] = P[0] ^ C0;
assign S[1] = P[1] ^ C1;
assign S[2] = P[2] ^ C2;
assign S[3] = P[3] ^ C3;

assign P_out = P[3] & P[2] & P[1] & P[0];
assign G_out = (G[3]) | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]);

endmodule

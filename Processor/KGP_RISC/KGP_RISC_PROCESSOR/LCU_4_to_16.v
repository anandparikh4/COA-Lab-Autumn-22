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
LCU takes as input the block generate and block propagate values in array G and P respectively
C0 is the input carry of the CLA 16-bit adder
Using these block propagate, block generate and carry-in values we compute the carry values for all the 3 CLA-4-bit adders and
we also compute the output carry we obtain on addition of the two 16-bit numbers

Boolean logic:
	C1 = G0 + P0C0
	C2 = G1 + P1G0 + P1P0C0
	C3 = G2 + P2G1 + P2P1G0 + P2P1P0C0
	C4 = G3 + P3G2 + P3P2G1 + P3P2P1G0 + P3P2P1P0C0
	
	where Pi = P_LCU[i], Gi = G_LCU[i] for i = 0,1,2,3
*/

module LCU_4_to_16(input [3:0] P_LCU , input [3:0] G_LCU , input C0 ,  output C1 , output C2 , output C3 , output C4);

assign C1 = (G_LCU[0]) | (P_LCU[0] & C0) ;
assign C2 = (G_LCU[1]) | (P_LCU[1] & G_LCU[0]) | (P_LCU[1] & P_LCU[0] & C0) ;
assign C3 = (G_LCU[2]) | (P_LCU[2] & G_LCU[1]) | (P_LCU[2] & P_LCU[1] & G_LCU[0]) | (P_LCU[2] & P_LCU[1] & P_LCU[0] & C0) ;
assign C4 = (G_LCU[3]) | (P_LCU[3] & G_LCU[2]) | (P_LCU[3] & P_LCU[2] & G_LCU[1]) | (P_LCU[3] & P_LCU[2] & P_LCU[1] & G_LCU[0]) | (P_LCU[3] & P_LCU[2] & P_LCU[1] & P_LCU[0] & C0);

endmodule

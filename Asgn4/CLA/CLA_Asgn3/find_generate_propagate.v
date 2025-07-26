`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Name: Soni Aditya Bharatbhai 20CS10060
// Anand Manojkumar Parikh 20CS10007
//////////////////////////////////////////////////////////////////////////////////
module find_generate_propagate(input [3:0] P, input [3:0] G ,output P_out, output G_out);

assign P_out = P[3] & P[2] & P[1] & P[0];
assign G_out = (G[3]) | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]);

endmodule

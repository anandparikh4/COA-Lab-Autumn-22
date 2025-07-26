`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Name: Soni Aditya Bharatbhai 20CS10060
// Anand Manojkumar Parikh 20CS10007
//////////////////////////////////////////////////////////////////////////////////
module cla_4_bit(input[3:0] A,input[3:0] B,input C0,output[3:0] S,output C4);

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

endmodule
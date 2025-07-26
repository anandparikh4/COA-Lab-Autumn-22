`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Name: Soni Aditya Bharatbhai 20CS10060
// Anand Manojkumar Parikh 20CS10007
//////////////////////////////////////////////////////////////////////////////////
module cla_16_bit(input[15:0] A,input[15:0] B,input C0,output[15:0] S,output C16);

wire [3:0] P_LCU;
wire [3:0] G_LCU;

cla_4_bit_augmented cla_aug_1( .A(A[3:0]) , .B(B[3:0]) , .P_out(P_LCU[0]) , .G_out(G_LCU[0]) );
cla_4_bit_augmented cla_aug_2( .A(A[7:4]) , .B(B[7:4]) , .P_out(P_LCU[1]) , .G_out(G_LCU[1]));
cla_4_bit_augmented cla_aug_3( .A(A[11:8]) , .B(B[11:8]) , .P_out(P_LCU[2]) , .G_out(G_LCU[2]) );
cla_4_bit_augmented cla_aug_4( .A(A[15:12]) , .B(B[15:12]) , .P_out(P_LCU[3]) , .G_out(G_LCU[3]) );

wire C1,C2,C3;

LCU L1(.P_LCU(P_LCU[3:0]) , .G_LCU(G_LCU[3:0]) , .C0(C0) , .C1(C1) , .C2(C2) , .C3(C3) , .C4(C16) );

cla_4_bit cla1( .A(A[3:0]) , .B(B[3:0]) , .C0(C0) , .S(S[3:0]) , .C4() );
cla_4_bit cla2( .A(A[7:4]) , .B(B[7:4]) , .C0(C1) , .S(S[7:4]) , .C4() );
cla_4_bit cla3( .A(A[11:8]) , .B(B[11:8]) , .C0(C2) , .S(S[11:8]) , .C4() );
cla_4_bit cla4( .A(A[15:12]) , .B(B[15:12]) , .C0(C3) , .S(S[15:12]) , .C4() );

endmodule
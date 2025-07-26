`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:46 10/19/2022 
// Design Name: 
// Module Name:    complement 
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
module complement(input[31:0] in,output[31:0] out);

adder A1(.A(~in),.B(32'd0),.C0(1'd1),.S(out),.C32());

endmodule

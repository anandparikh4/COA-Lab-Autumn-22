`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:49 10/29/2022 
// Design Name: 
// Module Name:    carry_register 
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
module carry_register(input clk, input rst, input carry_in, output reg carry_out);

always @(posedge clk) begin
       if(rst) carry_out <= 0;
       else carry_out <= carry_in;
end

endmodule

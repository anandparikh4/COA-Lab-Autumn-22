`timescale 1ns / 1ps

module Equal_To_Zero(input [31:0]in, output zero_flag);

assign zero_flag = (in == 0) ? 1'd1 : 1'd0;

endmodule

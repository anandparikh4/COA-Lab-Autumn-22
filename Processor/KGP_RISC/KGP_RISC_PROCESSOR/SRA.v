`timescale 1ns / 1ps

module SRA(input signed[31:0] in, input signed[31:0] sh , output[31:0] out);

assign out = in >>> sh;

endmodule

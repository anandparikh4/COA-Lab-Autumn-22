`timescale 1ns / 1ps

module sign_extend_15(input wire[16:0] in, output wire[31:0] out);

assign out = {{15{in[16]}},in};

endmodule

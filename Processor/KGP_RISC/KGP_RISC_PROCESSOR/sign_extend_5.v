`timescale 1ns / 1ps

module sign_extend_5(input wire[11:0] in, output wire[16:0] out);

assign out = {{5{in[11]}},in};

endmodule

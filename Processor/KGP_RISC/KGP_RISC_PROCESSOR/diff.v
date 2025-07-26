`timescale 1ns / 1ps

module diff(input wire[31:0] a, input wire [31:0] b,output reg[31:0] pos);

wire[31:0] x;
wire[31:0] y;
wire[31:0] z;
wire[31:0] w;
wire[31:0] v;
	
assign x = a^b;
assign y = x;
assign z = 32'd1;

adder sub1(.A(y), .B(~z), .C0(1'd1), .S(w), .C32());

assign v = x&w;

wire[31:0] out;
adder sub2(.A(x), .B(~v), .C0(1'd1), .S(out), .C32());

always @(*) begin
case(out)
	32'd0: pos <= 32'd32;
	32'd1: pos <= 32'd0;
	32'd2: pos <= 32'd1;
	32'd4: pos <= 32'd2;
	32'd8: pos <= 32'd3;
	32'd16: pos <= 32'd4;
	32'd32: pos <= 32'd5;
	32'd64: pos <= 32'd6;
	32'd128: pos <= 32'd7;
	32'd256: pos <= 32'd8;
	32'd512: pos <= 32'd9;
	32'd1024: pos <= 32'd10;
	32'd2048: pos <= 32'd11;
	32'd4096: pos <= 32'd12;
	32'd8192: pos <= 32'd13;
	32'd16384: pos <= 32'd14;
	32'd32768: pos <= 32'd15;
	32'd65536: pos <= 32'd16;
	32'd131072: pos <= 32'd17;
	32'd262144: pos <= 32'd18;
	32'd524288: pos <= 32'd19;
	32'd1048576: pos <= 32'd20;
	32'd2097152: pos <= 32'd21;
	32'd4194304: pos <= 32'd22;
	32'd8388608: pos <= 32'd23;
	32'd16777216: pos <= 32'd24;
	32'd33554432: pos <= 32'd25;
	32'd67108864: pos <= 32'd26;
	32'd134217728: pos <= 32'd27;
	32'd268435456: pos <= 32'd28;
	32'd536870912: pos <= 32'd29;
	32'd1073741824: pos <= 32'd30;
	32'd2147483648: pos <= 32'd31;
	default : pos <= 32'd32;
	
endcase
end

endmodule

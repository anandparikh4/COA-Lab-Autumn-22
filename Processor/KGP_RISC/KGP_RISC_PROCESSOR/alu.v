`timescale 1ns / 1ps

module alu(input wire[31:0] in1, input wire [31:0] in2, input wire[2:0] alu_control,
			  output reg[31:0] out, output reg zero_flag, output reg msb_flag,
			  output reg carry_flag);
			  
wire[31:0] adder_out,complement_out,SL_out,SRL_out,SRA_out,AND_out,XOR_out,diff_out;
wire carry;

adder ADD1(.A(in1),.B(in2),.C0(1'd0),.S(adder_out),.C32(carry));

complement COMP1(.in(in2),.out(complement_out));

SL SL1(.in(in1),.sh(in2),.out(SL_out));

SRL SRL1(.in(in1),.sh(in2),.out(SRL_out));

SRA SRA1(.in(in1),.sh(in2),.out(SRA_out));

diff diff1(.a(in1), .b(in2), .pos(diff_out));

AND AND1(.in1(in1),.in2(in2),.out(AND_out));

XOR XOR1(.in1(in1),.in2(in2),.out(XOR_out));

always @(*) begin

	msb_flag <= in1[31];
	zero_flag <= (in1 == 0) ? 1'd1 : 1'd0;

	case(alu_control)
		
		3'd0 :begin
				out <= adder_out;
				carry_flag <= carry;
				end
				
		3'd1 :out <= complement_out;
		
		3'd2 :out <= SL_out;
		
		3'd3 :out <= SRL_out;
		
		3'd4 :out <= SRA_out;
		
		3'd5 :out <= diff_out;
		
		3'd6 :out <= AND_out;
		
		3'd7 :out <= XOR_out;
		
	endcase

end

endmodule

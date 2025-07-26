`timescale 1ns / 1ps

module alu_control(input wire [1:0] alu_op, input wire[4:0] fn_code,output reg[2:0] alu_control_signal);

always @(*) begin

case(alu_op)
	2'd0:
		begin
			case(fn_code)
				5'd0: alu_control_signal <= 3'd0;
				5'd1: alu_control_signal <= 3'd1;
				5'd2: alu_control_signal <= 3'd2;
				5'd3: alu_control_signal <= 3'd3;
				5'd4: alu_control_signal <= 3'd4;
				5'd5: alu_control_signal <= 3'd5;
				5'd6: alu_control_signal <= 3'd6;
				5'd7: alu_control_signal <= 3'd7;
			endcase
		end
	2'd1:
		alu_control_signal <= 3'd0;
	2'd2:
		alu_control_signal <= 3'd1;
	2'd3:
		begin
			case(fn_code)
				5'd0: alu_control_signal <= 3'd2;
				5'd1: alu_control_signal <= 3'd3;
				5'd2: alu_control_signal <= 3'd4;
			endcase
		end
endcase
end

endmodule

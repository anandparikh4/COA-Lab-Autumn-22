`timescale 1ns / 1ps

module main_control(input wire[4:0] opcode, output reg reg_dst,output reg write_31, output reg reg_write,
					output reg[1:0] alu_op, output reg[1:0] shift_sel, output reg alu_src, 
					output reg mem_read, output reg mem_write, output reg mem_to_reg, output reg[2:0] branch_op);

always @(*) begin
	case(opcode)
		5'd0: begin
					reg_dst <= 1'd0;
					write_31 <= 1'd0;
					reg_write <= 1'd1;
					alu_op <= 2'd0;
					alu_src <= 1'd0;
					mem_read <= 1'd0;
					mem_write <= 1'd0;
					mem_to_reg <= 1'd0;
					branch_op <= 3'd0;
				end
				
		5'd1: begin
					reg_dst <= 1'd0;
					write_31 <= 1'd0;
					reg_write <= 1'd1;
					alu_op <= 2'd1;
					shift_sel <= 2'd1;
					alu_src <= 1'd1;
					mem_read <= 1'd0;
					mem_write <= 1'd0;
					mem_to_reg <= 1'd0;
					branch_op <= 3'd0;
				end
		5'd2: begin
					reg_dst <= 1'd0;
					write_31 <= 1'd0;
					reg_write <= 1'd1;
					alu_op <= 2'd2;
					shift_sel <= 2'd1;
					alu_src <= 1'd1;
					mem_read <= 1'd0;
					mem_write <= 1'd0;
					mem_to_reg <= 1'd0;
					branch_op <= 3'd0;
				end		
		5'd5: begin
					reg_dst <= 1'd1;
					write_31 <= 1'd0;
					reg_write <= 1'd1;
					alu_op <= 2'd1;
					shift_sel <= 2'd1;
					alu_src <= 1'd1;
					mem_read <= 1'd1;
					mem_write <= 1'd0;
					mem_to_reg <= 1'd1;
					branch_op <= 3'd0;
				end
		5'd6: begin
					reg_write <= 1'd0;
					alu_op <= 2'd1;
					shift_sel <= 2'd1;
					alu_src <= 1'd1;
					mem_read <= 1'd0;
					mem_write <= 1'd1;
					branch_op <= 3'd0;
				end
		5'd7: begin
					reg_write <= 1'd0;
					shift_sel <= 2'd2;
					mem_read <= 1'd0;
					mem_write <= 1'd0;
					branch_op <= 3'd1;
				end
		5'd8: begin
					reg_write <= 1'd0;
					mem_read <= 1'd0;
					mem_write <= 1'd0;
					branch_op <= 3'd2;
				end
		5'd9: begin
					write_31 <= 1'd1;
					reg_write <= 1'd1;
					mem_read <= 1'd0;
					mem_write <= 1'd0;
					branch_op <= 3'd2;
				end
		5'd10: begin
					reg_write <= 1'd0;
					mem_read <= 1'd0;
					mem_write <= 1'd0;
					branch_op <= 3'd4;
				end
		5'd11: begin
					reg_write <= 1'd0;
					mem_read <= 1'd0;
					mem_write <= 1'd0;
					branch_op <= 3'd5;
				end
		5'd13: begin
					reg_dst <= 1'd0;
					write_31 <= 1'd0;
					reg_write <= 1'd1;
					alu_op <= 2'd3;
					shift_sel <= 2'd0;
					alu_src <= 1'd1;
					mem_read <= 1'd0;
					mem_write <= 1'd0;
					mem_to_reg <= 1'd0;
					branch_op <= 3'd0;
				end
	endcase

end

endmodule

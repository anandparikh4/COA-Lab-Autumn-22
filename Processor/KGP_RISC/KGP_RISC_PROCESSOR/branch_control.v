`timescale 1ns / 1ps

module branch_control(input wire[2:0] branch_op, input wire[4:0] fn_code,input wire[31:0] pc_plus4,
							 input wire[31:0] pc_plus4_plusL, input wire[31:0] L_pseudo, 
							 input wire[31:0] rs ,input wire zero_alu, input wire msb_alu,
							 input wire carry_alu, output reg [31:0] next_pc);
always @(*) begin
					case(branch_op)
						3'd0: next_pc <= pc_plus4;
						3'd1: begin
									case(fn_code)
										5'd0: next_pc <= rs;
										5'd1: begin
													case(msb_alu)
														1'd0: next_pc <= pc_plus4;
														1'd1: next_pc <= pc_plus4_plusL;
													endcase
												end
										5'd2: begin
													case(zero_alu)
														1'd0: next_pc <= pc_plus4;
														1'd1: next_pc <= pc_plus4_plusL;
													endcase
												end
										5'd3: begin
													case(zero_alu)
														1'd1: next_pc <= pc_plus4;
														1'd0: next_pc <= pc_plus4_plusL;
													endcase
												end
									endcase
								end
						3'd2: next_pc <= L_pseudo;
						3'd4: begin
									case(carry_alu)
										1'd0: next_pc <= pc_plus4;
										1'd1: next_pc <= L_pseudo;
									endcase
								end
						3'd5: begin
									case(carry_alu)
										1'd1: next_pc <= pc_plus4;
										1'd0: next_pc <= L_pseudo;
									endcase
								end
					endcase 
					
					
				end

endmodule

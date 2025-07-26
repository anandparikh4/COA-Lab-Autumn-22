`timescale 1ns / 1ps

// What should be the output?

module top(input clk, input rst,output [31:0] out_top);

wire [31:0] instr;
wire [31:0] curr_pc;
wire [31:0] pc_plus_4;
wire [31:0] next_pc;
wire [31:0] write_data;
wire [4:0] write_reg1;
wire [16:0] se15_in;
wire [16:0] se5_out;
wire [31:0] se15_out;
wire [31:0] read_data_1;
wire [31:0] read_data_2;
wire [31:0] alu_R;
wire [31:0] mem_out;
wire [31:0] mem_mux_out;
wire [31:0] alu_out;
wire carry_out;
wire alu_carry;
wire alu_zero;
wire alu_msb;
//wire [28:0] L_pseudo_in;
//wire [31:0] L_pseudo_out;
wire [31:0] L_pseudo;
//wire [31:0] jump_adder_op2;
wire [31:0] pc_plus4_plusL;

// control signals

wire regdst;
wire write31;
wire regwrite;
wire [1:0] alu_op;
wire [1:0] shift_sel;
wire alu_src;
wire mem_read;
wire mem_write;
wire mem_to_reg;
wire [2:0] branch_op;
wire [2:0] alu_control_signal;

assign out_top = alu_out;

program_counter pc( .clk(clk) , .rst(rst) , .pc(next_pc) , .next_pc(curr_pc) );

// IT ONLY DOES +1
adder increment_pc( .A(curr_pc) , .B(32'd1) , .C0(1'd0) , .S(pc_plus_4) , .C32() );

// concatenation of sl2 instr[26:0] with pc_plus_4

reg [31:0] write_data_reg;

always@(*) begin
	case(write31)
		1'd0: write_data_reg <= mem_mux_out;
		1'd1: write_data_reg <= pc_plus_4;
		default : write_data_reg <= 0;
	endcase
end

assign write_data = write_data_reg;

// single port ROM
instruction_memory instruction_memory (
  .clka(clk), // input clka
  .addra(next_pc[10:0]), // input [10 : 0] addra,check
  .douta(instr) // output [31 : 0] douta
);

wire mem_access;
assign mem_access = mem_read || mem_write;

// single port RAM
data_memory data_memory (
  .clka(~clk), // input clka
  .ena(mem_access), 	/*WHAT TO PASS HERE??*/
  .wea(mem_write), // input [0 : 0] wea
  .addra(alu_out[10:0]), // input [10 : 0] addra
  .dina(read_data_2), // input [31 : 0] dina
  .douta(mem_out) // output [31 : 0] douta
);

reg [31:0] mem_mux_out_reg;

always@(*) begin
	case(mem_to_reg)
		1'd0 : mem_mux_out_reg <= alu_out;
		1'd1 : mem_mux_out_reg <= mem_out;
		default : mem_mux_out_reg <= 0;
	endcase
end

assign mem_mux_out = mem_mux_out_reg;

wire [1:0] write31_regdst_CAT = {write31,regdst};
reg [4:0] write_reg1_reg;

always@(*) begin
	case(write31_regdst_CAT)
		2'd0 : write_reg1_reg <= instr[26:22];
		2'd1 : write_reg1_reg <= instr[21:17];
		2'd2 : write_reg1_reg <= 5'd31;
		default : write_reg1_reg <= 0;
	endcase
end

assign write_reg1 = write_reg1_reg;

regfile rf(.clk(clk), .rst(rst) , .write_data(write_data) , .write_reg(write_reg1) ,
					.regwrite(regwrite) , .read_reg1(instr[26:22]) , .read_reg2(instr[21:17]),
					.read_data1(read_data_1) , .read_data2(read_data_2) );

main_control MAIN_CONTROL( .opcode(instr[31:27]), .reg_dst(regdst),.write_31(write31), .reg_write(regwrite),
					.alu_op(alu_op), .shift_sel(shift_sel), .alu_src(alu_src) , 
					.mem_read(mem_read) , .mem_write(mem_write) , .mem_to_reg(mem_to_reg), .branch_op(branch_op) );
					
sign_extend_5 se5( .in(instr[16:5]) , .out(se5_out) );

reg [16:0] se15_in_reg;

always@(*) begin
	case(shift_sel)
		2'd0 : se15_in_reg <= se5_out;
		2'd1 : se15_in_reg <= instr[16:0];
		2'd2 : se15_in_reg <= instr[21:5];
		default : se15_in_reg <= 0;
	endcase
end

assign se15_in = se15_in_reg;

sign_extend_15 se15( .in(se15_in) , .out(se15_out) );

reg [31:0] alu_R_reg;

always@(*) begin
	case(alu_src)
		1'd0 : alu_R_reg <= read_data_2;
		1'd1 : alu_R_reg <= se15_out;
		default : alu_R_reg <= 0;
	endcase
end

assign alu_R = alu_R_reg;

alu ALU( .in1(read_data_1) , .in2(alu_R) , .alu_control(alu_control_signal) ,
			  .out(alu_out) , .zero_flag(alu_zero) , .msb_flag(alu_msb) ,
			  .carry_flag(alu_carry) );
		  
carry_register CY(.clk(clk) , .rst(rst) , .carry_in(alu_carry) , .carry_out(carry_out) );
			  
alu_control ALU_CONTROL(.alu_op(alu_op) , .fn_code(instr[4:0]) , .alu_control_signal(alu_control_signal) );

branch_control BRANCH_CONTROL(.branch_op(branch_op) , .fn_code(instr[4:0]) , .pc_plus4(pc_plus_4) ,
							 .pc_plus4_plusL(pc_plus4_plusL) , .L_pseudo(L_pseudo) , 
							 .rs(read_data_1) , .zero_alu(alu_zero) , .msb_alu(alu_msb) ,
							 .carry_alu(carry_out) , .next_pc(next_pc) );		

adder jump_adder( .A(pc_plus_4) , .B(se15_out) , .C0(1'd0) , .S(pc_plus4_plusL) , .C32() );

//wire [1:0] zeros;
//assign zeros = 2'b00;
//assign L_pseudo_in = {instr[26:0],zeros};
//assign L_pseudo_out = {pc_plus_4[31:29] , L_pseudo_in};
assign L_pseudo = {pc_plus_4[31:27],instr[26:0]};		// 5 bits of PC+4 and the remaining from the instruction
//assign jump_adder_op2 = se15_out;
//SL shift_left_2_1(.in() , .sh() , .out() );		
//SL shift_left_2_2(.in() , .sh() , .out() );	 

endmodule
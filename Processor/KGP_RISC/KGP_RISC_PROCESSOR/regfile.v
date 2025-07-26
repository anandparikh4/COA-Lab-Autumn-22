`timescale 1ns / 1ps

module regfile(input clk, input rst, input wire[31:0] write_data, input wire[4:0] write_reg,
					input wire regwrite, input wire[4:0] read_reg1, input wire[4:0] read_reg2,
					output wire[31:0] read_data1, output wire[31:0] read_data2);

reg [31:0] registers[31:0];

always@(posedge clk) begin

	if(rst) begin
		registers[0] <= 0;
		registers[1] <= 0;
		registers[2] <= 0;
		registers[3] <= 0;
		registers[4] <= 0;
		registers[5] <= 0;
		registers[6] <= 0;
		registers[7] <= 0;
		registers[8] <= 0;
		registers[9] <= 0;
		registers[10] <= 0;
		registers[11] <= 0;
		registers[12] <= 0;
		registers[13] <= 0;
		registers[14] <= 0;
		registers[15] <= 0;
		registers[16] <= 0;
		registers[17] <= 0;
		registers[18] <= 0;
		registers[19] <= 0;
		registers[20] <= 0;
		registers[21] <= 0;
		registers[22] <= 0;
		registers[23] <= 0;
		registers[24] <= 0;
		registers[25] <= 0;
		registers[26] <= 0;
		registers[27] <= 0;
		registers[28] <= 0;
		registers[29] <= 0;
		registers[30] <= 0;
		registers[31] <= 0;
	end 
	
	else begin
		if(regwrite) registers[write_reg] <= write_data;
	end

end

assign read_data1 = registers[read_reg1];
assign read_data2 = registers[read_reg2];

endmodule

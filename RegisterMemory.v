`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:52 12/01/2020 
// Design Name: 
// Module Name:    RegisterMemory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RegisterMemory(
    input [4:0] read_reg1,
    input [4:0] read_reg2,
    input [4:0] write_reg,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2,
    input regWrite,
	 input clk
    );
	 
	 reg[31:0] regmem[31:0];
	 wire[4:0] reg_address1 = read_reg1[4:0];
	 wire[4:0] reg_address2 = read_reg2[4:0];
	 wire[4:0] reg_address3 = write_reg[4:0];
	 reg [5:0] i;
	 
	 initial begin
		for(i=0; i<32; i=i+1) begin
			regmem[i] = 32'h00000000;
		end
	end
	
	always @(negedge clk) begin
		if(regWrite) begin
			regmem[write_reg] = write_data;
		end
	end
	assign read_data1 = regmem[read_reg1];
	assign read_data2 = regmem[read_reg2];

endmodule

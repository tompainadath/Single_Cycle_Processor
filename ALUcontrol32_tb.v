`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:37:22 12/01/2020
// Design Name:   ALUcontrol32
// Module Name:   E:/Google Drive/School Items/Current Work/Temple Fall 2020/Advanced Processors/Final Project Verilog/Final_project/ALUcontrol32_tb.v
// Project Name:  Final_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUcontrol32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUcontrol32_tb;

	// Inputs
	reg [31:0] instruction;
	reg [1:0] ALUop;

	// Outputs
	wire [3:0] func_out;

	// Instantiate the Unit Under Test (UUT)
	ALUcontrol32 uut (
		.instruction(instruction), 
		.ALUop(ALUop), 
		.func_out(func_out)
	);

	initial begin
		ALUop = 2'b00; instruction = 32'b00000000000000000000000000000000;#10;	//start with no instruction or alu_opcode
      ALUop = 2'b10; instruction = 32'b00000000000000000000000000100000;#10;	//set instruction to ADD
		ALUop = 2'b10; instruction = 32'b00000000000000000000000000100010;#10;	//set instruction to SUB
		ALUop = 2'b10; instruction = 32'b00000000000000000000000000100100;#10;	//set instruction to AND
		ALUop = 2'b10; instruction = 32'b00000000000000000000000000100101;#10;	//set instruction to OR
		ALUop = 2'b01; instruction = 32'b00010000000000000000000000000000;#10;	//set instruction to BEQ
		ALUop = 2'b01; instruction = 32'b00010100000000000000000000000000;#10;	//set instruction to BNE
		ALUop = 2'b00; instruction = 32'b10001100000000000000000000000000;#10;	//set instruction to LW
		ALUop = 2'b00; instruction = 32'b10101100000000000000000000000000;#10;	//set instruction to SW
		$finish;

	end
      
endmodule


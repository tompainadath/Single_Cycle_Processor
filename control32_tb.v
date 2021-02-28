`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:34:26 12/01/2020
// Design Name:   control32
// Module Name:   E:/Google Drive/School Items/Current Work/Temple Fall 2020/Advanced Processors/Final Project Verilog/Final_project/control32_tb.v
// Project Name:  Final_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control32_tb;

	// Inputs
	reg [31:0] instruction;

	// Outputs
	wire RegDst_out;
	wire ALUSrc_out;
	wire MemtoReg_out;
	wire RegWrite_out;
	wire MemRead_out;
	wire MemWrite_out;
	wire Branch_out;
	wire Jump_out;
	wire [1:0] ALUOp_out;

	// Instantiate the Unit Under Test (UUT)
	control32 uut (
		.instruction(instruction), 
		.RegDst_out(RegDst_out), 
		.ALUSrc_out(ALUSrc_out), 
		.MemtoReg_out(MemtoReg_out), 
		.RegWrite_out(RegWrite_out), 
		.MemRead_out(MemRead_out), 
		.MemWrite_out(MemWrite_out), 
		.Branch_out(Branch_out), 
		.Jump_out(Jump_out), 
		.ALUOp_out(ALUOp_out)
	);

	initial begin
		instruction = 32'b00000000000000000000000000000000;#10;	//start with no instruction
      instruction = 32'b00000000000000000000000000100000;#10;	//set instruction to ADD
		instruction = 32'b00010000000000000000000000000000;#10;	//set instruction to BEQ
		instruction = 32'b00010100000000000000000000000000;#10;	//set instruction to BNE
		instruction = 32'b10001100000000000000000000000000;#10;	//set instruction to LW
		instruction = 32'b10101100000000000000000000000000;#10;	//set instruction to SW
		instruction = 32'b00001000000000000000000000000000;#10;	//set instruction to J
		$finish;
		//instruction = 32'b;#10;	//set instruction to 

	end
      
endmodule


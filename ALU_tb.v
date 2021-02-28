`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:47:40 12/04/2020
// Design Name:   ALU
// Module Name:   E:/Google Drive/School Items/Current Work/Temple Fall 2020/Advanced Processors/Final Project Verilog/Final_project/ALU_tb.v
// Project Name:  Final_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [31:0] a_in;
	reg [31:0] b_in;
	reg [3:0] ALUop;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.result(result), 
		.zero(zero), 
		.a_in(a_in), 
		.b_in(b_in), 
		.ALUop(ALUop)
	);

	initial begin
		// Initialize Inputs
		a_in = 0;
		b_in = 0;
		ALUop = 0;
		#10;
		
		// do addition
		a_in = 10;
		b_in = 5;
		ALUop = 4'b0010;
		#10;
		
		// do subtraction
		a_in = 10;
		b_in = 5;
		ALUop = 4'b0110;
		#10;
		
		// do multiplication
		a_in = 10;
		b_in = 6;
		ALUop = 4'b1001;
		#10;
		
		// do division
		a_in = 10;
		b_in = 5;
		ALUop = 4'b1010;
		#10;
		
		// do an AND op
		a_in = 1;
		b_in = 2;
		ALUop = 4'b0000;
		#10;
		
		// do an OR op
		a_in = 1;
		b_in = 2;
		ALUop = 4'b0001;
		#10;
		
		// do a NOR op
		a_in = 1;
		b_in = 2;
		ALUop = 4'b1100;
		#10;
		
		// do a SLT op
		a_in = 10;
		b_in = 5;
		ALUop = 4'b0111;
		#10;
		// do a SLT op
		a_in = 5;
		b_in = 10;
		ALUop = 4'b0111;
		#10;
		$finish;
        

	end
      
endmodule


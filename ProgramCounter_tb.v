`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:40:33 12/02/2020
// Design Name:   ProgramCounter
// Module Name:   C:/Users/sbuck/OneDrive/Desktop/AdvProcessors/FinalProject/ProgramCounter/ProgramCounter_tb.v
// Project Name:  ProgramCounter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProgramCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter_tb;

	// Inputs
	reg [31:0] a;
	reg clk;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	ProgramCounter uut (
		.a(a), 
		.clk(clk), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      a = 5;
		clk = 1;
		#10;
		a = 78;
		clk = 0;
		#10;
		a = 78;
		clk = 1;
		#10;
		a = 1234;
		clk = 1;
		// Add stimulus here

	end
      
endmodule


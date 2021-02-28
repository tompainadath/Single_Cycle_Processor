`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:59:39 11/10/2020
// Design Name:   add32
// Module Name:   C:/Users/sbuck/OneDrive/Desktop/AdvProcessors/FinalProject/add32/add32_tb.v
// Project Name:  add32
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: add32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module add32_tb;
	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg c_in;
	// Outputs
	wire c_out;
	wire [31:0] out;
	// Instantiate the Unit Under Test (UUT)
	add32 uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.c_out(c_out), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 32'd0;
		b = 32'd0;
		c_in = 0;

		// Wait 100 ns for global reset to finish
		#100 a = 10;
		b = 20;
		
		#10 a = 20;
		b = -5;
		#10 $finish;
		// Add stimulus here

	end 
endmodule


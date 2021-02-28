`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:24:02 11/03/2020
// Design Name:   AND1bit
// Module Name:   C:/Users/micha/OneDrive/Desktop/Advanced Processors Final/FinalProject/AND1bit_tb.v
// Project Name:  FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AND1bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AND1bit_tb;

	// Inputs
	reg A;
	reg B;
	reg Z;

	// Instantiate the Unit Under Test (UUT)
	AND1bit uut (
		.A(A), 
		.B(B), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Z = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 1;
		B = 0;
		#10
		A = 0;
		B = 1;
		#10
		A = 1;
		B = 1;
		#10
		A = 0;
		B = 0;
		#10 $finish;
	end
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:45:06 11/18/2020
// Design Name:   sign_extend
// Module Name:   C:/Users/sbuck/OneDrive/Desktop/AdvProcessors/FinalProject/sign_extend/sign_extend_tb.v
// Project Name:  sign_extend
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sign_extend_tb;

	// Inputs
	reg [15:0] a;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	sign_extend uut (
		.a(a), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a = 456;
		#10;
		a = -136;
		#10;
		a = -1;
        
		// Add stimulus here

	end
      
endmodule


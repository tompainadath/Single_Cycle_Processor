`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:32:52 11/10/2020
// Design Name:   shiftLeft
// Module Name:   C:/Users/tompa/OneDrive - Temple University/Temple/2020-2021/Advanced Processor/Final_Project/FinalProject_Group12/shiftLeft_tb.v
// Project Name:  FinalProject_Group12
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shiftLeft
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shiftLeft_tb;

	// Inputs
	reg [31:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	shiftLeft uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		assign in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		assign in = 10;
		#10
		assign in = 15;
		#10
		assign in = 1;
		#10
		assign in = 32'hFFFFFFFF;
		#10
		assign in = 32'hC0000000;
		#10 $finish;

	end
      
endmodule


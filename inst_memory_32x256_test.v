`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:37:54 11/25/2020
// Design Name:   inst_memory_32x256
// Module Name:   /home/ise/ECE4612_FinalProject/inst_memory_32x256_test.v
// Project Name:  ECE4612_FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: inst_memory_32x256
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module inst_memory_32x256_test;

	// Inputs
	reg [31:0] address;

	// Outputs
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	inst_memory_32x256 uut (
		.address(address), 
		.instruction(instruction)
	);

	initial begin
		// Initialize Inputs
		address = 0; #10; //get instruction at location 0
		address = 4; #10; //get instruction at location 4
		address = 8; #10; //get instruction at location 8
		address = 12; #10;//get instruction at location 12
		address = 6; #10; //get instruction at location 4 (test what happens if val%4 != 0)
		$finish;

	end
      
endmodule


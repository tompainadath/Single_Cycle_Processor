`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:38:18 11/03/2020
// Design Name:   mux32_test
// Module Name:   /home/ise/ECE4612_FinalProject/mux32_test.v
// Project Name:  ECE4612_FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplexor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux32_test;

	// Inputs
	reg [31:0] din_1;
	reg [31:0] din_0;
	reg select;

	// Outputs
	wire [31:0] dout;

	// Instantiate the Unit Under Test (UUT)
	mux32 uut (
		.din_1(din_1), 
		.din_0(din_0), 
		.dout(dout), 
		.select(select)
	);

	initial begin
		// Initialize Inputs
		din_1 = 32'hff0ff0ff;
		din_0 = 32'h00000000;
		select = 0;

		#10 select = 1;
		#10 select = 0;
		#10 select = 1;
		#10 $finish;
	end
      
endmodule


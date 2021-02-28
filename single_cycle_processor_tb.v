`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:29:47 12/08/2020
// Design Name:   single_cycle_processor
// Module Name:   E:/Google Drive/School Items/Current Work/Temple Fall 2020/Advanced Processors/Final Project Verilog/Final_project/single_cycle_processor_tb.v
// Project Name:  Final_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: single_cycle_processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module single_cycle_processor_tb;

	// Inputs
	reg clock;
	reg reset;
	
	wire [31:0] program_counter;
	wire [31:0] alu_result;
	wire [31:0] reg_mem;
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	single_cycle_processor uut (
		.clock(clock), 
		.reset(reset),
		.program_counter(program_counter),
		.alu_result(alu_result),
		.reg_mem(reg_mem),
		.instruction(instruction)
	);
	
	reg [7:0] clock_count;
	
	initial begin
		// Initialize Inputs
			clock = 0;
			reset = 0;
			clock_count=0;
			#5;
			for(clock_count=1; clock_count<16+1; clock_count=clock_count+1) begin
				//clock = ~clock;
				clock = 1;
				#5;
				clock = 0;
				#5;
			end
			//clock = 0;
			//#5;
			//forever #10 clock = ~clock;
        $finish;
		// Add stimulus here

	end
      
endmodule


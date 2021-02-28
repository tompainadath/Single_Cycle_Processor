`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:28:23 11/17/2020
// Design Name:   data_memory_32x256
// Module Name:   /home/ise/ECE4612_FinalProject/data_memor_32x256_test.v
// Project Name:  ECE4612_FinalProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_memory_32x256
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module data_memor_32x256_test;

	// Inputs
	reg [31:0] write_data;
	reg [31:0] address;
	reg clk;
	reg read_en;
	reg write_en;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	data_memory_32x256 uut (
		.write_data(write_data), 
		.read_data(read_data), 
		.address(address), 
		.clk(clk),
		.read_en(read_en),
		.write_en(write_en)
	);

	initial begin
		write_data = 0;	//clk low, no data
		address = 0;
		clk = 0;
		read_en = 0;
		write_en = 0;
		
		#10;write_data = 0;	//clk high, no data
		address = 0;
		clk = 1;
		read_en = 0;
		write_en = 0;
		
		#10;write_data = 32'hFFFF0000;
		address = 0;
		clk = 0;
		read_en = 0;
		write_en = 1;
		
		#10;write_data = 32'hFFFF0000;	//write to address 0
		address = 0;
		clk = 1;
		read_en = 0;
		write_en = 1;
        
		#10;write_data = 32'h0000FFFF;	//check that address isnt overwritten on next pos clock
		address = 0;
		clk = 0;
		read_en = 0;
		write_en = 0;
		
		#10;write_data = 32'h0000FFFF;	
		address = 0;
		clk = 1;
		read_en = 0;
		write_en = 0;
		
		#10;write_data = 32'h0000FFFF;	//write to address 1
		address = 1;
		clk = 0;
		read_en = 0;
		write_en = 1;
		
		#10;write_data = 32'h0000FFFF;
		address = 1;
		clk = 1;
		read_en = 0;
		write_en = 1;
		
		#10;write_data = 32'h00FFFF00;	//write to address 2
		address = 2;
		clk = 0;
		read_en = 0;
		write_en = 1;
		
		#10;write_data = 32'h00FFFF00;
		address = 2;
		clk = 1;
		read_en = 0;
		write_en = 1;
		
		#10;write_data = 32'h0000FFFF;	//display address 0
		address = 0;
		clk = 0;
		read_en = 1;
		write_en = 0;
		
		#10;write_data = 32'h0000FFFF;	//display address 1
		address = 1;
		clk = 1;
		read_en = 1;
		write_en = 0;
		
		#10;write_data = 32'h0000FFFF;	//display address 2
		address = 2;
		clk = 0;
		read_en = 1;
		write_en = 0;
		
		#10$finish;
		// Add stimulus here

	end
      
endmodule


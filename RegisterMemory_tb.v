`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:56:43 12/01/2020
// Design Name:   RegisterMemory
// Module Name:   C:/Users/micha/OneDrive/Desktop/Advanced Processors Final/RegisterMemory/RegisterMemory_tb.v
// Project Name:  RegisterMemory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegisterMemory_tb;

	// Inputs
	reg [4:0] read_reg1;
	reg [4:0] read_reg2;
	reg [4:0] write_reg;
	reg [31:0] write_data;
	reg regWrite;
	reg clk;

	// Outputs
	wire [31:0] read_data1;
	wire [31:0] read_data2;

	// Instantiate the Unit Under Test (UUT)
	RegisterMemory uut (
		.read_reg1(read_reg1), 
		.read_reg2(read_reg2), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.read_data1(read_data1), 
		.read_data2(read_data2), 
		.regWrite(regWrite),
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		read_reg1 = 0;
		read_reg2 = 0;
		write_reg = 0;
		write_data = 0;
		regWrite = 0;
		clk = 0;
		
		#5;	//clk high with data testing write read on same cycle
		write_data = 32'hF0F0F0F0;
		read_reg1 = 0;
		read_reg2 = 2;
		write_reg = 2;
		regWrite = 1;
		clk = 1;#5;clk = 0;
		
		#5;	//clk low with data testting if data is saved over clock cycles
		write_data = 32'hFFFF0000;
		read_reg1 = 2;
		read_reg2 = 1;
		write_reg = 1;
		regWrite = 1;
		clk = 1;#5;clk = 0;
		
		#5;	//clk high with data testing overwrite of memory 2
		write_data = 32'hFFFFFFFF;
		read_reg1 = 0;
		read_reg2 = 2;
		write_reg = 2;
		regWrite = 1;
		clk = 1;#5;clk = 0;
		
		#5;	//clk high with data, testing if write happens when regWrite is 0
		write_data = 32'h00000000;
		read_reg1 = 0;
		read_reg2 = 2;
		write_reg = 2;
		regWrite = 0;
		clk = 1;#5;clk = 0;
		

		// Wait 100 ns for global reset to finish
		#5;	//clk high with data, testing if write happens when regWrite is 0
		write_data = 32'h00000000;
		read_reg1 = 1;
		read_reg2 = 2;
		write_reg = 3;
		regWrite = 0;
		clk = 1;#5;clk = 0;
		#5;
		$finish;
        
		// Add stimulus here

	end
      
endmodule


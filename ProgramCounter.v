`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:31 12/02/2020 
// Design Name: 
// Module Name:    ProgramCounter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ProgramCounter(
    input [31:0] a,
	 input clk,
    output [31:0] out
    );
	 reg [31:0] count;
	 
	 initial begin
		count = 0;
	end
	
	always @(posedge clk) begin		count = a;
	end
	
	assign out = count;
	
endmodule

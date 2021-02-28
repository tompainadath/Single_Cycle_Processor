`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:12:58 11/17/2020 
// Design Name: 
// Module Name:    data_memory_32x256 
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
module data_memory_32x256(
	input [31:0] write_data,
   output [31:0] read_data,
	input [31:0] address,
   input clk,
	input read_en,
   input write_en
   );
	
	reg [31:0] data_ram [255:0];
	wire [7:0] ram_address = address[7:0];
	reg [8:0] i;
	
	initial begin	//set all the ram in the block to 0x00000000
		for(i=0; i<256; i=i+1) begin
			data_ram[i] = 32'h00000000;
		end
	end
	
	always @(posedge clk) begin	//when positive edge detected on clock, 
		if(write_en) begin			//write data to ram if write_en is enabled
			data_ram[ram_address] = write_data;
		end
	end
	assign read_data = (read_en==1'b1) ? data_ram[ram_address]: 32'h00000000;
endmodule

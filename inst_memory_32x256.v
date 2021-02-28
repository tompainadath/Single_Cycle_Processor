`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:28:14 11/19/2020 
// Design Name: 
// Module Name:    inst_memory_32x256 
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

//add		| 32'b000000 00000 00000 00000 00000 100000
//addi	| 32'b001000 00000 00000 0000000000000000
//sub		| 32'b000000 00000 00000 00000 00000 100010
//div		| 32'b000000 00000 00000 00 0000 0000 011010
//mul		| 32'b000000 00000 00000 00000 00000 011000
//SLT		| 32'b000000 00000 00000 00000 00000 101010
//AND		| 32'b000000 00000 00000 00000 00000 100100
//OR		| 32'b000000 00000 00000 00000 00000 100101
//beq		| 32'b000100 00000 00000 00000 00000 000000
//bne		| 32'b000101 00000 00000 00000 00000 000000
//lw		| 32'b100011 00000 00000 00000 00000 000000
//sw		| 32'b101011 00000 00000 00000 00000 000000
//j		| 32'b000010 00000 00000 00000 00000 000000

module inst_memory_32x256(
    input [31:0] address,
    output [31:0] instruction
    );
	
	reg [31:0] inst_rom [255:0];				//rom storage register
	wire [7:0] rom_address = address[31:0]>>2;	//address to select register
	reg [8:0] i;									//counter var in for loop
	
	initial begin	//set all the rom in the block to 0x00000000
		for(i=0; i<256; i=i+1) begin
			inst_rom[i] = 32'h00000000;
		end
		/*
		inst_rom[0] = 32'b00000000000000000000000000000000;	//no instruction for first cycle
		inst_rom[1] = 32'b00100000000000010000000000001010;	//addi 10 into reg 1
		inst_rom[2] = 32'b00100000000000100000000000001111;	//addi 15 into reg 2
		inst_rom[3] = 32'b00000000001000100001100000100000;	//add reg 1 and 2, store in reg 3
		*/
		inst_rom[0] = 32'b00000000000000000000000000000000;	//no instruction for first cycle
		
		inst_rom[1] = 32'b00100000000000010000001111101000;	//addi 1, 0, 1000;
		inst_rom[2] = 32'b00100000000000100000000011001000;	//addi 2, 0, 200;
		inst_rom[3] = 32'b00100000000000111111111011010100;	//addi 3, 0, -300;
		inst_rom[4] = 32'b00100000000001000000000110010000;	//addi 4, 0, 400;
		inst_rom[5] = 32'b00100000000001011111111110011100;	//addi 5, 0, -100;
		inst_rom[6] = 32'b00100000000001100000000000000011;	//addi 6, 0, 3;
		
		inst_rom[7] = 32'b00000000000000000000000000000000;	//no instruction for first cycle
		
		inst_rom[8] = 32'b00000000001000100000100000011000;	//mul 1, 1, 2;
		inst_rom[9] = 32'b00000000011001000001100000011000;	//mul 3, 3, 4;
		inst_rom[10] = 32'b00000000001000110000100000100000;	//add 1, 1, 3;
		inst_rom[11] = 32'b00000000001001010000100000100010;	//sub 1, 1, 5;
		inst_rom[12] = 32'b00000000001001100000100000011010;	//div 1, 1, 6;
		
		inst_rom[13] = 32'b00000000000000000000000000000000;	//no instruction for first cycle
		
		inst_rom[14] = 32'b10101100000000010000000000000000;	//sw 1, 0(0);
		inst_rom[15] = 32'b10001100000000010000000000000000;	//lw 1, 0(0);
		
		//inst_rom[12] = 32'b001000 00000 00011 1111111011010100;	//
		//inst_rom[13] = 32'b001000 00000 00001 0000001111101000;	//
		//inst_rom[14] = 32'b001000 00000 00010 0000000011001000;	//
		//inst_rom[15] = 32'b001000 00000 00011 1111111011010100;	//
		
	end
	
	assign instruction = inst_rom[rom_address];	//assign data in rom to instruction output
	
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:26 12/01/2020 
// Design Name: 
// Module Name:    ALUcontrol32 
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
module ALUcontrol32(
   input [31:0] instruction,
   input [1:0] ALUop,
   output [3:0] func_out
   );
	reg [3:0] func;
	always @(*) begin
		case(ALUop)
		2'b00 : begin	//if LW or SW ALU Opcode
			func = 4'b0010;
		end
		2'b01 : begin	//if BEQ, BNE ALU Opcode
			func = 4'b0110;
		end
		2'b10 : begin	//if R type ALU Opcode
			case(instruction[5:0])	//get function from instruction
			6'b100000 : begin	//if ADD function 
				func = 4'b0010;
			end
			6'b100010 : begin	//if SUB function 
				func = 4'b0110;
			end
			6'b011010 : begin	//if DIV function 
				func = 4'b1010;
			end
			6'b011000 : begin	//if MUL function 
				func = 4'b1001;
			end
			6'b101010 : begin	//if SLT function 
				func = 4'b0111;
			end
			6'b100100 : begin	//if AND function 
				func = 4'b0000;
			end
			6'b100101 : begin	//if OR function 
				func = 4'b0001;
			end
			6'b100111 : begin	//if NOR function 
				func = 4'b1100;
			end
			default : begin
				func = 4'b0000;
			end
			endcase
		end
		2'b11 : begin	//if ADDI ALU Opcode
			func = 4'b0010;
		end
		endcase
	end
	assign func_out = func;
endmodule

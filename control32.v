`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:44 12/01/2020 
// Design Name: 
// Module Name:    control32 
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
module control32(
    input [31:0] instruction,
    output RegDst_out,
    output ALUSrc_out,
    output MemtoReg_out,
    output RegWrite_out,
    output MemRead_out,
    output MemWrite_out,
    output Branch_out,
	 output Jump_out,
    output [1:0] ALUOp_out
    );
	reg [5:0] opcode;	//stores opcode
	//reg [5:0] func;	//stores function code
	reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump;	//temp memories for assignment
	reg [1:0] ALUOp;	//temp memories for assignment
	always @(*) begin
		opcode = instruction[31:26];	//isolate opcode
		//func = instruction[5:0];		//isolate function
		
		case(opcode)
		6'b000000 : begin	//if R opcode
			RegDst = 1'b1;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			RegWrite = 1'b1;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Branch = 1'b0;
			Jump = 1'b0;
			ALUOp = 2'b10;
		end
		6'b001000 : begin //if ADDI opcode
			RegDst = 1'b0;
			ALUSrc = 1'b1;
			MemtoReg = 1'b0;
			RegWrite = 1'b1;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Branch = 1'b0;
			Jump = 1'b0;
			ALUOp = 2'b11;
		end
		6'b100011 : begin	//if LW opcode
			RegDst = 1'b0;
			ALUSrc = 1'b1;
			MemtoReg = 1'b1;
			RegWrite = 1'b1;
			MemRead = 1'b1;
			MemWrite = 1'b0;
			Branch = 1'b0;
			Jump = 1'b0;
			ALUOp = 2'b00;
		end
		6'b101011 : begin //if SW opcode
			RegDst = 1'b0;
			ALUSrc = 1'b1;
			MemtoReg = 1'b0;
			RegWrite = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b1;
			Branch = 1'b0;
			Jump = 1'b0;
			ALUOp = 2'b00;
		end
		6'b000100 : begin //if BEQ opcode
			RegDst = 1'b0;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			RegWrite = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Branch = 1'b1;
			Jump = 1'b0;
			ALUOp = 2'b01;
		end
		6'b000101 : begin //if BNE opcode
			RegDst = 1'b0;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			RegWrite = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Branch = 1'b1;
			Jump = 1'b0;
			ALUOp = 2'b01;
		end
		6'b000010 : begin //if J opcode
			RegDst = 1'b0;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			RegWrite = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Branch = 1'b0;
			Jump = 1'b1;
			ALUOp = 2'b00;
		end
		default : begin	//default opcode
			RegDst = 1'b0;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			RegWrite = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b0;
			Branch = 1'b0;
			Jump = 1'b0;
			ALUOp = 2'b00;		
		end
		/*6'b000000 : begin //if ___ opcode
			RegDst = 1'b;
			ALUSrc = 1'b;
			MemtoReg = 1'b;
			RegWrite = 1'b;
			MemRead = 1'b;
			MemWrite = 1'b;
			Branch = 1'b;
			Jump = 1'b;
			ALUOp = 2'b;
		end*/
		endcase
	end
	
	assign RegDst_out = RegDst;
   assign ALUSrc_out = ALUSrc;
   assign MemtoReg_out = MemtoReg;
   assign RegWrite_out = RegWrite;
   assign MemRead_out = MemRead;
   assign MemWrite_out = MemWrite;
   assign Branch_out = Branch;
	assign Jump_out = Jump;
   assign ALUOp_out = ALUOp;
	
endmodule

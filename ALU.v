`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:17 12/04/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    output [31:0] result,
    output zero,
    input [31:0] a_in,
    input [31:0] b_in,
    input [3:0] ALUop
    );

	reg [31:0] c_res;
	reg [31:0] adder_out;
	reg [31:0] adder_a;
	reg [31:0] adder_b;
	reg c_in = 0;
	reg c_zero;

	add32 adder (
		.a(adder_a), 
		.b(adder_b), 
		.c_in(c_in), 
		.c_out(c_out), 
		.out(adder_out)
	);
	
	always @(*) begin
		case(ALUop)
		4'b0010 : begin	//add function
			//adder_a = a_in;
			//adder_b = b_in;
			//c_res = adder_out;
			c_res = a_in+b_in;
		end
		4'b0110 : begin	//sub function
			//c_res = adder_out;
			c_res = a_in-b_in;
		end
		4'b1010 : begin	//div function
			c_res = a_in/b_in;
		end
		4'b1001 : begin	//mul function
			c_res = a_in*b_in;
		end
		4'b0111 : begin	//SLT function
			if(a_in >= b_in) begin
				c_res = 0;
			end
			if(a_in < b_in) begin
				c_res = 1;
			end
		end
		4'b0000 : begin	//and function
			c_res = a_in&b_in;
		end
		4'b0001 : begin	//or function
			c_res = a_in|b_in;
		end
		4'b1100 : begin	//nor function
			c_res = ~(a_in|b_in);
		end
		default : begin	//default
			
		end
		endcase
		
		if(c_res == 0) begin	//check whether zero should be set
			c_zero = 1;
		end
		if(c_res != 0) begin	//check whether zero should be set
			c_zero = 0;
		end
	end
	
	assign result = c_res;
	assign zero = c_zero;
	
endmodule

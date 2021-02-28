`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:03:14 12/08/2020 
// Design Name: 
// Module Name:    single_cycle_processor 
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
/*
	y = (a*b + c*d - e)/f
	a = 1000
	b = 200
	c = -300
	d = 400
	e = -100
	f = 3
	
	addi 1, 0, 1000;	//a
	addi 2, 0, 200;	//b
	addi 3, 0, -300;	//c
	addi 4, 0, 400;	//d
	addi 5, 0, -100;	//e
	addi 6, 0, 3;		//f
	
	mul 1, 1, 2;	//multiply a and b	//d, t, s
	mul 3, 3, 4;	//multiply c and d
	add 1, 1, 3;	//add (a*b) and (c*d)
	sub 1, 1, 5;	//sub (a*b + c*d) and e
	div 1, 1, 6;	//div (a*b + c*d - e) and f
	
	sw 1, 0(0)
	lw 1, 0(0)
	
	OPCODE|regA|regB|regDST|000000|ALUoperation
	
	001000 00000 00001 0000001111101000
	001000 00000 00010 0000000011001000
	001000 00000 00011 1111111011010100
	001000 00000 00100 0000000110010000
	001000 00000 00101 1111111110011100
	001000 00000 00110 0000000000000011
	
	000000 00001 00010 00001 00000 011000
	000000 00011 00100 00011 00000 011000
	000000 00001 00011 00001 00000 100000
	000000 00001 00101 00001 00000 100010
	000000 00001 00110 00001 00000 011010
	
	101011 00000 00001 0000000000000000
	100011 00000 00001 0000000000000000
*/
//////////////////////////////////////////////////////////////////////////////////
module single_cycle_processor(
    input clock,
    input reset,
	 output [31:0] program_counter,
	 output [31:0] instruction,
	 output [31:0] alu_result,
	 output [31:0] reg_mem
    );
	
	wire [31:0] program_counter_input;	//input wires into program counter
	wire [31:0] program_counter_output;	//output wires from program counter
	
	ProgramCounter program_counter_block (	//Block 1 | program counter
		.a(program_counter_input), 
		.clk(clock), 
		.out(program_counter_output)
	);
	
	wire [31:0] mips_instruction;	//mips instruction currently selected
	
	inst_memory_32x256 instruction_mem (	//Block 2 | instruction memory
		.address(program_counter_output), 
		.instruction(mips_instruction)
	);
	
	wire jump, branch, mem_read, mem_to_reg, mem_write, ALU_src, reg_write, reg_dst;	//control wires
	wire [1:0] ALU_op;	//ALU opcode wires
	
	control32 control (	//Block 3 | control block
		.instruction(mips_instruction), 
		.RegDst_out(reg_dst), 
		.ALUSrc_out(ALU_src), 
		.MemtoReg_out(mem_to_reg), 
		.RegWrite_out(reg_write), 
		.MemRead_out(mem_read), 
		.MemWrite_out(mem_write), 
		.Branch_out(branch), 
		.Jump_out(jump), 
		.ALUOp_out(ALU_op)
	);
	
	wire [4:0] register_write;	//output of mux before entering register memory write wire
	
	mux5 register_write_mux (	//Block 4 | 5 bit mux going into write register wire on register memory
		.din_1(mips_instruction[15:11]), 
		.din_0(mips_instruction[20:16]), 
		.dout(register_write), 
		.select(reg_dst)
	);
	
	wire [31:0] data_mem_result;		//register coming off of mux (out of data memory block)
	wire [31:0] register_mem_read_1;	//value read from register memory read line 1
	wire [31:0] register_mem_read_2;	//value read from register memory read line 2
	
	wire [4:0] reg_1_loc;
	assign reg_1_loc = mips_instruction[25:21];
	//assign register_mem_read_1 = 0;
	//assign register_mem_read_2 = 0;
	
	RegisterMemory register_mem (	//Block 5 | register memory block
		.read_reg1(mips_instruction[25:21]), 
		.read_reg2(mips_instruction[20:16]), 
		.write_reg(register_write), 
		.write_data(data_mem_result), 
		.read_data1(register_mem_read_1), 
		.read_data2(register_mem_read_2), 
		.regWrite(reg_write),
		.clk(clock)
	);
	
	wire [31:0] extended_instruction_lower_word;	//result of sign extension
	
	sign_extend instruction_sign_extend (	//Block 6 | sign extension below register memory block
		.a(mips_instruction[15:0]), 
		.out(extended_instruction_lower_word)
	);
	
	wire [31:0] register_mux_output;		//mux output just before ALU
	
	mux32 ALU_read_mux (	//Block 7 | ALU mux taking in sign extension and register read data 2
		.din_1(extended_instruction_lower_word), 
		.din_0(register_mem_read_2), 
		.dout(register_mux_output), 
		.select(ALU_src)
	);
	
	wire [3:0] ALU_opcode;	//ALU opcode output from ALU control
	
	ALUcontrol32 ALU_control (	//Block 8 | ALU control block
		.instruction(mips_instruction), 
		.ALUop(ALU_op), 
		.func_out(ALU_opcode)
	);
	
	wire result_zero;			//if ALU result is zero, this will be set
	wire [31:0] result_ALU;	//result of ALU operation
	
	ALU ALU_block (	//Block 9 | ALU block
		.result(result_ALU), 
		.zero(result_zero), 
		.a_in(register_mem_read_1), 
		.b_in(register_mux_output), 
		.ALUop(ALU_opcode)
	);
	
	wire [31:0] data_memory_read;	//read line coming out of data memory block
	
	data_memory_32x256 data_mem (	//Block 10 | data memory block
		.write_data(register_mem_read_2), 
		.read_data(data_memory_read), 
		.address(result_ALU), 
		.clk(clock),
		.read_en(mem_read),
		.write_en(mem_write)
	);
	
	mux32 data_mem_mux (	//Block 11 | mux out of data memory selecting ALU result or data mem read wire
		.din_1(data_memory_read), 
		.din_0(result_ALU), 
		.dout(data_mem_result), 
		.select(mem_to_reg)
	);
	
	wire [31:0] add_shifter_result;	//result of shift left for jump logic adder
	
	shiftLeft add_shifter (	//Block 12 | shift left before jump logic add block
		.in(extended_instruction_lower_word), 
		.out(add_shifter_result)
	);
	
	wire [31:0] instruction_shifted_left;	//instruction shifted left two places
	
	shiftLeft instruction_shifter (	//Block 13 | shift left instruction, output to mux 18
		.in({6'b000000,mips_instruction[25:0]}), 
		.out(instruction_shifted_left)
	);
	
	wire [31:0] program_counter_adder_output;	//result of ADD+4 block for program counter
	
	add32 program_counter_adder (	//Block 14 | PC+4 adder block
		.a(program_counter_output), 
		.b(32'd4), 
		.c_in(32'd0), 
		.c_out(c_out), 
		.out(program_counter_adder_output)
	);
	
	wire [31:0] jump_address;	//jump address value
	assign jump_address = {program_counter_adder_output[31:28],instruction_shifted_left[27:0]};	//concatenate top 4 bits of PC and bottom 28 bits of shifted instruction
	
	wire [31:0] extended_lower_word_shifted_result;	//result of addition at jump adder output
	
	add32 secondary_adder (	//Block 15 | jump logic adder block
		.a(program_counter_adder_output), 
		.b(add_shifter_result), 
		.c_in(32'd0), 
		.c_out(c_out), 
		.out(extended_lower_word_shifted_result)
	);
	
	wire and_result;	//result of jump&&zero bits from ALU and control
	
	AND1bit and_block (	//Block 16 | AND gate select for mux 17
		.A(branch), 
		.B(result_zero), 
		.Z(and_result)
	);
	
	wire [31:0] mux_17_output;	//output of jump addition (selects PC+4 or PC+4+jump_location)
	
	mux32 mux_17 (	//Block 17 | jump logic mux 1 (branching select)
		.din_1(extended_lower_word_shifted_result), 
		.din_0(program_counter_adder_output), 
		.dout(mux_17_output), 
		.select(and_result)
	);
	
	mux32 mux_18 (	//Block 18 | jump logic mux 2 (add 4 or jump to new PC value)
		//.din_1(instruction_shifted_left), jump_address
		.din_1(jump_address), 
		.din_0(mux_17_output), 
		.dout(program_counter_input), 
		.select(jump)
	);
	
	assign program_counter = program_counter_output;	//Output program counter
	assign alu_result = result_ALU;							//Output ALU result wire
	assign reg_mem = data_mem_result;						//Output result of mux with data memory or ALU result wires (controlled by mem_to_reg wire)
	assign instruction = mips_instruction;					//Output MIPS instruction wire so we can see the loaded instruction
	
endmodule

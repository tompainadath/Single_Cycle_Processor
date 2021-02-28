`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:38 11/10/2020 
// Design Name: 
// Module Name:    add32 
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
module add32(
    input [31:0] a,
    input [31:0] b,
    input c_in,
    output c_out,
    output [31:0] out,
	 wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30
    );

add A0(a[0],b[0],c_in,c0,out[0]);
add A1(a[1],b[1],c0,c1,out[1]);
add A2(a[2],b[2],c1,c2,out[2]);
add A3(a[3],b[3],c2,c3,out[3]);
add A4(a[4],b[4],c3,c4,out[4]);
add A5(a[5],b[5],c4,c5,out[5]);
add A6(a[6],b[6],c5,c6,out[6]);
add A7(a[7],b[7],c6,c7,out[7]);
add A8(a[8],b[8],c7,c8,out[8]);
add A9(a[9],b[9],c8,c9,out[9]);
add A10(a[10],b[10],c9,c10,out[10]);
add A11(a[11],b[11],c10,c11,out[11]);
add A12(a[12],b[12],c11,c12,out[12]);
add A13(a[13],b[13],c12,c13,out[13]);
add A14(a[14],b[14],c13,c14,out[14]);
add A15(a[15],b[15],c14,c15,out[15]);
add A16(a[16],b[16],c15,c16,out[16]);
add A17(a[17],b[17],c16,c17,out[17]);
add A18(a[18],b[18],c17,c18,out[18]);
add A19(a[19],b[19],c18,c19,out[19]);
add A20(a[20],b[20],c19,c20,out[20]);
add A21(a[21],b[21],c20,c21,out[21]);
add A22(a[22],b[22],c21,c22,out[22]);
add A23(a[23],b[23],c22,c23,out[23]);
add A24(a[24],b[24],c23,c24,out[24]);
add A25(a[25],b[25],c24,c25,out[25]);
add A26(a[26],b[26],c25,c26,out[26]);
add A27(a[27],b[27],c26,c27,out[27]);
add A28(a[28],b[28],c27,c28,out[28]);
add A29(a[29],b[29],c28,c29,out[29]);
add A30(a[30],b[30],c29,c30,out[30]);
add A31(a[31],b[31],c30,c_out,out[31]);

endmodule

module add(
	input a,
	input b,
	input c_in,
	output c_out,
	output out
	);
	
	assign {c_out,out} = a + b + c_in;
		
	
endmodule 
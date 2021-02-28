`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:29 11/03/2020 
// Design Name: 
// Module Name:    mux32 
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
module mux32(
    input [31:0] din_1,
    input [31:0] din_0,
    output [31:0] dout,
    input select
    );
	 
mux_ele M0(din_1[0],din_0[0],dout[0],select);
mux_ele M1(din_1[1],din_0[1],dout[1],select);
mux_ele M2(din_1[2],din_0[2],dout[2],select);
mux_ele M3(din_1[3],din_0[3],dout[3],select);
mux_ele M4(din_1[4],din_0[4],dout[4],select);
mux_ele M5(din_1[5],din_0[5],dout[5],select);
mux_ele M6(din_1[6],din_0[6],dout[6],select);
mux_ele M7(din_1[7],din_0[7],dout[7],select);
mux_ele M8(din_1[8],din_0[8],dout[8],select);
mux_ele M9(din_1[9],din_0[9],dout[9],select);
mux_ele M10(din_1[10],din_0[10],dout[10],select);
mux_ele M11(din_1[11],din_0[11],dout[11],select);
mux_ele M12(din_1[12],din_0[12],dout[12],select);
mux_ele M13(din_1[13],din_0[13],dout[13],select);
mux_ele M14(din_1[14],din_0[14],dout[14],select);
mux_ele M15(din_1[15],din_0[15],dout[15],select);
mux_ele M16(din_1[16],din_0[16],dout[16],select);
mux_ele M17(din_1[17],din_0[17],dout[17],select);
mux_ele M18(din_1[18],din_0[18],dout[18],select);
mux_ele M19(din_1[19],din_0[19],dout[19],select);
mux_ele M20(din_1[20],din_0[20],dout[20],select);
mux_ele M21(din_1[21],din_0[21],dout[21],select);
mux_ele M22(din_1[22],din_0[22],dout[22],select);
mux_ele M23(din_1[23],din_0[23],dout[23],select);
mux_ele M24(din_1[24],din_0[24],dout[24],select);
mux_ele M25(din_1[25],din_0[25],dout[25],select);
mux_ele M26(din_1[26],din_0[26],dout[26],select);
mux_ele M27(din_1[27],din_0[27],dout[27],select);
mux_ele M28(din_1[28],din_0[28],dout[28],select);
mux_ele M29(din_1[29],din_0[29],dout[29],select);
mux_ele M30(din_1[30],din_0[30],dout[30],select);
mux_ele M31(din_1[31],din_0[31],dout[31],select);

endmodule

module mux5(
    input [4:0] din_1,
    input [4:0] din_0,
    output [4:0] dout,
    input select
    );
	 
mux_ele M0(din_1[0],din_0[0],dout[0],select);
mux_ele M1(din_1[1],din_0[1],dout[1],select);
mux_ele M2(din_1[2],din_0[2],dout[2],select);
mux_ele M3(din_1[3],din_0[3],dout[3],select);
mux_ele M4(din_1[4],din_0[4],dout[4],select);

endmodule

module mux_ele(
    input a,
    input b,
    output out,
	 input s
    );
assign out = s? a:b;
endmodule

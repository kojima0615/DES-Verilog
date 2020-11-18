`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/12 14:28:03
// Design Name: 
// Module Name: DES_expansion
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DES_expansion(in,out);
    input [1:32]in;
    output [0:47]out;
    assign out=
    {
    in[32],
    in[1],
    in[2],
    in[3],
    in[4],
    in[5],
    in[4],
    in[5],
    in[6],
    in[7],
    in[8],
    in[9],
    in[8],
    in[9],
    in[10],
    in[11],
    in[12],
    in[13],
    in[12],
    in[13],
    in[14],
    in[15],
    in[16],
    in[17],
    in[16],
    in[17],
    in[18],
    in[19],
    in[20],
    in[21],
    in[20],
    in[21],
    in[22],
    in[23],
    in[24],
    in[25],
    in[24],
    in[25],
    in[26],
    in[27],
    in[28],
    in[29],
    in[28],
    in[29],
    in[30],
    in[31],
    in[32],
    in[1]
    };
endmodule

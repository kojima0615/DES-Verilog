`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/11 20:22:58
// Design Name: 
// Module Name: Permuted_choice2
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


module Permuted_choice2(key,subkey);
    input [1:56]key;
    output [0:47]subkey;
    assign subkey=
    {key[14],
    key[17],
    key[11],
    key[24],
    key[1],
    key[5],
    key[3],
    key[28],
    key[15],
    key[6],
    key[21],
    key[10],
    key[23],
    key[19],
    key[12],
    key[4],
    key[26],
    key[8],
    key[16],
    key[7],
    key[27],
    key[20],
    key[13],
    key[2],
    key[41],
    key[52],
    key[31],
    key[37],
     key[47],
    key[55],
    key[30],
    key[40],
    key[51],
    key[45],
    key[33],
    key[48],
    key[44],
    key[49],
    key[39],
    key[56],
    key[34],
    key[53],
    key[46],
    key[42],
    key[50],
    key[36],
    key[29],
    key[32]
    };
endmodule

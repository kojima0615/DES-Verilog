`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/11 17:51:14
// Design Name: 
// Module Name: DES_net
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


module DES_net(left_in,right_in,key,left_out,right_out);
    input [0:31]left_in, right_in;
    input [0:47]key;
    output [0:31]left_out,right_out;
    wire [0:31]res_f;
    wire [0:31]left_result;
    wire [0:47]right_expansion;
    DES_expansion de(right_in,right_expansion);
    Round_func f(right_expansion,key,res_f);
    assign left_out=res_f^left_in;
    assign right_out=right_in;
endmodule

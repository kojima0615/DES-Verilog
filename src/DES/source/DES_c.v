`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/10 14:29:00
// Design Name: 
// Module Name: DES_c
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


module DES_c(clk, rst, flag,flag_s);
    input clk, rst;
    input flag,flag_s;//true:ˆÃ†‰» false:•œ†‰»
    reg [0:63]des_in, key_in;
    wire [0:63]des_out,key_out;
    initial begin
        des_in<=64'b0111000100100100110100110110101110011001001110001000101011001000;
        key_in<=64'b1111101101100011101000101101010110011000000011011010001011010101;
    end
    DES_cntl des(clk, rst, flag,flag_s, des_in, key_in,des_out,key_out);
endmodule

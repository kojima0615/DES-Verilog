`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/04 01:17:38
// Design Name: 
// Module Name: 3DES_ctrl
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


module tri_DES_ctrl(clk,rst,flag,flag_s);
    input clk,rst,flag,flag_s;
    reg [0:63]tri_DES_in,tri_key_in1,tri_key_in2,tri_key_in3;
    wire [0:63]tri_DES_out,tri_key_out1,tri_key_out2,tri_key_out3;
    wire [0:63]DES_temp_out1,DES_temp_out2;
    initial begin
        tri_DES_in<=64'b0111000100100100110100110110101110011001001110001000101011001000;
        tri_key_in1<=64'b1111101101100011101000101101010110011000000011011010001011010101;
        tri_key_in2<=64'b1111101101100011101000101101010110011000000011011010001011010101;
        tri_key_in3<=64'b1111101101100011101000101101010110011000000011011010001011010101;
    end
    DES_cntl des_ctrl1(clk, rst, flag,flag_s, tri_DES_in, tri_key_in1,DES_temp_out1,tri_key_out1);
    DES_ctrl_inv des_ctrl2(clk, rst, flag,flag_s, DES_temp_out1, tri_key_in2,DES_temp_out2,tri_key_out2);
    DES_cntl des_ctrl3(clk, rst, flag,flag_s, DES_temp_out2, tri_key_in3,tri_DES_out,tri_key_out3);
endmodule

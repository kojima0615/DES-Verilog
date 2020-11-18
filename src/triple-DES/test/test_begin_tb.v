`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/11 17:18:13
// Design Name: 
// Module Name: test_begin_tb
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


module test_begin_tb();
    reg clk=1,rst=0;
    reg [0:63]des_in;
    wire [0:63]des_out,key_out;
    reg [0:63]key_in;
    reg flag,flag_s;
    //1100110011100100011011011011101010001010000101000000011111010010
    //1100110011100100011011011011101010001010000101000000011111010010
    //0010110011010110110101111011100100110111110001011001100110100101
    DES_cntl des(clk, rst, flag,flag_s, des_in, key_in,des_out,key_out);
    initial begin
        des_in<=64'b0111000100100100110100110110101110011001001110001000101011001000;
        key_in<=64'b1111101101100011101000101101010110011000000011011010001011010101;
        flag<=0;
        flag_s<=0;
        #100
        rst=1;
        #500
        flag_s<=1;
        #200000
        $finish;
    end
    always #10 begin
        clk<=~clk;
    end
endmodule

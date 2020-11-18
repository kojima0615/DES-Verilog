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
    reg flag,flag_s;
    //1100110011100100011011011011101010001010000101000000011111010010
    //1100110011100100011011011011101010001010000101000000011111010010
    //0010110011010110110101111011100100110111110001011001100110100101
    DES_c des(clk, rst, flag,flag_s);
    initial begin
        flag<=1;
        flag_s<=0;
        #100
        rst=1;
        #250
        flag_s<=1;
        #200000
        $finish;
    end
    always #10 begin
        clk<=~clk;
    end
endmodule

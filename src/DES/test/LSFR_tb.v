`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/27 17:17:53
// Design Name: 
// Module Name: LSFR_tb
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


module LSFR_tb();
    reg clk=1,rst=1;
    reg [0:31]seed;
    wire [0:31]out;
    LFSR lfsr(clk, rst, seed,out);
    //in0101010001100101011100110111010001010100011001010111001101110100;
    //0111110100010110001101011010111000000101011000100010010010001010
    initial begin
        seed<=32'b10101010101010101111111001100111;
        #100
        rst<=0;
        #200000
        $finish;
    end
    always #10 begin
        clk<=~clk;
    end
endmodule

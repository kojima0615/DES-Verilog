`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/18 21:07:34
// Design Name: 
// Module Name: XorShift
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


module XorShift(clk,rst,seed,out);
    input clk,rst;
    input [0:31]seed;
    output [0:31]out;
    reg [0:31]x,y,z,w;
    wire [0:31]temp;
    assign out=w;
    assign temp=x^(x<<11);
    always @(posedge clk)begin
        if(rst)begin
            x<=123456789;
            y<=362436069;
            z<=521288629;
            w<=88675123^seed;
        end
        else begin
            x<=y;
            y<=z;
            z<=w;
            w<=(w^(w>>19))^(temp^(temp>>8));
        end
    end
endmodule

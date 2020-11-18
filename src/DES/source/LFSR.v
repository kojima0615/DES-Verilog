`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/18 20:40:36
// Design Name: 
// Module Name: LFSR
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

(*dont_touch="true"*)
module LFSR(clk, rst, seed, out1);
    input clk,rst;
    input [1:32]seed;
    output [1:32]out1;
    reg [1:32]lfsr;
    wire feedback;
    assign feedback=lfsr[32]^lfsr[22]^lfsr[2]^lfsr[1];
    assign out1=lfsr;
    always @(posedge clk)begin
        if(rst==1'b0)begin
            lfsr<=seed;
        end
        else begin
            lfsr<={feedback,lfsr[1:31]};
        end
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/04 01:37:05
// Design Name: 
// Module Name: DES_ctrl_inv
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
module DES_ctrl_inv(clk, rst, flag,flag_s, des_in, key_in,des_out,key_out);
    input clk, rst;
    input flag,flag_s;//true:ˆÃ†‰» false:•œ†‰»
    input [0:63]des_in;
    input  [0:63]key_in;
    output [0:63]des_out;
    output [0:63]key_out;
    reg flag_out,flag_temp;
    reg [0:63]key_in1;
    initial begin
        key_in1<=64'b0000000000000000000000000000000000000000000000000000000000000000;
        flag_out<=1'b0;
        flag_temp<=1'b0;
    end
    reg [0:63]k_use;
    wire [0:31]key_s,key_e;
    LFSR lfsr1(clk, rst,32'b10100000101010101100011001100111,key_s);
    LFSR lfsr2(clk, rst,32'b10101000011110101100011001100111,key_e);
    wire [0:47]key_mem[0:15];
    wire [0:27]keyp1_l, keyp1_r;
    DES_inv des1(clk, rst, flag,des_in, key_mem[0],key_mem[1], key_mem[2],key_mem[3], key_mem[4],key_mem[5], key_mem[6],key_mem[7], key_mem[8],key_mem[9], key_mem[10],key_mem[11],key_mem[12],key_mem[13], key_mem[14],key_mem[15],des_out);
    Permuted_choice1 p1(key_out, keyp1_l, keyp1_r);
    Permuted_choice2 p2_1({keyp1_l[2:27],keyp1_l[0:1], keyp1_r[2:27],keyp1_r[0:1]}, key_mem[0]);
    Permuted_choice2 p2_2({keyp1_l[4:27],keyp1_l[0:3], keyp1_r[4:27],keyp1_r[0:3]}, key_mem[1]);
    Permuted_choice2 p2_3({keyp1_l[5:27],keyp1_l[0:4], keyp1_r[5:27],keyp1_r[0:4]}, key_mem[2]);
    Permuted_choice2 p2_4({keyp1_l[6:27],keyp1_l[0:5], keyp1_r[6:27],keyp1_r[0:5]}, key_mem[3]);
    Permuted_choice2 p2_5({keyp1_l[7:27],keyp1_l[0:6], keyp1_r[7:27],keyp1_r[0:6]}, key_mem[4]);
    Permuted_choice2 p2_6({keyp1_l[8:27],keyp1_l[0:7], keyp1_r[8:27],keyp1_r[0:7]}, key_mem[5]);
    Permuted_choice2 p2_7({keyp1_l[9:27],keyp1_l[0:8], keyp1_r[9:27],keyp1_r[0:8]}, key_mem[6]);
    Permuted_choice2 p2_8({keyp1_l[10:27],keyp1_l[0:9], keyp1_r[10:27],keyp1_r[0:9]}, key_mem[7]);
    Permuted_choice2 p2_9({keyp1_l[12:27],keyp1_l[0:11], keyp1_r[12:27],keyp1_r[0:11]}, key_mem[8]);
    Permuted_choice2 p2_10({keyp1_l[13:27],keyp1_l[0:12], keyp1_r[13:27],keyp1_r[0:12]}, key_mem[9]);
    Permuted_choice2 p2_11({keyp1_l[14:27],keyp1_l[0:13], keyp1_r[14:27],keyp1_r[0:13]}, key_mem[10]);
    Permuted_choice2 p2_12({keyp1_l[15:27],keyp1_l[0:14], keyp1_r[15:27],keyp1_r[0:14]}, key_mem[11]);
    Permuted_choice2 p2_13({keyp1_l[16:27],keyp1_l[0:15], keyp1_r[16:27],keyp1_r[0:15]}, key_mem[12]);
    Permuted_choice2 p2_14({keyp1_l[17:27],keyp1_l[0:16], keyp1_r[17:27],keyp1_r[0:16]}, key_mem[13]);
    Permuted_choice2 p2_15({keyp1_l[18:27],keyp1_l[0:17], keyp1_r[18:27],keyp1_r[0:17]}, key_mem[14]);
    Permuted_choice2 p2_16({keyp1_l[20:27],keyp1_l[0:19], keyp1_r[20:27],keyp1_r[0:19]}, key_mem[15]);
    wire [0:63]key_temp;
    assign key_temp={key_s,key_e};
    always @(posedge clk)begin
        key_in1<=key_in;
        if(flag_s==1'b1 && flag_temp==1'b0)begin
            k_use<=key_temp;
            flag_temp=1'b1;
        end
    end
    assign key_out=(flag==1'b1)?k_use:key_in1;
endmodule
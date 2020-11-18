`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/11 16:01:37
// Design Name: 
// Module Name: DES
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


module DES(clk, rst, flag,des_in1, key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,des_out1);
    input clk, rst;
    input flag;//true:ˆÃ†‰» false:•œ†‰»
    input [0:63]des_in1;
    input   [0:47]key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16;
    output  [0:63]des_out1;
    reg [0:47]key_mem[0:15];
    wire [0:31]output_right_ip,output_left_ip;
    wire [0:31]output_left_des[0:15];
    wire [0:31]output_right_des[0:15];
    reg [0:31]output_left_desr[0:15];
    reg [0:31]output_right_desr[0:15];
    
    Initial_Permutation ip(des_in1,{output_left_ip,output_right_ip});
    DES_net des_n1(output_left_ip,output_right_ip,key_mem[0],output_left_des[0],output_right_des[0]);
    DES_net des_n2(output_right_desr[0],output_left_desr[0],key_mem[1],output_left_des[1],output_right_des[1]);
    DES_net des_n3(output_right_desr[1],output_left_desr[1],key_mem[2],output_left_des[2],output_right_des[2]);
    DES_net des_n4(output_right_desr[2],output_left_desr[2],key_mem[3],output_left_des[3],output_right_des[3]);
    DES_net des_n5(output_right_desr[3],output_left_desr[3],key_mem[4],output_left_des[4],output_right_des[4]);
    DES_net des_n6(output_right_desr[4],output_left_desr[4],key_mem[5],output_left_des[5],output_right_des[5]);
    DES_net des_n7(output_right_desr[5],output_left_desr[5],key_mem[6],output_left_des[6],output_right_des[6]);
    DES_net des_n8(output_right_desr[6],output_left_desr[6],key_mem[7],output_left_des[7],output_right_des[7]);
    DES_net des_n9(output_right_desr[7],output_left_desr[7],key_mem[8],output_left_des[8],output_right_des[8]);
    DES_net des_n10(output_right_desr[8],output_left_desr[8],key_mem[9],output_left_des[9],output_right_des[9]);
    DES_net des_n11(output_right_desr[9],output_left_desr[9],key_mem[10],output_left_des[10],output_right_des[10]);
    DES_net des_n12(output_right_desr[10],output_left_desr[10],key_mem[11],output_left_des[11],output_right_des[11]);
    DES_net des_n13(output_right_desr[11],output_left_desr[11],key_mem[12],output_left_des[12],output_right_des[12]);
    DES_net des_n14(output_right_desr[12],output_left_desr[12],key_mem[13],output_left_des[13],output_right_des[13]);
    DES_net des_n15(output_right_desr[13],output_left_desr[13],key_mem[14],output_left_des[14],output_right_des[14]);
    DES_net des_n16(output_right_desr[14],output_left_desr[14],key_mem[15],output_left_des[15],output_right_des[15]);
    Final_Permutation fp({output_left_desr[15], output_right_desr[15]},des_out1);
    always @(posedge clk)begin
        key_mem[0]<=(flag==1'b1)?key1:key16;
        key_mem[1]<=(flag==1'b1)?key2:key15;
        key_mem[2]<=(flag==1'b1)?key3:key14;
        key_mem[3]<=(flag==1'b1)?key4:key13;
        key_mem[4]<=(flag==1'b1)?key5:key12;
        key_mem[5]<=(flag==1'b1)?key6:key11;
        key_mem[6]<=(flag==1'b1)?key7:key10;
        key_mem[7]<=(flag==1'b1)?key8:key9;
        key_mem[8]<=(flag==1'b1)?key9:key8;
        key_mem[9]<=(flag==1'b1)?key10:key7;
        key_mem[10]<=(flag==1'b1)?key11:key6;
        key_mem[11]<=(flag==1'b1)?key12:key5;
        key_mem[12]<=(flag==1'b1)?key13:key4;
        key_mem[13]<=(flag==1'b1)?key14:key3;
        key_mem[14]<=(flag==1'b1)?key15:key2;
        key_mem[15]<=(flag==1'b1)?key16:key1;
        output_right_desr[0]<=output_right_des[0];
        output_right_desr[1]<=output_right_des[1];
        output_right_desr[2]<=output_right_des[2];
        output_right_desr[3]<=output_right_des[3];
        output_right_desr[4]<=output_right_des[4];
        output_right_desr[5]<=output_right_des[5];
        output_right_desr[6]<=output_right_des[6];
        output_right_desr[7]<=output_right_des[7];
        output_right_desr[8]<=output_right_des[8];
        output_right_desr[9]<=output_right_des[9];
        output_right_desr[10]<=output_right_des[10];
        output_right_desr[11]<=output_right_des[11];
        output_right_desr[12]<=output_right_des[12];
        output_right_desr[13]<=output_right_des[13];
        output_right_desr[14]<=output_right_des[14];
        output_right_desr[15]<=output_right_des[15];
        output_left_desr[0]<=output_left_des[0];
        output_left_desr[1]<=output_left_des[1];
        output_left_desr[2]<=output_left_des[2];
        output_left_desr[3]<=output_left_des[3];
        output_left_desr[4]<=output_left_des[4];
        output_left_desr[5]<=output_left_des[5];
        output_left_desr[6]<=output_left_des[6];
        output_left_desr[7]<=output_left_des[7];
        output_left_desr[8]<=output_left_des[8];
        output_left_desr[9]<=output_left_des[9];
        output_left_desr[10]<=output_left_des[10];
        output_left_desr[11]<=output_left_des[11];
        output_left_desr[12]<=output_left_des[12];
        output_left_desr[13]<=output_left_des[13];
        output_left_desr[14]<=output_left_des[14];
        output_left_desr[15]<=output_left_des[15];
    end
    
endmodule

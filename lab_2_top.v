`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Minh Le
// 
// Create Date: 01/28/2019 09:42:35 PM
// Design Name: 
// Module Name: lab_2_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Lab 2 top module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab_2_top(
    input [2:0] switches,
    input clk_100M,
    input SDO,
    output [6:0] segs,
    output [3:0] an,
    output CS,
    output SCK,
    output hSync,
    output vSync,
    output [3:0] redOut,
    output [3:0] greenOut,
    output [3:0] blueOut
    );
    
    clk_wiz_0 clk_25_inst(
        .clk_25M(clk_25M),    
        .reset(reset), 
        .locked(locked),      
        .clk_in1(clk_100M));    //instantiate 25MHz clock
        
    light_sensor light_sensor_inst (clk_25M, SDO, segs, an, CS, SCK); //instantiate light sensor module
    VGA_display vga_disp_inst (switches, clk_25M, redOut, greenOut, blueOut, hSync, vSync); //instantiate VGA display module
endmodule

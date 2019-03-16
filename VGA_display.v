`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Minh Le
// 
// Create Date: 01/29/2019 02:42:44 AM
// Design Name: 
// Module Name: VGA_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Module for VGA display
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module VGA_display(
    input [2:0] switches,
    input clk_in,
    input reset,
    output reg [3:0] redOut,
    output reg [3:0] greenOut,
    output reg [3:0] blueOut,
    output hSync,
    output vSync 
    );
    
    //hCount, vCount, and blank to input into VGA controller module
    wire [10:0] hCount; 
    wire [10:0] vCount;
    wire blank; 
    
    //12-bit bus for displaying color, we will split this bus into three 4-bit bus to input the r,g,b values into vga_ocontroller
    reg [11:0] color;
    
    //When the value of each of the following wires is 1 on an (hcount,vcount) coordinate, fill in the color of that pixel
    //We use this to draw our red block, green bar, stripe, and special pattern.
    wire redBlock; 
    wire greenBar; 
    wire toggleColor;
    wire ece;
    
    //Different states of the VGA display, controlled by switches
    wire [11:0] stateYellow;
    wire [11:0] stateStriped;
    wire [11:0] stateRedBlock;
    wire [11:0] stateGreenBar;
    wire [11:0] stateECE; 
    
    //Instantiate the vga_controller module
    vga_controller_640_60 vga (reset, clk_in, hSync, vSync, hCount,vCount, blank);
    
    //Draw all the different states of the VGA display
    draw_fullscreen_color yellow_screen (hCount, vCount, blank, stateYellow); //Yellow screen
    draw_block red_block (hCount, vCount,blank, redBlock, stateRedBlock); //Red block
    draw_bar green_bar (hCount, vCount, blank, greenBar, stateGreenBar); //Green bar
    draw_stripe red_yellow_stripe (hCount, vCount, blank, toggleColor, stateStriped); //Red and yellow stripes
    draw_3829 cyan_blocks (hCount, vCount, blank, ece, stateECE); //Cyan and white pattern
    
    //Switch between states, controlled by switches
    //Assign the corresponding state to the color register, then split the color register into RGB output
    always @ (switches or stateYellow or stateStriped or stateRedBlock or stateGreenBar)
    begin
        if (switches == 3'b000) 
            color <= stateYellow;
        else if (switches == 3'b001)
            color <= stateRedBlock;
        else if (switches == 3'b010)
            color <= stateGreenBar;
        else if (switches == 3'b011)
            color <= stateStriped;
        else if (switches == 3'b100)
            color <= stateECE;
        redOut <= color[11:8];
        greenOut <= color[7:4];
        blueOut <= color [3:0];
    end
 
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Minh Le
// 
// Create Date: 01/31/2019 11:21:03 AM
// Design Name: 
// Module Name: draw_bar
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Draw the green horizontal bar
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module draw_bar(
    input [10:0] hCount,
    input [10:0] vCount,
    input blank,
    output reg greenBar,
    output reg [11:0] stateGreenBar
    );
    
    //Setting up some color constants, 12-bit RGB
    parameter colorRed = 12'b111100000000;
    parameter colorYellow = 12'b111111110000;
    parameter colorGreen = 12'b000011110000;
    parameter colorBlack = 12'b000000000000;
    parameter colorWhite = 12'b111111111111;
    
    //Bar is 64 pixels wide in the middle of screen. 
    //480/2 + 64/2 = 272, 480/2 - 64/2 = 208
    always @(hCount or vCount)
        if (vCount < 272 && vCount > 208) 
            greenBar = 1;   //Check if pixel (hcount,vcount) is inside the width of the bar 
        else greenBar = 0;
    
    always @(hCount or vCount)
        begin
            if (blank)
                stateGreenBar = colorBlack;  //If blank is 1, we assign the color to black as instructed in the controller module
            else if (greenBar == 1)
                stateGreenBar = colorGreen;  //If the pixel is inside the bar, pixel will be green
            else
                stateGreenBar = colorBlack;  //Else the pixel will be black
        end
        
endmodule

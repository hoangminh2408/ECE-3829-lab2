`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Minh Le
// 
// Create Date: 01/31/2019 11:42:17 AM
// Design Name: 
// Module Name: draw_fullscreen_color
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Draw yellow screen
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module draw_fullscreen_color(
    input [10:0] hCount,
    input [10:0] vCount,
    input blank, 
    output reg [11:0] stateYellow
    );
    
    parameter colorRed = 12'b111100000000;
    parameter colorYellow = 12'b111111110000;
    parameter colorGreen = 12'b000011110000;
    parameter colorBlack = 12'b000000000000;
    parameter colorWhite = 12'b111111111111;
    
    always @(hCount or vCount)
    begin
        if (blank)
            stateYellow = colorBlack; //If blank is 1, we assign the color to black as instructed in the controller module 
        else
            stateYellow = colorYellow;//Otherwise every pixel will be yellow
    end
    
endmodule

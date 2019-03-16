`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Minh Le
// 
// Create Date: 01/30/2019 11:48:41 AM
// Design Name: 
// Module Name: draw_stripe
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Draw red and yellow stripes
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module draw_stripe(
        input [10:0] hCount,
        input [10:0] vCount,
        input blank,
        output reg toggleColor,
        output reg [11:0] stateStriped
    );
    
    //Setting up some color constants in 12-bit RGB
    parameter colorRed = 12'b111100000000;
    parameter colorYellow = 12'b111111110000;
    parameter colorGreen = 12'b000011110000;
    parameter colorBlack = 12'b000000000000;
    parameter colorWhite = 12'b111111111111;
        
        //Bars are 32 wide
        //Check if pixel (hcount,vcount) is inside the width of the red bars
        always @(hCount)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    toggleColor = 1;
                else
                    toggleColor = 0; 
                      
        always @(hCount or vCount)
            if (blank)
                stateStriped = colorBlack; //If blank is 1, we assign the color to black as instructed in the controller module
            else if (toggleColor == 0)
                stateStriped = colorRed; //If the pixel is inside the red bar, we set it to red
            else if (toggleColor == 1)
                stateStriped = colorYellow; //Other pixels are yellow
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Minh Le
// 
// Create Date: 01/31/2019 02:16:48 PM
// Design Name: 
// Module Name: draw_3829
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Draw the special cyan/white pattern
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module draw_3829(
        input [10:0] hCount,
        input [10:0] vCount,
        input blank,
        output reg ece,
        output reg [11:0] stateECE
    );
    
    //Setting up some color constants, 12-bit RGB
    parameter colorRed = 12'b111100000000;
    parameter colorYellow = 12'b111111110000;
    parameter colorGreen = 12'b000011110000;
    parameter colorBlack = 12'b000000000000;
    parameter colorWhite = 12'b111111111111;
    parameter colorCyan = 12'b000011111111;
        
    //Determining where we want the cyan pixels (sorry for length)
        always @(hCount or vCount)
        begin
        if (vCount < 32)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 1 && vCount < 32 * 2)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 2 && vCount < 32 * 3)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 3 && vCount < 32 * 4)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 4 && vCount < 32 * 5)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 5 && vCount < 32 * 6)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 6 && vCount < 32 * 7)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 7 && vCount < 32 * 8)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 8 && vCount < 32 * 9)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 9 && vCount < 32 * 10)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 10 && vCount < 32 * 11)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 11 && vCount < 32 * 12)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 12 && vCount < 32 * 13)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |       
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 13 && vCount < 32 * 14)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        if (vCount > 32 * 14 && vCount < 32 * 15)
            if ((0 < hCount && hCount < 32 * 1) | 
                (32 * 2 < hCount && hCount < 32 * 3) | 
                (32 * 4 < hCount && hCount < 32 * 5) |
                (32 * 6  < hCount && hCount < 32 * 7) |
                (32 * 8  < hCount && hCount < 32 * 9) |
                (32 * 10  < hCount && hCount < 32 * 11) |
                (32 * 11  < hCount && hCount < 32 * 12) |
                (32 * 12  < hCount && hCount < 32 * 13) |
                (32 * 14  < hCount && hCount < 32 * 15) |
                (32 * 16  < hCount && hCount < 32 * 17) |
                (32 * 18  < hCount && hCount < 32 * 19))
                    ece = 1;
        else ece = 0;
        end
        
    always @(hCount or vCount)
        if (blank)
            stateECE = colorBlack; //If blank is 1, we assign the color to black as instructed in the controller module
        else if (ece == 1)
            stateECE = colorCyan; //If the pixel is inside the pattern, it will be cyan
        else
            stateECE = colorWhite; //Else it will be white
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Minh Le
// 
// Create Date: 01/28/2019 11:03:23 PM
// Design Name: 
// Module Name: SCKtoCS
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Convert SCK to 10Hz, then assign CS as 0 for 16 SCK cycle and 1 for the rest of the cycle
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SCKtoCS(
    input clk_in,     
    output chip_select
    );
    reg clk_out;
    reg [16:0] count100K;
    
    //Dividing 1Mhz SCK clock by 10000 into 10Hz
    always @ (posedge clk_in)
        if (count100K < 16)
            begin
                count100K <= count100K + 1; 
                clk_out <= 0;   //Chip select set to 0 for the first 16 SCK cycles
            end
        else if (count100K < 100000)
            begin
                count100K <= count100K + 1;
                clk_out <= 1; //Set to 1 for the rest of the cycle
            end
        else 
            begin
                count100K <= 0; //Reset counter
            end
    assign chip_select = clk_out; //Output chip select
endmodule


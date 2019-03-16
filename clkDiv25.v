`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Minh Le
// 
// Create Date: 01/28/2019 10:43:12 PM
// Design Name: 
// Module Name: clkDiv25
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 25Mhz to 1Mhz clock converter (divide clock by 25)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clkDiv25(
    input clk_in,     
    output div_clk
    );
    reg clk_out;
    reg [4:0] count25;
    
    //Simple clock divider counter module
    always @ (posedge clk_in)
        if (count25 < 12)
            begin
                count25 <= count25 + 1; //0 for first 12 count
                clk_out <= 0;
            end
        else if (count25 < 25)
            begin
                count25 <= count25 + 1; //1 for the following 12 counts
                clk_out <= 1;
            end
        else 
            begin
                count25 <= 0;   //Reset counter to 0
            end
    assign div_clk = clk_out;  //Output clock
endmodule

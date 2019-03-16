`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Minh Le
// 
// Create Date: 01/28/2019 09:53:59 PM
// Design Name: 
// Module Name: light_sensor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Light Sensor module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module light_sensor(
    input clk_in,
    input SDO, 
    output [6:0] segs,
    output [3:0] an,
    output CS,
    output SCK
);

    reg [15:0] shiftreg;
    wire [15:0] data;
    
    //Serial Clock SCK operating at 1Mhz
    clkDiv25 div_25 (clk_in, SCK);
    
    //Convert SCK to 10Hz, then assign cs = 0 for 16 10Hz SCK cycles and 1 for the rest of the cycle
    SCKtoCS SCKtoCS_1 (SCK, CS);
    
    // Using a 16-bit shift register to shift data from SDO into a register when CS is active
    always @ (posedge SCK)
        if (~CS)
            begin
                shiftreg <= shiftreg << 1;
                shiftreg[0] <= SDO;
            end
            
    // Cut off zeroes, assign data to first 8 bits of seven segment input
    assign data = {8'b0, shiftreg[11:4]};
    seven_seg seven_seg_inst (data, clk_in, segs, an);

endmodule
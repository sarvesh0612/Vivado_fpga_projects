`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 23:29:55
// Design Name: 
// Module Name: demux
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

module demux_1x16 (
    input in,
    input [3:0] s,
    output reg[15:0] y
);
    always @(*) begin
        y = 16'b0;        // default
        y[s] = in;         // i.e if s=0010---y[2]=in
    end
endmodule


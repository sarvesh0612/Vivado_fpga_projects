`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 00:32:49
// Design Name: 
// Module Name: tb_encoder8x3
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
//for encoder (no priority)

module tb_encoder8x3();
reg  [7:0] d;
wire [2:0] y;
encoder8x3 en1 (.d(d),.y(y));

    initial begin
        d = 8'b0000_0001; #10;  // y = 000
        d = 8'b0000_0010; #10;  // y = 001
        d = 8'b0000_0100; #10;  // y = 010
        d = 8'b0000_1000; #10;  // y = 011
        d = 8'b0001_0000; #10;  // y = 100
        d = 8'b0010_0000; #10;  // y = 101
        d = 8'b0100_0000; #10;  // y = 110
        d = 8'b1000_0000; #10;  // y = 111
        // Invalid input (more than one bit high)
        d = 8'b0000_0011; #10;
        // No input high
        d = 8'b0000_0000; #10;
        $finish;
    end
endmodule

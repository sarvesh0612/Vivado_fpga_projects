`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 00:36:08
// Design Name: 
// Module Name: tb_priority_en_8x3
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


module tb_priority_en_8x3();
    reg  [7:0] d;
    wire [2:0] y;
    wire valid;

    // Instantiate DUT
    priority_encoder_8x3 p_en1 (.d(d),.y(y),.valid(valid));

    initial begin
        // Single-bit inputs
        d = 8'b0000_0001; #10;   // y = 000, valid = 1
        d = 8'b0000_0100; #10;   // y = 010, valid = 1
        d = 8'b0100_0000; #10;   // y = 110, valid = 1
        // Multiple bits HIGH (priority check)
        d = 8'b0000_1011; #10;   // highest = bit 3 → y = 011
        d = 8'b0011_0001; #10;   // highest = bit 5 → y = 101
        d = 8'b1100_0010; #10;   // highest = bit 7 → y = 111
        // No input HIGH
        d = 8'b0000_0000; #10;   // valid = 0

        $finish;
    end
endmodule

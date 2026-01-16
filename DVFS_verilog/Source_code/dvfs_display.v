`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module : dvfs_display
// Description : Displays current P-state (0–3) on rightmost 7-segment display.
//////////////////////////////////////////////////////////////////////////////////

module dvfs_display(
    input  wire [1:0] value,
    output reg  [6:0] seg,
    output reg  [3:0] an
    );

    always @(*) begin
        an = 4'b1110;  // Enable rightmost digit (active low)
        case (value)
            2'd0: seg = 7'b1000000; // "0"
            2'd1: seg = 7'b1111001; // "1"
            2'd2: seg = 7'b0100100; // "2"
            2'd3: seg = 7'b0110000; // "3"
            default: seg = 7'b1111111; // blank
        endcase
    end
endmodule

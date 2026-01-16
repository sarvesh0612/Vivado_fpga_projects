`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2025 16:20:38
// Design Name: 
// Module Name: sd_moore
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


module sd_moore(
    input clk,
    input rst,
    input x,
    output reg y
);

    // State encoding
    parameter s0 = 2'b00; // no match
    parameter s1 = 2'b01; // matched "1"
    parameter s2 = 2'b10; // matched "11"
    parameter s3 = 2'b11; // matched "110"

    reg [1:0] present_state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            present_state <= s0;
        else
            present_state <= next_state;
    end

    // Next-state and output logic (Mealy)
    always @(*) begin
        y = 0; // default
        case (present_state)
            s0: next_state = (x) ? s1 : s0;
            s1: next_state = (x) ? s2 : s0;
            s2: next_state = (x) ? s2 : s3; // 11 → 110
            s3: begin
                if (x) begin
                    y = 1;              // 1101 detected
                    next_state = s1;    // overlapping
                end else
                    next_state = s0;
            end
            default: next_state = s0;
        endcase
    end

endmodule

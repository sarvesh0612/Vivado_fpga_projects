`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2025 19:03:08
// Design Name: 
// Module Name: multi_booth
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


// ------------------------------------------------------------
// 4x4 Signed Booth Multiplier (Combinational, Loop-based)
// Compatible with Vivado (Verilog-2001)
// ------------------------------------------------------------
module multi_booth(
    input  signed [3:0] M,   // multiplicand
    input  signed [3:0] Q,   // multiplier
    output signed [7:0] P    // product
);

    integer i;

    // regA holds A(4 bits), Q(4 bits), Q_-1 (1 bit)
    reg signed [8:0] regA;
    reg signed [8:0] tempA;

    always @(*) begin
        // Initialize A=0, Q=Q, Q_-1 = 0  →  {0000, Q, 0}
        regA = {4'b0000, Q, 1'b0};

        // Perform 4 iterations of Booth algorithm
        for (i = 0; i < 4; i = i + 1) begin

            // copy regA into temp before modification
            tempA = regA;

            // Booth decision uses Q0 = regA[1] and Q_-1 = regA[0]
            case ({tempA[1], tempA[0]})
                2'b01: tempA[8:5] = tempA[8:5] + M;   // A = A + M
                2'b10: tempA[8:5] = tempA[8:5] - M;   // A = A - M
                default: ;                            // no change
            endcase

            // Arithmetic right shift of entire (A,Q,Q_-1)
            regA = $signed(tempA) >>> 1;
        end
    end

    // Final product = {A, Q}
    assign P = regA[8:1];

endmodule


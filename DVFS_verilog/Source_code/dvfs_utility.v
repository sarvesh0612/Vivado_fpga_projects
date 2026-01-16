`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module : dvfs_utility
// Description : Determines P-state and simulated voltage level
//               based on workload input.
//////////////////////////////////////////////////////////////////////////////////

module dvfs_utility(
    input  wire clk,
    input  wire rst_n,
    input  wire [7:0] util,        // workload (0–255)
    output reg  [1:0] pstate,      // 0 = max performance
    output reg  [2:0] voltage_code // simulated voltage
    );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pstate <= 2'd0;
            voltage_code <= 3'd0;
        end else begin
            if (util > 8'd200) begin
                pstate <= 2'd0; voltage_code <= 3'd7; // high performance
            end else if (util > 8'd120) begin
                pstate <= 2'd1; voltage_code <= 3'd5; // balanced
            end else if (util > 8'd40) begin
                pstate <= 2'd2; voltage_code <= 3'd3; // medium
            end else begin
                pstate <= 2'd3; voltage_code <= 3'd1; // low power
            end
        end
    end
endmodule

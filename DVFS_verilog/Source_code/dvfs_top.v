`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project : DVFS Controller on Basys 3
// Engineer: Priyabandhu Sarvesh
// Description:
//   Top-level integration of DVFS utility, LED indicators,
//   and 7-segment display. Implements real hardware timing.
//////////////////////////////////////////////////////////////////////////////////

module dvfs_top(
    input  wire clk,            // 100 MHz Basys 3 clock
    input  wire [1:0] sw,       // Switches to set workload
    input  wire btnC,           // Center button (active-low reset)
    output wire [3:0] led,      // LEDs (voltage + blink)
    output wire [6:0] seg,      // 7-segment segments
    output wire [3:0] an,       // 7-segment anodes
    output wire [2:0] voltage,  // Voltage value
    output wire [1:0] performance_state   
    );

    // Correct reset (active low)
    wire rst_n = btnC;   // ✅ fixed — no inversion mistake

    // Workload level mapping from switches
    reg [7:0] util;
    always @(*) begin
        case (sw)
            2'b00: util = 8'd20;    // Low load
            2'b01: util = 8'd80;    // Medium load
            2'b10: util = 8'd160;   // High load
            2'b11: util = 8'd240;   // Maximum load
            default: util = 8'd0;
        endcase
    end

    // DVFS control signals
    wire [1:0] pstate;
    wire [2:0] voltage_code;

    // Instantiate utility module
    dvfs_utility util_inst (
        .clk(clk),
        .rst_n(rst_n),
        .util(util),
        .pstate(pstate),
        .voltage_code(voltage_code)
    );
    
    // Frequency scaling divider (realistic timing for FPGA)
    reg [31:0] div_value;
    always @(*) begin
        case (pstate)
            2'd0: div_value = 32'd25_000_000;   // Fast blink (2Hz)
            2'd1: div_value = 32'd50_000_000;   // Medium (1Hz)
            2'd2: div_value = 32'd100_000_000;  // Slow (0.5Hz)
            2'd3: div_value = 32'd200_000_000;  // Very slow (0.25Hz)
            default: div_value = 32'd50_000_000;
        endcase
    end

    // LED blink logic
    reg [31:0] counter = 0;
    reg led_out = 0;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            led_out <= 0;
        end else if (counter >= div_value) begin
            counter <= 0;
            led_out <= ~led_out;
        end else begin
            counter <= counter + 1;
        end
    end

    // Output assignments
    assign led[0]   = led_out;
    assign led[3:1] = voltage_code;
    assign voltage  = voltage_code;
    assign performance_state = pstate;
    // Display current P-state
    dvfs_display disp_inst (
        .value(pstate),
        .seg(seg),
        .an(an)
    );

endmodule

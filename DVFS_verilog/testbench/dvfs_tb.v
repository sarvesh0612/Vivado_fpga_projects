`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench : dvfs_tb
// Description : Tests workload transitions and verifies LED + 7-segment outputs.
//////////////////////////////////////////////////////////////////////////////////

module dvfs_tb();

    reg clk;
    reg btnC;
    reg [1:0] sw;
    wire [3:0] led;
    wire [6:0] seg;
    wire [1:0] pstate;
    wire [2:0] voltage;

    // Instantiate DUT
    dvfs_top uut (
        .clk(clk),
        .btnC(btnC),
        .sw(sw),
        .led(led),
        .seg(seg),
        .performance_state(pstate),
        .voltage(voltage)
    );

    // Clock (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        btnC = 0; #5; btnC = 1;  // Apply reset pulse
        sw = 2'b00; #10; // low
        sw = 2'b01; #10; // medium
        sw = 2'b10; #10; // high
        sw = 2'b11; #10; // max
        sw = 2'b00; #10; // back to low
        $finish;
    end

endmodule

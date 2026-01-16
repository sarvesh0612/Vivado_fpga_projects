`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2025 05:48:11 PM
// Design Name: 
// Module Name: tb_soda_dispenser_machine
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


module tb_soda_dispenser_machine(

    );

    // Testbench signals
    reg  [7:0] s, a;
    reg        c;
    wire       d;

    // DUT instantiation
    soda_dispense_machine dut (
        .s(s),
        .a(a),
        .c(c),
        .d(d)
    );

    // Test procedure
    initial begin
        //$dumpfile("soda_dispense_machine_tb.vcd");
        //$dumpvars(0, tb_soda_dispense_machine);

        // Initialize
        s = 8'd0; 
        a = 8'd0; 
        #10;
        c = 1;
        #10;
        c = 0;
        // Test Case 1: Simple input set 1
        s = 8'd26;
        a = 8'd5;
        #10;
        c = 1;
        #10;
        c = 0;
        // Test Case 2: Change inputs
        s = 8'd26;
        a = 8'd7;
        #10;
        c = 1;
        #10;
        c = 0;
        // Test Case 3: More random values
        s = 8'd26;
        a = 8'd12;
        #10;
        c = 1;
        #10;
        c = 0;
        // Test Case 4: Boundary values
        s = 8'h26;
        a = 8'h10;
        #10;
        c = 1;
        #10;
        c = 0;
        #10;
        // End simulation
        $finish;
    end

endmodule


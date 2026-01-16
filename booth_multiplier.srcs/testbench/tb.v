`timescale 1ns/1ps

module tb;

    reg  signed [3:0] M;   // multiplicand
    reg  signed [3:0] Q;   // multiplier
    wire signed [7:0] P;   // product

    // Instantiate DUT
    multi_booth dut (
        .M(M),
        .Q(Q),
        .P(P)
    );

    // Test procedure
    initial begin
        $display(" --- 4x4 Booth Multiplier Testbench --- ");

        // Test 1
        M = 3;  Q = 2;
        #5;
        $display("M=%0d  Q=%0d  ->  P=%0d", M, Q, P);

        // Test 2
        M = -3; Q = 2;
        #5;
        $display("M=%0d  Q=%0d  ->  P=%0d", M, Q, P);

        // Test 3
        M = -3; Q = -2;
        #5;
        $display("M=%0d  Q=%0d  ->  P=%0d", M, Q, P);

        // Test 4
        M = 7;  Q = -1;
        #5;
        $display("M=%0d  Q=%0d  ->  P=%0d", M, Q, P);

        // Test 5: lowest negative
        M = -8; Q = 7;
        #5;
        $display("M=%0d  Q=%0d  ->  P=%0d", M, Q, P);

        // Test 6: both extremes
        M = -8; Q = -8;
        #5;
        $display("M=%0d  Q=%0d  ->  P=%0d", M, Q, P);

        // Test 7: random samples
        M = 4'sd5; Q = -4'sd6;
        #5;
        $display("M=%0d  Q=%0d  ->  P=%0d", M, Q, P);

        M = -4'sd7; Q = 4'sd3;
        #5;
        $display("M=%0d  Q=%0d  ->  P=%0d", M, Q, P);

        $display(" --- Simulation Complete --- ");
        $finish;
    end

endmodule

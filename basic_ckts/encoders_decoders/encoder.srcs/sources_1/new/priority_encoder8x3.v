`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 00:31:56
// Design Name: 
// Module Name: priority_encoder8x3
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


module priority_encoder8x3 (
    input  [7:0] d,
    output reg [2:0] y,
    output reg valid
);

    always @(*) begin
        valid = 1'b1;
        casex (d)
            8'b1xxxxxxx: y = 3'b111;
            8'b01xxxxxx: y = 3'b110;
            8'b001xxxxx: y = 3'b101;
            8'b0001xxxx: y = 3'b100;
            8'b00001xxx: y = 3'b011;
            8'b000001xx: y = 3'b010;
            8'b0000001x: y = 3'b001;
            8'b00000001: y = 3'b000;
            default: begin
                y = 3'b000;
                valid = 1'b0;
            end
        endcase
    end

endmodule

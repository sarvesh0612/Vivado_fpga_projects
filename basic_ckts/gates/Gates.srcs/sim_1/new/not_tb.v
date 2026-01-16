`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2025 15:31:19
// Design Name: 
// Module Name: not_tb
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


module not_tb();
reg a;
wire y;
notg n(.a(a), .y(y));
initial 
begin 
$display("Checking");
$monitor($time, "input=%b, output=%b",a,y);
a=1'b1; #10; a=1'b0; #10;
$finish;
end
endmodule

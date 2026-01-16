`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2025 00:23:47
// Design Name: 
// Module Name: wtm_tb
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


module wtm_tb();
reg [3:0]a,b;
wire [7:0]p;

multiplier wtm(a,b,p);
initial begin 
$monitor("a=%b, b=%b, p=%b",a,b,p);
a=4'b1010;
b=4'b1111;
#10;
a=4'b0101;
b=4'b1110;
#10;
$finish;
end


endmodule

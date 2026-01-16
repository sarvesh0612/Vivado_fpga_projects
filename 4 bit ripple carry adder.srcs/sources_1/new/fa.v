`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2025 21:44:37
// Design Name: 
// Module Name: fa
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

//gate level
module fa(
input a, b, c,
output s, cout);
wire w1,w2,w3;
xor(s,a,b,c);
and(w1,a,b);
and(w2,b,c);
and(w3,a,c);
or(cout,w1,w2,w3);
endmodule

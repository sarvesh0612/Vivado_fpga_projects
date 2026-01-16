`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2025 21:52:07
// Design Name: 
// Module Name: ripple4_bit
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


module ripple4_bit(a,b,cin,s,cout);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;
wire [2:0]cc;
fa fa1(a[0],b[0],cin,s[0],cc[0]);
fa fa2(a[1],b[1],cc[0],s[1],cc[1]);
fa fa3(a[2],b[2],cc[1],s[2],cc[2]);
fa fa4(a[3],b[3],cc[2],s[3],cout);
endmodule

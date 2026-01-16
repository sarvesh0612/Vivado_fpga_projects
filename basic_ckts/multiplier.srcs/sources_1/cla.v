`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2025 21:36:54
// Design Name: 
// Module Name: cla
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

module cla(a,b,sum,cin,cout);
input [3:0]a,b;
input cin;
output cout;
output [3:0]sum;
wire [3:1]c;
wire [3:0]p,g;
//calculate propogation ===== a^b;
assign p[0] = a[0]^b[0];
assign p[1] = a[1]^b[1];
assign p[2] = a[2]^b[2];
assign p[3] = a[3]^b[3];
//calculate generation ===== a&b;
assign g[0] = a[0]&b[0];
assign g[1] = a[1]&b[1];
assign g[2] = a[2]&b[2];
assign g[3] = a[3]&b[3];
//CARRY CALCULATION
//cin is the carry in for first adder ======= generate of previous bit | (propogate of previous bit & carry of precvious bit)
assign c[1] = g[0]|p[0]&cin;
assign c[2] = g[1]|p[1]&g[0]|p[1]&p[0]&cin;
assign c[3] = g[2]|p[2]&g[1]|p[2]&p[1]&g[0]|p[2]&p[1]&p[0]&cin; 
assign cout = g[3]|p[3]&g[2]|p[3]&p[2]&g[1]|p[3]&p[2]&p[1]&g[0]|p[3]&p[2]&p[1]&p[0]&cin;
//sum decleration   ======== propogate^carry;
assign sum[0] = p[0]^cin;
assign sum[1] = p[1]^c[1];
assign sum[2] = p[2]^c[2];
assign sum[3] = p[3]^c[3];
endmodule
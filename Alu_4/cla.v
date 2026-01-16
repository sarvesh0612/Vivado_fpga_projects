`timescale 1ns / 1ps

module cla (
input [3:0]A,B, 
input cin,
output [3:0]sum,
output cout);

wire [3:0]P,G;
wire c1,c2,c3;

assign P = A^B;  //Propogate
assign G = A&B;  //Generate 

assign c1 = P[0]|G[0]&cin;
assign c2 = P[1]|G[1]&c1;  //P[0]|G[1]&G[0]&cin;
assign c3 = P[2]|G[2]&c2;
assign cout = P[3]|G[3]&c3;

assign sum = P^{c3,c2,c1,cin};

endmodule
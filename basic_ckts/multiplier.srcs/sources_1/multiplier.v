`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2025 14:22:09
// Design Name: 
// Module Name: multiplier
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


module multiplier(
input [3:0]a,[3:0]b,
output [7:0]p);
    /*                       a3   a2   a1   a0
                           * b3   b2   b1   b0

                        ---------------------------
                           a3b0 a2b0 a1b0 a0b0
                      a3b1 a2b1 a1b1 a0b1
                 a3b2 a2b2 a1b2 a0b2
            a3b3 a2b3 a1b3 a0b3     
    ------------------------------------------------------------
            a3b3 a3b2 a3b1 a3b0 a2b0 a1b0 a0b0            //4 wires
                 a2b3 a2b2 a2b1 a1b1 a0b1
                      a1b3 a1b2 a0b2
                           a0b3
    -------------------------------------------------------------
            a3b3 a3b2 c1ha s1ha a2b0 a1b0 a0b0           //8 wires
        `        a2b3 a3b1 a3b0 a1b1 a0b1
                 c2ha s2ha a2b1 a0b2
    -------------------------------------------------------------
            C3Fa S3fa S2fa S1fa s3ha a1b0 a0b0
            a3b3 C2fa C1fa c3ha a2b0 a0b1                   //ha for p1 and 5fa for p1 to p6 and cout of last fa is p7
    -------------------------------------------------------------
       p7    p6   p5   p4   p3   p2   p1    p0   
*/
wire [5:0]s;
wire [11:0]c;
wire [3:0]pp[3:0];

genvar i,j;
generate
for(i=0; i<4; i=i+1) begin
for(j=0; j<4; j=j+1) begin
assign pp[i][j] = a[i]&b[j];
end
end
endgenerate
//Stage 1
ha h1(pp[1][2],pp[0][3],s[0],c[0]);
ha h2(pp[1][3],pp[2][2],s[1],c[1]);
//Stage 2
ha h3(pp[1][1],pp[0][2],s[2],c[2]);
fa f1(pp[3][0],pp[2][1],s[0],s[3],c[3]);
fa f2(pp[3][1],s[1],c[0],s[4],c[4]);
fa f3(pp[3][2],pp[2][3],c[1],s[5],c[5]);
//Stage 3
ha h4(pp[1][0],pp[0][1],p[1],c[6]);
fa f4(s[2],pp[2][0],c[6],p[2],c[7]);
fa f5(s[3],c[2],c[7],p[3],c[8]);
fa f6(s[4],c[3],c[8],p[4],c[9]);
fa f7(s[5],c[4],c[9],p[5],c[10]);
fa f8(c[5],pp[3][3],c[10],p[6],c[11]);

assign p[7] = c[11];
assign p[0] = pp[0][0];


endmodule












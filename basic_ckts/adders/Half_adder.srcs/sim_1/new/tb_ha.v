`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 00:11:06
// Design Name: 
// Module Name: tb_ha
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


module tb_ha();
reg a,b;
wire sum,cout;

ha ha1(a,b,sum,cout);
initial begin
    repeat(5)begin
    a= $random;
    b=$random;
    #10;
    end
$finish;
end
endmodule

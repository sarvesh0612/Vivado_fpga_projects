`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 00:18:22
// Design Name: 
// Module Name: tb_fa
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


module tb_fa();
reg a,b,cin;
wire sum,cout;

fa fa1(a,b,cin,sum,cout);
initial begin
repeat(10)begin
{a,b,cin} = $random();
#10;
end
$finish;
end 
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2025 22:06:13
// Design Name: 
// Module Name: ripple_4bit_tb
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


module ripple_4bit_tb();
reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire cout;
integer k;
ripple4_bit fa4r(a,b,cin,s,cout);

initial begin 
cin=1'b1;
for(k=0; k<20; k=k+1)begin
a=k;
b=k;
#1;
cin=~cin;
end
$finish;
end
endmodule

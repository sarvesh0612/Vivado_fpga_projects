`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2025 17:37:33
// Design Name: 
// Module Name: tb_cla
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

module tb_cla();

reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;

multiplier cla (a,b,sum,cin,cout);
initial begin
    cin=1'b1;
     a = $random;
        b = $random;
    repeat(10)
    begin
        a = $random;
        b = $random;
        #1;
        cin=~cin;
    end
 $finish;
end


endmodule
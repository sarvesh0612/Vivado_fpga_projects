`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2025 19:47:09
// Design Name: 
// Module Name: booth2
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


module booth2(
input signed [3:0]M,
input signed [3:0]Q,
output signed [3:0]P);
integer i;
//9 bits regA = A(4bits)+Q(4bits)+Q-1(1bit)
reg signed [8:0]regA;
reg signed [8:0]tempA;
always@(*)begin
    regA = {4'b0000,Q,1'b0};  //initialized regA[8:5]=Acc(4'b0000), regA[4:1]=Q, regA[0]=Q-1; 
    for(i=0;i<4;i=i+1)begin
        //pass value of regA to temp
        tempA=regA;
        case({regA[1],regA[0]})   //Q[0],Q-1
            2'b01:tempA[8:5]=tempA[8:5]+M; 
            2'b10:tempA[8:5]=tempA[8:5]-M;
            endcase
    ///arthematic shift
    regA = $signed(tempA) >>> 1;      
    end
end
//Final product {A,Q} which here is regA[8:1]
assign P = regA[8:1];
endmodule

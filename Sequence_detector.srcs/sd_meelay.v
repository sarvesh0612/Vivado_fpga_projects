`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2025 15:52:56
// Design Name: 
// Module Name: sd_meelay
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


module sd_melay(
input clk,rst,
input x,
output reg y);

//State Encoding
parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;
parameter s3 = 2'b11;

reg[1:0] present_state,next_state;

//fsm
always@(posedge clk or posedge rst) begin
if(rst)
present_state<=s0;
else 
present_state <= next_state;
end

//nextstate & output

always@(*) begin
y=0; //default
case(present_state) 
    s0:next_state = (x)?s1:s0; 
    s1:next_state = (x)?s2:s0;
    s2:next_state = (x)?s3:s2;
    s3: if(x)begin
    y=1;
    next_state = s1;
    end
    else begin
    next_state = s0;
    end
    default: begin next_state = s0;
                   y=0;
                   end
endcase
end
endmodule

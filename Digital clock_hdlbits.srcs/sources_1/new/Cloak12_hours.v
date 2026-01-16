`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 18:54:40
// Design Name: 
// Module Name: Clock12_hours
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


module clock12_hours(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg[7:0] hh,
    output reg[7:0] mm,
    output reg[7:0] ss); 


    always@(posedge clk)begin
        if(reset)begin
        	pm<=0;
            hh<=8'h12;
            mm<=8'h0;
            ss<=8'h0;
        end
        else begin
            if(ena)begin
                if( hh==8'h11&&mm==8'h59&&ss==8'h59)
                    pm=~pm;
                if(ss[3:0]==9)begin
                    ss[3:0]<=0;
                    if(ss[7:4]==5)begin
                        ss[7:4]<=0;
                        if(mm[3:0]==9)begin
                            mm[3:0]<=0;
                            if(mm[7:4]==5)begin
                                mm[7:4]<=0;
                                if(hh[7:4]==1&&hh[3:0]==2)
                                    hh<=8'h1;
                                else if (hh==9)
                                    hh<=8'h10;
                                else
                                    hh<=hh+1;
                            end
                            else 
                                mm[7:4]<=mm[7:4]+1;
                        end
                        else 
                            mm[3:0]<=mm[3:0]+1;
                    end
                    else 
                        ss[7:4]<=ss[7:4]+1;
                end
                else
                    ss[3:0]<=ss[3:0]+1;
                    
            end
        end
            
    
    end
endmodule

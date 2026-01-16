`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2025 23:49:23
// Design Name: 
// Module Name: alu
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


module alu(
input [3:0]A,B,
input[2:0]ALU_ctl,
output reg [3:0]ans,
output reg cout);

//signals for cla
wire [3:0]add_sum,sub_sum;
wire add_cout,sub_cout;

//cla for add
cla c1(A,B,1'b0,add_sum,add_cout);
//cla for sub
cla c2(A,~B,1'b1,sub_sum,sub_cout);

    always@(*) begin
        case(ALU_ctl) 
            000:begin 
                ans=add_sum;
                cout=add_cout;
                end
            
            001:begin
                ans=sub_sum;
                cout=sub_cout;
                end
            010:begin ans=A&B;
            cout=0;
            end
            011:begin ans=A|B;
            cout =0;
            end
            100:begin 
            ans=A^B;
            cout = 0;
            end
            101:begin
            ans={1'b0,A[3:1]};
            cout = A[0];
            end
            110:begin 
            ans={A[2:0],1'b0};
            cout=A[3];
            end
            111:begin 
            ans=~A;
            cout=0;
            end
            default:begin 
            ans=0;
            cout =0;
            end
            endcase
            end         

endmodule

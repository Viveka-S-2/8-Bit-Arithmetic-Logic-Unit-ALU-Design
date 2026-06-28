`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2026 04:06:06
// Design Name: 
// Module Name: logic_unit
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


module logic_unit(
input [7:0]a,b,
input [2:0] opcode,
output reg [7:0] c
    );
    always @(*) begin
    case(opcode)
    3'b001: c= a&b; 
    3'b010: c= a|b; 
    3'b011: c= a^b;
    3'b100: c= ~(a^b);
    3'b101: c= ~a;
    default: c=8'd0;
    endcase
    end
endmodule

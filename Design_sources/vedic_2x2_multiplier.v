`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2026 23:35:57
// Design Name: 
// Module Name: vedic_2x2_multiplier
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
module HA(input a,b,
output cout,sum
);
assign cout=a&b;
assign sum=a^b;
endmodule

module vedic_2x2_multiplier(
input [1:0] a,b,
output [3:0] c
    );
    wire carry;
    assign c[0]=a[0]&b[0];
    HA h1(.a(a[0]&b[1]),.b(a[1]&b[0]),.cout(carry),.sum(c[1]));
    HA h2(.a(a[1]&b[1]),.b(carry),.cout(c[3]),.sum(c[2]));
endmodule

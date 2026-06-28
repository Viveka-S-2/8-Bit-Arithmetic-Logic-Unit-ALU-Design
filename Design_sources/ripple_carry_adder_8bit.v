`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2026 01:26:19
// Design Name: 
// Module Name: ripple_carry_adder_8bit
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


module ripple_carry_adder_8bit(
input [7:0]a,b,
input cin,
output cout,
output [7:0]sum
    );
    wire [8:0]carry;
    assign carry[0]=cin;
    genvar i;
    generate 
    for(i=0;i<8;i=i+1) begin:RCA
    full_adder f0(.a(a[i]),
            .b(b[i]),
            .cin(carry[i]),
            .cout(carry[i+1]),
            .sum(sum[i]));
    end
    endgenerate
    assign cout=carry[8];
endmodule

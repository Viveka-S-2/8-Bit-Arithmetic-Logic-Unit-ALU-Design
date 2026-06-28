`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2026 23:56:55
// Design Name: 
// Module Name: vedic_4x4_multiplier
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
module rca_4bit(
input [3:0]a,b,
input cin,
output cout,
output [3:0]sum
    );
    wire [4:0]carry;
    assign carry[0]=cin;
    genvar i;
    generate 
    for(i=0;i<4;i=i+1) begin:RCA_4bit
    full_adder f0(.a(a[i]),
            .b(b[i]),
            .cin(carry[i]),
            .cout(carry[i+1]),
            .sum(sum[i]));
    end
    endgenerate
    assign cout=carry[4];
endmodule

module vedic_4x4_multiplier(
input [3:0] m,n,
output [7:0] o
    );
    wire c1,c2,c3,c4;
    wire [15:0]vmout;
    wire [5:0] add;
    vedic_2x2_multiplier vm1(.a(m[1:0]),.b(n[1:0]),.c({vmout[3:2],o[1:0]}));
    vedic_2x2_multiplier vm2(.a(m[3:2]),.b(n[1:0]),.c(vmout[7:4]));
    vedic_2x2_multiplier vm3(.a(m[1:0]),.b(n[3:2]),.c(vmout[11:8]));
    vedic_2x2_multiplier vm4(.a(m[3:2]),.b(n[3:2]),.c(vmout[15:12]));
    rca_4bit r5(.a(vmout[11:8]),.b(vmout[7:4]),.cin(1'b0),.cout(c1),.sum(add[5:2]));
    rca_4bit r6(.a(add[5:2]),.b({2'b00,vmout[3:2]}),.cin(1'b0),.cout(c2),.sum({add[1:0],o[3:2]}));
    HA a1(.a(c1),.b(c2),.cout(c3),.sum(c4));
    rca_4bit r7(.a(vmout[15:12]),.b({c3,c4,add[1:0]}),.cin(1'b0),.cout(),.sum(o[7:4]));
    
endmodule

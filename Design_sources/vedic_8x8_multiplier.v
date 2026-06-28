`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 00:40:27
// Design Name: 
// Module Name: vedic_8x8_multiplier
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


module vedic_8x8_multiplier(
input [7:0]x,y,
output [15:0]z
    );
    wire c1,c2,c3,c4;
    wire [31:0]vmout;
    wire [11:0] add;
    vedic_4x4_multiplier vm5(.m(x[3:0]),.n(y[3:0]),.o({vmout[7:4],z[3:0]}));
    vedic_4x4_multiplier vm6(.m(x[7:4]),.n(y[3:0]),.o(vmout[15:8]));
    vedic_4x4_multiplier vm7(.m(x[3:0]),.n(y[7:4]),.o(vmout[23:16]));
    vedic_4x4_multiplier vm8(.m(x[7:4]),.n(y[7:4]),.o(vmout[31:24]));
    ripple_carry_adder_8bit r5(.a(vmout[23:16]),.b(vmout[15:8]),.cin(1'b0),.cout(c1),.sum(add[11:4]));
    ripple_carry_adder_8bit r6(.a(add[11:4]),.b({4'b0000,vmout[7:4]}),.cin(1'b0),.cout(c2),.sum({add[3:0],z[7:4]}));
    HA a2(.a(c1),.b(c2),.cout(c3),.sum(c4));
    ripple_carry_adder_8bit r7(.a(vmout[31:24]),.b({2'b00,c3,c4,add[3:0]}),.cin(1'b0),.cout(),.sum(z[15:8]));
endmodule

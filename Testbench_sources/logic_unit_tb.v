`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2026 15:27:03
// Design Name: 
// Module Name: logic_unit_tb
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


module logic_unit_tb;
reg [7:0]a,b;
reg [2:0] opcode;
wire [7:0] c;
logic_unit l1(.a(a),
.b(b),
.opcode(opcode),
.c(c));
initial begin
$display ("a        b        opcode | c");
$monitor ("%8b %8b %3b | %8b",a,b,opcode,c);
a=8'd200;b=8'd99;opcode=3'b000; //a=11001000, b=01100011
#10 a=8'd200;b=8'd99;opcode=3'b001; //and=01000000
#10 a=8'd200;b=8'd99;opcode=3'b010; //or=11101011
#10 a=8'd200;b=8'd99;opcode=3'b011; //xor=10101011
#10 a=8'd200;b=8'd99;opcode=3'b100; //xnor=01010100
#10 a=8'd200;b=8'd99;opcode=3'b101; //not=00110111
#10 a=8'd200;b=8'd99;opcode=3'b111;
#10 $finish;
end
endmodule

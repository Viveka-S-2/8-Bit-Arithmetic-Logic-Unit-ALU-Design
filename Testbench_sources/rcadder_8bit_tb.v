`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2026 01:46:49
// Design Name: 
// Module Name: rcadder_8bit_tb
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


module rcadder_8bit_tb;
reg [7:0]a,b;
reg cin;
wire cout;
wire [7:0]sum;
ripple_carry_adder_8bit r1(.a(a),
.b(b),
.cin(cin),
.cout(cout),
.sum(sum));
initial begin
$display("a b cin | cout sum");
$monitor("%3d %3d %b | %b %3d",a,b,cin,cout,sum);
a=8'd5;b=8'd3;cin=0; //8
#10 a=8'd5;b=8'd3;cin=1; //9
#10 a=8'd10;b=8'd15;cin=0; //25
#10 a=8'd170;b=8'd85;cin=0; //255
#10 a=8'd146;b=8'd100;cin=0; //246
#10 a=8'd255;b=8'd1;cin=0; //0, cout=1
#10 $finish;
end
endmodule

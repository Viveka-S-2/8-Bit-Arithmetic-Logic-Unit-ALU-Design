`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2026 23:47:34
// Design Name: 
// Module Name: vm_2x2_tb
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


module vm_2x2_tb;
reg [1:0]a,b;
wire[3:0] c;
vedic_2x2_multiplier v1(.a(a),.b(b),.c(c));
initial begin
$display("a  b | c");
$monitor("%2b %2b | %4b",a,b,c);
a=2'b00;b=2'b00;
#10 a=2'b10;b=2'b11;
#10 a=2'b11;b=2'b01;
#10 a=2'b11;b=2'b11;
#10 $finish;
end
endmodule

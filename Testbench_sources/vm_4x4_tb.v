`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 00:28:09
// Design Name: 
// Module Name: vm_4x4_tb
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


module vm_4x4_tb;
reg [3:0]m,n;
wire[7:0] o;
vedic_4x4_multiplier v2(.m(m),.n(n),.o(o));
initial begin
$display("m   n   | o");
$monitor("%4b  %4b  | %8b",m,n,o);
m=4'b0000;n=4'b0000;
#10 m=4'b1011;n=4'b1001; //11x9=99
#10 m=4'b0110;n=4'b0100; //6x4=24
#10 m=4'b1110;n=4'b0100; //14x4=56
#10 m=4'b1111;n=4'b1111; //15x15=225
#10 $finish;
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 04:17:10
// Design Name: 
// Module Name: vm_8x8_tb
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


module vm_8x8_tb;
reg [7:0]x,y;
wire[15:0] z;
vedic_8x8_multiplier v2(.x(x),.y(y),.z(z));
initial begin
$display("x       y       | z");
$monitor("%8b      %8b      | %16b",x,y,z);
x=8'b00000000;y=8'b00000000;
#10 x=8'b10110001;y=8'b10011100; // 177x156=27612
#10 x=8'b01101010;y=8'b01000011; //106x67=7102
#10 x=8'b11100001;y=8'b01001100; //225x76=17100
#10 x=8'b11111111;y=8'b11111111; //255x255=65025
#10 $finish;
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2026 03:19:13
// Design Name: 
// Module Name: usregister_tb
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


module usregister_tb;
reg clk, reset;
reg [1:0] sel;
reg serial_right, serial_left;
reg [7:0] parallel_in;
wire [7:0] parallel_out;
universal_shift_register u1(.clk(clk),
.reset(reset),
.sel(sel),
.serial_right(serial_right),
.serial_left(serial_left),
.parallel_in(parallel_in),
.parallel_out(parallel_out)); 
initial
clk=1'b0;
always 
#5 clk=~clk;
initial begin
$display("sel  clk  reset  serial_right  serial_left  parallel_in  | parallel_out");
$monitor("%b    %b    %b      %b             %b           %b       | %b", 
          sel, clk, reset, serial_right, serial_left, parallel_in, parallel_out);
      
    reset = 1;
    sel = 2'b00;
    parallel_in = 8'b00000000;
    serial_right = 0;
    serial_left = 0;
    
    #10 reset = 0;
    
    #20 sel = 2'b11;
    parallel_in = 8'b10101010;

    #20 sel = 2'b01;
    serial_right = 1;

    #20 sel = 2'b10;
    serial_left = 1;

    #20 sel = 2'b00;

    #20 $finish;    
end
endmodule

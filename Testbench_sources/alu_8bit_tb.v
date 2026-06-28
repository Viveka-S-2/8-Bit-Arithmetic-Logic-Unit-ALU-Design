`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 21:14:06
// Design Name: 
// Module Name: alu_8bit_tb
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
/////////////////////////////////////////////////////////////////////////////////


module alu_8bit_tb;
reg [7:0] in1,in2;
reg rca_cin;
reg [2:0] logic_opcode;
reg clk, reset;
reg [1:0] usr_sel;
reg serial_right, serial_left;
reg [7:0] parallel_in;
reg [1:0] mux_sel;
wire [7:0] alu_out;

alu_8bit a1(.in1(in1),.in2(in2),.rca_cin(rca_cin),.logic_opcode(logic_opcode),.clk(clk),
.reset(reset),.usr_sel(usr_sel),.serial_right(serial_right),.serial_left(serial_left),
.parallel_in(parallel_in),.mux_sel(mux_sel),.alu_out(alu_out));

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
$display("in1         in2      rca_cin  logic_opcode  clk  reset  usr_sel  serial_right  serial_left  parallel_in  mux_sel  |  alu_out");
$monitor("%8b    %8b      %b      %3b          %b    %b     %2b      %b             %b            %8b         %2b     | %8b",in1,in2,rca_cin,logic_opcode,clk,reset,usr_sel,serial_right,serial_left,parallel_in,mux_sel,alu_out); 
//10110110=182 , 00101101=45
in1=8'd182;in2=8'd45;rca_cin=1'b0;mux_sel=2'b00;
reset = 0;
logic_opcode = 3'b000;
usr_sel = 2'b00;
serial_left = 0;
serial_right = 0;
parallel_in = 0;

#20 logic_opcode = 3'b001; mux_sel = 2'b01; // AND
#20 logic_opcode = 3'b010; mux_sel = 2'b01; // OR
#20 logic_opcode = 3'b011; mux_sel = 2'b01; // XOR
#20 logic_opcode = 3'b100; mux_sel = 2'b01; // XNOR
#20 logic_opcode = 3'b101; mux_sel = 2'b01; // NOT

#20 reset = 1;
    usr_sel = 2'b00;
    parallel_in = 8'b00000000;
    serial_right = 0;
    serial_left = 0;
    mux_sel=2'b10;

#10 reset=0;

#20 usr_sel=2'b10;serial_left=1'b1; mux_sel=2'b10; 

#20 usr_sel = 2'b01;serial_right = 1'b1;mux_sel = 2'b10;

#20 usr_sel=2'b11;parallel_in=8'b10011101;  mux_sel=2'b10;//10011101=157

#20 in1=8'd182;in2=8'd45;mux_sel=2'b11;

#20 $finish;
end
endmodule

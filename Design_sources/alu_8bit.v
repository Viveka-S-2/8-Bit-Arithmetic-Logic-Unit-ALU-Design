`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 19:42:00
// Design Name: 
// Module Name: alu_8bit
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


module alu_8bit(
input [7:0] in1,in2,
input rca_cin,
input [2:0] logic_opcode,
input clk, reset,
input [1:0] usr_sel,
input serial_right, serial_left,
input [7:0] parallel_in,
input [1:0] mux_sel,
output [7:0] alu_out
    );
    wire [7:0] rca_out,logic_out,usr_out;
    wire [15:0] vm_out;
    wire rca_cout;
    ripple_carry_adder_8bit q1(.a(in1),.b(in2),.cin(rca_cin),.cout(rca_cout),.sum(rca_out));
    
    logic_unit q2(.a(in1),.b(in2),.opcode(logic_opcode),.c(logic_out));
    
    universal_shift_register q3(.clk(clk),.reset(reset),.sel(usr_sel),.serial_right(serial_right),
    .serial_left(serial_left),.parallel_in(parallel_in),.parallel_out(usr_out));
    
    vedic_8x8_multiplier q4(.x(in1),.y(in2),.z(vm_out));
    
    mux q5(.sel(mux_sel),.rca_out(rca_out),.logic_out(logic_out),.usr_out(usr_out),
    .vm_out(vm_out[7:0]),.alu_out(alu_out));

endmodule

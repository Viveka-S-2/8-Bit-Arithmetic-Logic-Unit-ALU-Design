`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 19:00:32
// Design Name: 
// Module Name: mux
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


module mux(
input [1:0] sel,
input [7:0] rca_out,logic_out,usr_out,vm_out,
output reg [7:0] alu_out
    );
  always @(*) begin
  case(sel)
  2'b00: alu_out= rca_out;
  2'b01: alu_out= logic_out;
  2'b10: alu_out= usr_out;
  2'b11: alu_out= vm_out;
  default: alu_out=8'd0;
  endcase
  end
endmodule

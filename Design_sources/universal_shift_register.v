`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2026 18:51:34
// Design Name: 
// Module Name: universal_shift_register
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
module d_ff(input d,clk,reset,
output reg q);
always @(posedge clk or posedge reset) begin
if(reset)
q<=0;
else
q<=d;
end
endmodule

module universal_shift_register(
input clk, reset,
input [1:0] sel,
input serial_right, serial_left,
input [7:0] parallel_in,
output [7:0] parallel_out
    );
    integer i;
    reg [7:0] mux_out;
    wire [7:0] q_internal;
    always @(*) begin
    for(i=0;i<8;i=i+1) begin
    case(sel)
    2'b00: mux_out[i]=q_internal[i]; //hold
    2'b01: begin //right shift
    if(i==7)
    mux_out[i]=serial_right;
    else
    mux_out[i]=q_internal[i+1];
    end
    2'b10: begin //left shift
    if(i==0)
    mux_out[i]=serial_left;
    else
    mux_out[i]=q_internal[i-1];
    end
    2'b11: mux_out[i]=parallel_in[i];
    endcase
    end
    end
    genvar j;
  generate
    for (j=0;j<8;j=j+1) begin : dff
        d_ff d1 (.d(mux_out[j]),
            .clk(clk),
            .reset(reset),
            .q(q_internal[j]));
    end
endgenerate
assign parallel_out=q_internal;
endmodule

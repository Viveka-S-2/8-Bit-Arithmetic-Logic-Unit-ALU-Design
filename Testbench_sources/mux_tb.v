`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2026 19:13:37
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;
reg [1:0] sel;
reg [7:0] rca_out,logic_out,usr_out,vm_out;
wire [7:0] alu_out;
mux m1(.sel(sel),.rca_out(rca_out),.logic_out(logic_out),.usr_out(usr_out),
.vm_out(vm_out),.alu_out(alu_out));
initial begin
$display("sel rca_out     logic_out    usr_out     vm_out    | alu_out");
$monitor("%2b  %8b    %8b      %8b    %8b  | %8b",sel,rca_out,logic_out,usr_out,vm_out,alu_out);
rca_out=8'd20;
logic_out=8'd100;
usr_out=8'd85;
vm_out=8'd250;

sel=2'b00;
#10 sel=2'b10;
#10 sel=2'b01;
#10 sel=2'b10;
#10 sel=2'b11;
#10 $finish;
end
endmodule

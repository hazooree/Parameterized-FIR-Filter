`timescale 1ns / 1ps
module FIR #(parameter IPL=4,parameter CEL=4,parameter OPL=6,parameter IPD=4)(X,c,clk,Y);
input [(IPL-1):0]X;
input clk;
input [(CEL*IPD-1):0]c;
output reg [(OPL-1):0]Y;
integer k,j;
reg [(IPL-1):0]Xn[0:(IPD-1)];
always @(posedge clk)
begin
   Y = 0;
   for (k=0; k <= (IPD-1); k = k + 1)
	  Y  = Y + c[k*CEL +: CEL]*Xn[k];
end
always @(posedge clk) begin
for (j=(IPD-1); j>=1; j = j - 1)
Xn[j] <= Xn[j-1];
Xn[0] <= X;
end
endmodule

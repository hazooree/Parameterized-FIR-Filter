`timescale 1ns / 1ps
`define TS 5
`define DELAY `TS*2
`define NInBits 4
`define NOutBits 6
`define NCoeffBits 4
`define FilterLength 5

module FIR_Test #(parameter IPL=`NInBits,parameter CEL=`NCoeffBits,parameter OPL=`NOutBits, parameter IPD=`FilterLength);
	// Inputs
	reg [(IPL-1):0] X;
	reg [(CEL*IPD-1):0] c;
	reg clk;
	// Outputs
	wire [(OPL-1):0] Y;
// Instantiate the Unit Under Test (UUT)
	FIR #(IPL, CEL, OPL, IPD) uut (
		.X(X), 
		.c(c), 
		.clk(clk), 
		.Y(Y)
	);
integer k;
initial begin
		// Initialize Inputs
	clk = 0;	
forever #(`TS) clk=~clk;
end
initial begin
for (k = 0; k <= (IPD-1); k = k + 1)
	c[k*CEL +: CEL] = 1;
	X = 3;
#(`DELAY);
	X = 4;
#(`DELAY);
	X = 10;
#(`DELAY);
	X = 11;
#(`DELAY);
	X = 13;
#(`DELAY);
	X = 14;
#(`DELAY);
	X = 7;
#(`DELAY);
	X = 2;
#(`DELAY);
	X = 15;
#(`DELAY);
	X = 7;
#(`DELAY);
	X = 6;
#(`DELAY);        

		// Add stimulus here

	end
      
endmodule


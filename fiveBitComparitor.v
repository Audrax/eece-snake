module fiveBitComparitor
(
    input [4:0] A,
    input [4:0] B,
    output F
);

wire [4:0]xnorwire;

xnor xnor1(xnorwire[0], A[0], B[0]);

xnor xnor2(xnorwire[1], A[1], B[1]);

xnor xnor3(xnorwire[2], A[2], B[2]);

xnor xnor4(xnorwire[3], A[3], B[3]);

xnor xnor5(xnorwire[4], A[4], B[4]);

nand and1(F, xnorwire[0], xnorwire[1], xnorwire[2], xnorwire[3], xnorwire[4]);

endmodule

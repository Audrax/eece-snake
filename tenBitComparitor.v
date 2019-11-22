module tenBitComparitor
(
    input [9:0] A,
    input [9:0] B,
    output F
);

wire [9:0] xnorwire;

xnor xnor1(xnorwire[0], A[0], B[0]);

xnor xnor2(xnorwire[1], A[1], B[1]);

xnor xnor3(xnorwire[2], A[2], B[2]);

xnor xnor4(xnorwire[3], A[3], B[3]);

xnor xnor5(xnorwire[4], A[4], B[4]);

xnor xnor6(xnorwire[5], A[5], B[5]);

xnor xnor7(xnorwire[6], A[6], B[6]);

xnor xnor8(xnorwire[7], A[7], B[7]);

xnor xnor9(xnorwire[8], A[8], B[8]);

xnor xnor10(xnorwire[9], A[9], B[9]);

nand and1(F, xnorwire[0], xnorwire[1], xnorwire[2], xnorwire[3], xnorwire[4], xnorwire[5], xnorwire[6], xnorwire[7], xnorwire[8], xnorwire[9]);

endmodule
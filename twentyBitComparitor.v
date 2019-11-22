module twentyBitComparitor
(
    input [19:0] A,
    input [19:0] B,
    output F
);

wire [19:0] xnorwire;

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

xnor xnor11(xnorwire[10], A[10], B[10]);

xnor xnor12(xnorwire[11], A[11], B[11]);

xnor xnor13(xnorwire[12], A[12], B[12]);

xnor xnor14(xnorwire[13], A[13], B[13]);

xnor xnor15(xnorwire[14], A[14], B[14]);

xnor xnor16(xnorwire[15], A[15], B[15]);

xnor xnor17(xnorwire[16], A[16], B[16]);

xnor xnor18(xnorwire[17], A[17], B[17]);

xnor xnor19(xnorwire[18], A[18], B[18]);

xnor xnor20(xnorwire[19], A[19], B[19]);

nand and1(F, xnorwire[0], xnorwire[1], xnorwire[2], xnorwire[3], xnorwire[4], xnorwire[5], xnorwire[6], xnorwire[7], xnorwire[8], xnorwire[9],xnorwire[10], xnorwire[11], xnorwire[12], xnorwire[13], xnorwire[14], xnorwire[15], xnorwire[16], xnorwire[17], xnorwire[18], xnorwire[19]);

endmodule

module tenBitComparitor
(
    input [9:0] A,
    input [9:0] B,
    output F
);

wire [9:0]xnorwire;

xnor xnor1(xnorwire[0], max[0], addout[0]);

xnor xnor2(xnorwire[1], max[1], addout[1]);

xnor xnor3(xnorwire[2], max[2], addout[2]);

xnor xnor4(xnorwire[3], max[3], addout[3]);

xnor xnor5(xnorwire[4], max[4], addout[4]);

xnor xnor6(xnorwire[5], max[5], addout[5]);

xnor xnor7(xnorwire[6], max[6], addout[6]);

xnor xnor8(xnorwire[7], max[7], addout[7]);

xnor xnor9(xnorwire[8], max[8], addout[8]);

xnor xnor10(xnorwire[9], max[9], addout[9]);

nand and1(opcode, xnorwire[0], xnorwire[1], xnorwire[2], xnorwire[3], xnorwire[4], xnorwire[5], xnorwire[6], xnorwire[7], xnorwire[8], xnorwire[9]);

endmodule

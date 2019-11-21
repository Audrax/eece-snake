module fiveBitSubtractor
(
    input [4:0] A,
    input [4:0] B,
    output [4:0] D
);

wire carryOut1, carryOut2, carryOut3, carryOut4;
wire [4:0] B_Not;

// Invert the B input
not not1(B_Not[0], B[0]);
not not2(B_Not[1], B[1]);
not not3(B_Not[2], B[2]);
not not4(B_Not[3], B[3]);
not not5(B_Not[4], B[4]);

// Set LSB carry in to 1
FULLADD add1
(
    .A(A[0]),
    .B(B_Not[0]),
    .Co(carryOut1),
    .Ci(1'b1),
    .SUM(D[0])
);

FULLADD add2
(
    .A(A[1]),
    .B(B_Not[1]),
    .Co(carryOut2),
    .Ci(carryOut1),
    .SUM(D[1])
);

FULLADD add3
(
    .A(A[2]),
    .B(B_Not[2]),
    .Co(carryOut3),
    .Ci(carryOut2),
    .SUM(D[2])
);

FULLADD add4
(
    .A(A[3]),
    .B(B_Not[3]),
    .Co(carryOut4),
    .Ci(carryOut3),
    .SUM(D[3])
);

FULLADD add5
(
    .A(A[4]),
    .B(B_Not[4]),
    .Co(),
    .Ci(carryOut4),
    .SUM(D[4])
);

endmodule

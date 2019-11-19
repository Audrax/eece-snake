module fiveBitSubtractor
(
    input [4:0] A,
    input [4:0] B,
    output [4:0] D
);

wire carryOut1, carryOut2, carryOut3, carryOut4;
wire [4:0] B_Not;

not not1(B_Not[0], B[0]);
not not2(B_Not[1], B[1]);
not not3(B_Not[2], B[2]);
not not4(B_Not[3], B[3]);
not not5(B_Not[4], B[4]);

FULLADDER add1
(
    .A(A[0]),
    .B(B[0]),
    .Co(carryOut1),
    .Ci(0'b1)
);

FULLADDER add2
(
    .A(A[1]),
    .B(B[1]),
    .Co(carryOut2),
    .Ci(carryOut1)
);

FULLADDER add3
(
    .A(A[2]),
    .B(B[2]),
    .Co(carryOut3),
    .Ci(carryOut2)
);

FULLADDER add4
(
    .A(A[3]),
    .B(B[3]),
    .Co(carryOut4),
    .Ci(carryOut3)
);

FULLADDER add5
(
    .A(A[4]),
    .B(B[4]),
    .Co(),
    .Ci(carryOut4)
);

endmodule

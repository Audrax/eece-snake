module tenBitSubtractor
(
    input [9:0] A,
    input [9:0] B,
    output [9:0] D
);

wire carryOut1, carryOut2, carryOut3, carryOut4, carryOut5, carryOut6, carryOut7, carryOut8, carryOut9;
wire [9:0] B_Not;

not not1(B_Not[0], B[0]);
not not2(B_Not[1], B[1]);
not not3(B_Not[2], B[2]);
not not4(B_Not[3], B[3]);
not not5(B_Not[4], B[4]);
not not6(B_Not[5], B[5]);
not not7(B_Not[6], B[6]);
not not8(B_Not[7], B[7]);
not not9(B_Not[8], B[8]);
not not10(B_Not[9], B[9]);

FULLADDER add1
(
    .A(A[0]),
    .B(B[0]),
    .Co(carryOut1),
    .Ci(1'b1)
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
    .Co(carryOut5),
    .Ci(carryOut4)
);

FULLADDER add6
(
    .A(A[5]),
    .B(B[5]),
    .Co(carryOut6),
    .Ci(carryOut5)
);

FULLADDER add7
(
    .A(A[6]),
    .B(B[6]),
    .Co(carryOut7),
    .Ci(carryOut6)
);

FULLADDER add8
(
    .A(A[7]),
    .B(B[7]),
    .Co(carryOut8),
    .Ci(carryOut7)
);

FULLADDER add9
(
    .A(A[8]),
    .B(B[8]),
    .Co(carryOut9),
    .Ci(carryOut8)
);

FULLADDER add10
(
    .A(A[9]),
    .B(B[9]),
    .Co(),
    .Ci(carryOut9)
);

endmodule

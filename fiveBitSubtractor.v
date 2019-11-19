module fiveBitSubtractor
(
    input [4:0] A,
    input [4:0] B,
    output [4:0] D
);

wire carryOut1, carryOut2, carryOut3, carryout4;
wire [4:0] B_Not;

not not1(B_Not, B);

FULLADDER add1
(
    .A(A[0]),
    .B(B[0]),
    .Co(carryOut1),
    .Ci(0'b1)
)

FULLADDER add2
(
    .A(A[1]),
    .B(B[1]),
    .Co(carryOut2),
    .Ci(carryOut1)
)

FULLADDER add3
(
    .A(A[2]),
    .B(B[2]),
    .Co(carryOut3),
    .Ci(carryOut2)
)

FULLADDER add4
(
    .A(A[3]),
    .B(B[3]),
    .Co(carryOut4),
    .Ci(carryOut3)
)

FULLADDER add5
(
    .A(A[4]),
    .B(B[4]),
    .Co(),
    .Ci(carryOut4)
)

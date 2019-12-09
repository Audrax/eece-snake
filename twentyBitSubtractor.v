module twentyBitSubtractor
(
    input [19:0] A,
    input [19:0] B,
    output [19:0] D
);

wire carryOut1, carryOut2, carryOut3, carryOut4, carryOut5, carryOut6, carryOut7, carryOut8, carryOut9,
carryOut10, carryOut11, carryOut12, carryOut13, carryOut14, carryOut15, carryOut16, carryOut17, carryOut18, carryOut19;
wire [19:0] B_Not;

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
not not11(B_Not[10], B[10]);
not not12(B_Not[11], B[11]);
not not13(B_Not[12], B[12]);
not not14(B_Not[13], B[13]);
not not15(B_Not[14], B[14]);
not not16(B_Not[15], B[15]);
not not17(B_Not[16], B[16]);
not not18(B_Not[17], B[17]);
not not19(B_Not[18], B[18]);
not not20(B_Not[19], B[19]);

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
    .Co(carryOut5),
    .Ci(carryOut4),
	.SUM(D[4])
);

FULLADD add6
(
    .A(A[5]),
    .B(B_Not[5]),
    .Co(carryOut6),
    .Ci(carryOut5),
	.SUM(D[5])
);

FULLADD add7
(
    .A(A[6]),
    .B(B_Not[6]),
    .Co(carryOut7),
    .Ci(carryOut6),
	.SUM(D[6])
);

FULLADD add8
(
    .A(A[7]),
    .B(B_Not[7]),
    .Co(carryOut8),
    .Ci(carryOut7),
	.SUM(D[7])
);

FULLADD add9
(
    .A(A[8]),
    .B(B_Not[8]),
    .Co(carryOut9),
    .Ci(carryOut8),
	.SUM(D[8])
);

FULLADD add10
(
    .A(A[9]),
    .B(B_Not[9]),
    .Co(carryOut10),
    .Ci(carryOut9),
	.SUM(D[9])
);

FULLADD add11
(
    .A(A[10]),
    .B(B_Not[10]),
    .Co(carryOut11),
    .Ci(carryOut10),
	.SUM(D[10])
);

FULLADD add12
(
    .A(A[11]),
    .B(B_Not[11]),
    .Co(carryOut12),
    .Ci(carryOut11),
	.SUM(D[11])
);

FULLADD add13
(
    .A(A[12]),
    .B(B_Not[12]),
    .Co(carryOut13),
    .Ci(carryOut12),
	.SUM(D[12])
);

FULLADD add14
(
    .A(A[13]),
    .B(B_Not[13]),
    .Co(carryOut14),
    .Ci(carryOut13),
	.SUM(D[13])
);

FULLADD add15
(
    .A(A[14]),
    .B(B_Not[14]),
    .Co(carryOut15),
    .Ci(carryOut14),
	.SUM(D[14])
);

FULLADD add16
(
    .A(A[15]),
    .B(B_Not[15]),
    .Co(carryOut16),
    .Ci(carryOut15),
	.SUM(D[15])
);

FULLADD add17
(
    .A(A[16]),
    .B(B_Not[16]),
    .Co(carryOut17),
    .Ci(carryOut16),
	.SUM(D[16])
);

FULLADD add18
(
    .A(A[17]),
    .B(B_Not[17]),
    .Co(carryOut18),
    .Ci(carryOut17),
	.SUM(D[17])
);

FULLADD add19
(
    .A(A[18]),
    .B(B_Not[18]),
    .Co(carryOut19),
    .Ci(carryOut18),
	.SUM(D[18])
);

FULLADD add20
(
    .A(A[19]),
    .B(B_Not[19]),
    .Co(),
    .Ci(carryOut19),
	.SUM(D[19])
);

endmodule

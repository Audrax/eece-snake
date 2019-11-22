module twentyBitAdder
(
    input [19:0] A,
    input [19:0] B,
    output [19:0] S
);

wire carryOut, carryOut2, carryOut3, carryOut4, carryOut5, carryOut6, carryOut7, carryOut8, carryOut9, 
     carryOut10, carryOut11, carryOut12, carryOut13, carryOut14, carryOut15, carryOut16, carryOut17, carryOut18, carryOut19;

FULLADD add1
(
    .A({A[0]}), 
    .B({B[0]}),
    .Ci({1'b0}),
    .Co(carryOut),
    .SUM(S[0])
);

FULLADD add2
(
    .A({A[1]}), 
    .B(B[1]),
    .Ci({carryOut}),
    .Co(carryOut2),
    .SUM(S[1])
);

FULLADD add3
(
    .A({A[2]}), 
    .B({B[2]}),
    .Ci({carryOut2}),
    .Co(carryOut3),
    .SUM(S[2])
);

FULLADD add4
(
    .A({A[3]}), 
    .B({B[3]}),
    .Ci({carryOut3}),
    .Co(carryOut4),
    .SUM(S[3])
);

FULLADD add5
(
    .A({A[4]}), 
    .B({B[4]}),
    .Ci({carryOut4}),
    .Co(carryOut5),
    .SUM(S[4])
);

FULLADD add6
(
    .A({A[5]}), 
    .B(B[5]),
    .Ci({carryOut5}),
    .Co(carryOut6),
    .SUM(S[5])
);

FULLADD add7
(
    .A({A[6]}), 
    .B({B[6]}),
    .Ci({carryOut6}),
    .Co(carryOut7),
    .SUM(S[6])
);

FULLADD add8
(
    .A({A[7]}), 
    .B({B[7]}),
    .Ci({carryOut7}),
    .Co(carryOut8),
    .SUM(S[7])
);

FULLADD add9
(
    .A({A[8]}), 
    .B({B[8]}),
    .Ci({carryOut8}),
    .Co(carryOut9),
    .SUM(S[8])
);

FULLADD add10
(
    .A({A[9]}), 
    .B({B[9]}),
    .Ci({carryOut9}),
    .Co(),
    .SUM(S[9])
);

FULLADD add11
(
    .A({A[10]}), 
    .B({B[10]}),
    .Ci({1'b0}),
    .Co(carryOut10),
    .SUM(S[10])
);

FULLADD add12
(
    .A({A[11]}), 
    .B(B[11]),
    .Ci({carryOut10}),
    .Co(carryOut12),
    .SUM(S[11])
);

FULLADD add13
(
    .A({A[12]}), 
    .B({B[12]}),
    .Ci({carryOut12}),
    .Co(carryOut13),
    .SUM(S[12])
);

FULLADD add14
(
    .A({A[13]}), 
    .B({B[13]}),
    .Ci({carryOut13}),
    .Co(carryOut14),
    .SUM(S[13])
);

FULLADD add15
(
    .A({A[14]}), 
    .B({B[14]}),
    .Ci({carryOut14}),
    .Co(carryOut15),
    .SUM(S[14])
);

FULLADD add16
(
    .A({A[15]}), 
    .B(B[15]),
    .Ci({carryOut15}),
    .Co(carryOut16),
    .SUM(S[15])
);

FULLADD add17
(
    .A({A[16]}), 
    .B({B[16]}),
    .Ci({carryOut16}),
    .Co(carryOut17),
    .SUM(S[16])
);

FULLADD add18
(
    .A({A[17]}), 
    .B({B[17]}),
    .Ci({carryOut17}),
    .Co(carryOut18),
    .SUM(S[17])
);

FULLADD add19
(
    .A({A[18]}), 
    .B({B[18]}),
    .Ci({carryOut18}),
    .Co(carryOut19),
    .SUM(S[18])
);

FULLADD add20
(
    .A({A[19]}), 
    .B({B[19]}),
    .Ci({carryOut19}),
    .Co(),
    .SUM(S[19])
);

endmodule

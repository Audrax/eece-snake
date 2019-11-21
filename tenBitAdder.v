module tenBitAdder
(
    input [9:0] A,
    input [9:0] B,
    output [9:0] S
);

wire carryOut, carryOut2, carryOut3, carryOut4, carryOut5, carryOut6, carryOut7, carryOut8, carryOut9;

FULLADDER add1
(
    .A({A[0]}), 
    .B({B[0]}),
    .Ci({1'b0}),
    .Co(carryOut),
    .SUM(S[0])
);

FULLADDER add2
(
    .A({A[1]}), 
    .B(B[1]),
    .Ci({carryOut}),
    .Co(carryOut2),
    .SUM(S[1])
);

FULLADDER add3
(
    .A({A[2]}), 
    .B({B[2]}),
    .Ci({carryOut2}),
    .Co(carryOut3),
    .SUM(S[2])
);

FULLADDER add4
(
    .A({A[3]}), 
    .B({B[3]}),
    .Ci({carryOut3}),
    .Co(carryOut4),
    .SUM(S[3])
);

FULLADDER add5
(
    .A({A[4]}), 
    .B({B[4]}),
    .Ci({carryOut4}),
    .Co(carryOut5),
    .SUM(S[4])
);

FULLADDER add6
(
    .A({A[5]}), 
    .B(B[5]),
    .Ci({carryOut5}),
    .Co(carryOut6),
    .SUM(S[5])
);

FULLADDER add7
(
    .A({A[6]}), 
    .B({B[6]}),
    .Ci({carryOut6}),
    .Co(carryOut7),
    .SUM(S[6])
);

FULLADDER add8
(
    .A({A[7]}), 
    .B({B[7]}),
    .Ci({carryOut7}),
    .Co(carryOut8),
    .SUM(S[7])
);

FULLADDER add9
(
    .A({A[8]}), 
    .B({B[8]}),
    .Ci({carryOut8}),
    .Co(carryOut9),
    .SUM(S[8])
);

FULLADDER add10
(
    .A({A[9]}), 
    .B({B[9]}),
    .Ci({carryOut9}),
    .Co(),
    .SUM(S[9])
);

endmodule

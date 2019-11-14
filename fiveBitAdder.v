module fiveBitAdder
(
    input [4:0] A,
    input [4:0] B,
    output [4:0] S
);

wire carryOut, carryOut2, carryOutt3, carryOut4;

FULLADDER add1
(
    .A({A[0]}), 
    .B({B[0]}),
    .Ci({1'b1}),
    .Co(carryOut),
    .SUM(SUM[0])
);

FULLADDER add2
(
    .A({A[1]}), 
    .B(B[1]),
    .Ci({carryOut}),
    .Co(carryOut2),
    .SUM(SUM[1])
);

FULLADDER add3
(
    .A({A[2]}), 
    .B({B[2]}),
    .Ci({carryOut2}),
    .Co(carryOut3),
    .SUM(SUM[2])
);

FULLADDER add4
(
    .A({A[0]}), 
    .B({B[0]}),
    .Ci({carryOut3}),
    .Co(carryOut4),
    .SUM(SUM[3])
);

FULLADDER add5
(
    .A({A[0]}), 
    .B({B[0]}),
    .Ci({carryOut4}),
    .Co(),
    .SUM(SUM[4])
);

endmodule

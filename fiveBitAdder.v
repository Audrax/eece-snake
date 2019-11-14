module fiveBitAdder
(
    input [4:0] A,
    input [4:0] B,
    output [4:0] S
);

wire carryOut, carryOut2, carryOutt3, carryOut4;

FULLADDER add1
(
    .a({A[0]}) 
    .b({B[0]})
    .ci({1'b1})
    .co(carryOut)
    .SUM(SUM[0])
);

FULLADDER add2
(
    .a({A[1]}) 
    .b(B[1])
    .ci({carryOut})
    .co(carryOut2)
    .SUM(SUM[1])
);

FULLADDER add3
(
    .a({A[2]}) 
    .b({B[2]})
    .ci({carryOut2})
    .co(carryOut3)
    .SUM(SUM[2])
);

FULLADDER add4
(
    .a({A[0]}) 
    .b({B[0]})
    .ci({carryOut3})
    .co(carryOut4)
    .SUM(SUM[3])
);

FULLADDER add5
(
    .a({A[0]}) 
    .b({B[0]})
    .ci({carryOut4})
    .co()
    .SUM(SUM[4])
);

endmodule

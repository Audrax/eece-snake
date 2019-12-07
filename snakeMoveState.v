module snakeMoveState
(
    input Up, Down, Left, Right, clock,
    output U, D, L, R, noMove
);

wire debU, debD, debL, debR;
wire [2:0] d, q;

// Debouncers for buttons
PushButton_Debouncer deb1
(
    .clk(clock),
    .PB(Up),
    .PB_state(),
    .PB_down(),
    .PB_up(debU)
);

PushButton_Debouncer deb2
(
    .clk(clock),
    .PB(Down),
    .PB_state(),
    .PB_down(),
    .PB_up(debD)
);

PushButton_Debouncer deb3
(
    .clk(clock),
    .PB(Left),
    .PB_state(),
    .PB_down(),
    .PB_up(debL)
);

PushButton_Debouncer deb4
(
    .clk(clock),
    .PB(Right),
    .PB_state(),
    .PB_down(),
    .PB_up(debR)
);

// Register for FSM
register #(3) reg1
(
    .clk(clock),
    .load(1'b1),
    .d(d),
    .q(q)
);

// Combinational Logic for FSM
    
    // NOT Gates
wire upNot, downNot, leftNot, rightNot;
wire [2:0] qNot;

not not1(upNot, debU);
not not2(downNot, debD);
not not3(leftNot, debL);
not not4(rightNot, debR);
not not5(qNot[2], q[2]);
not not6(qNot[1], q[1]);
not not7(qNot[0], q[0]);

    // d2 Logic
wire [5:0] andWire;

and and1(andWire[0], upNot, downNot, leftNot, debR);
and and2(andWire[1], q[2], upNot, downNot, leftNot);
and and3(andWire[2], q[2], debR);
and and4(andWire[3], q[2], debD, debL);
and and5(andWire[4], q[2], debU, debL);
and and6(andWire[5], q[2], debU, debD);
or or1(d[2], andWire[5], andWire[4], andWire[3], andWire[2], andWire[1], andWire[0]);

    // d1 Logic
wire [5:0] andWire2;

and and7(andWire2[0], upNot, downNot, debL, rightNot);
and and8(andWire2[1], upNot, debD, leftNot, rightNot);
and and9(andWire2[2], q[1], upNot, rightNot);
and and10(andWire2[3], q[1], debL);
and and11(andWire2[4], q[1], debD);
and and12(andWire2[5], q[1], debU, debR);
or or2(d[1], andWire2[5], andWire2[4], andWire2[3], andWire2[2], andWire2[1], andWire2[0]);

    // d0 Logic
wire [5:0] andWire3;

and and13(andWire3[0], upNot, downNot, debL, rightNot);
and and14(andWire3[1], debU, downNot, leftNot, rightNot);
and and15(andWire3[2], q[0], downNot, rightNot);
and and16(andWire3[3], q[0], debL);
and and17(andWire3[4], q[0], debD, debR);
and and18(andWire3[5], q[0], debU);
or or3(d[0], andWire3[5], andWire3[4], andWire3[3], andWire3[2], andWire3[1], andWire3[0]);

    // U Logic
and and19(U, qNot[1], q[0]);

    // D Logic
and and20(D, q[1], qNot[0]);

    // L Logic
and and21(L, q[1], q[0]);

    // R Logic
buf buf1(R, q[2]);

    // noMove Logic
and and22(noMove, qNot[2], qNot[1], qNot[0]);

endmodule
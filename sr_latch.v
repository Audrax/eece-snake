module sr_latch
(
    input S,
    input R,
    output Q,
    output Q_Not
);

wire norWire1, norWire2;

nor nor1(norWire1, R, norWire2);
nor nor2(norWire2, S, norWire1);

buf bufQ(Q, norWire1);
buf bufQNot(Q_Not, norWire2);

endmodule
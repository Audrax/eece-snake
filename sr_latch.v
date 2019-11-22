module sr_latch
(
    input S,
    input R,
    output Q,
    output Q_Not
);

wire norWire1, norWire2;

nor nor1(xorWire1, R, xorWire2);
nor nor2(xorWire2, S, xorWire1);

buf bufQ(Q, norWire1);
buf bufQNot(Q_Not, norWire2);

endmodule
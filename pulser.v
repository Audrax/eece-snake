module pulser
(
    input D,
    input clock,
    output Q
);

wire qWire, dWire;

nor nor1(dWire, D, qWire);

dff_en dff1
(
    .in_D(dWire),
    .in_CLK(clock),
    .in_EN(1'b1),
    .data_out(qWire)
);

buf buf1(Q, qWire);

endmodule

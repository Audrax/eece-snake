module synchro
(
    input D,
    input clock,
    output Q
);

wire en;
assign en = 1'b1;

wire dffwire;

dff_en dff1
(
    .in_D(D),
    .in_EN(en),
    .data_out(dffwire),
    .in_CLK(clock)
);

dff_en dff2
(
    .in_D(dffwire),
    .in_EN(en),
    .data_out(Q),
    .in_CLK(clock)
);

endmodule

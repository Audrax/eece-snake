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
    .D(D),
    .EN(en),
    .data_out(dffwire),
    .CLK(clock)
);

dff_en dff2
(
    .D(dffwire),
    .EN(en),
    .data_out(Q),
    .CLK(clock)
);

endmodule

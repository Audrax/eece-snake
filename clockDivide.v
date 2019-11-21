module clockDivide
(
    input clock100,
    output clock25
);

wire dffwire1, dffwire2;
wire notwire1, notwire2;

not not1(notwire1, dffwire1);

dff_en dff1
(
    .in_D(notwire1),
    .in_CLK(clock100),
    .in_EN(1'b1),
    .data_out(dffwire1)
);

not not2(notwire2, dffwire2);

dff_en dff2
(
    .in_D(notwire2),
    .in_CLK(dffwire1),
    .in_EN(1'b1),
    .data_out(dffwire2)
);

assign clock25 = dffwire2;

endmodule
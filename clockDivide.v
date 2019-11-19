module clockDivide
(
    input clock100,
    output clock25
);

wire dffwire, subwire;

dff_en dff1
(
    .D(subwire),
    .clk(clock100),
    .data_out(dffwire)
);

assign clock25 = dffwire;

tenBitSubtractor sub1
(
    .A({clock100}),
    .B({0'b0,0'b0,0'b0,0'b0,0'b0,0'b0,0'b0,0'b0,1'b1,0'b0}),
    .D({subwire})
);

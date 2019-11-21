module LFSR
(
    input clock,
    output bit
);

wire [15:0] dffwire;

dff_en dff1
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff2
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff3
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff4
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff5
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff6
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff7
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff8
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff9
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff10
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff11
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff12
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff13
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff14
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff15
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);

dff_en dff16
(
    in_D(),
    in_EN(),
    in_CLK(clock),
    data_out()
);


endmodule

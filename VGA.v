module VGA(HS, VS, R, G, B, clk)
{
    output HS,
    output VS,
    output R,
    output G,
    output B,
    input clk
}

tenBitCounter hCount
(
    .max(),
    .en_debounce(),
    .clock(),
    .count()
);

synchro hSync
(
    .D(),
    .clock(),
    .Q()
);

tenBitCounter vCount
(
    .max(),
    .en_debounce(),
    .clock(),
    .count()
);

synchro vSync
(
    .D(),
    .clock(),
    .Q()
);

endmodule

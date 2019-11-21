module VGA
(
    output HS,
    output VS,
    output R,
    output G,
    output B,
    input clk
);

wire clk25, hCountWire, vCountWire

clockDivide divide
(
    .clock100(clk),
    .clock25(clk25)
);

tenBitCounter hCount
(
    .max(10'b0111100000),
    .en_debounce(clk25),
    .clock(clk25),
    .count(hCountWire)
);

synchro hSync
(
    .D(hCountWire),
    .clock(clk25),
    .Q(HS)
);

tenBitCounter vCount
(
    .max(10'b1010000000),
    .en_debounce(clk25),
    .clock(clk25),
    .count(vCountWire)
);

synchro vSync
(
    .D(vCountWire),
    .clock(clk25),
    .Q(VS)
);

endmodule

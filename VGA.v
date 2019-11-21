module VGA
(
    output HS,
    output VS,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    input clk
);

wire clk25, hCountWire, vCountWire, hSyncWire;

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
    .Q(hSyncWire)
);

tenBitCounter vCount
(
    .max(10'b1010000000),
    .en_debounce(hSyncWire),
    .clock(clk25),
    .count(vCountWire)
);

synchro vSync
(
    .D(vCountWire),
    .clock(clk25),
    .Q(VS)
);

assign HS = hSyncWire;

endmodule

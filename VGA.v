module VGA
(
    output HS,
    output VS,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    input tempSW,
    input clk
);

buf BUFR0(R[0], tempSW);
buf BUFR1(R[1], tempSW);
buf BUFR2(R[2], tempSW);
buf BUFR3(R[3], tempSW);

buf BUFG0(G[0], tempSW);
buf BUFG1(G[1], tempSW);
buf BUFG2(G[2], tempSW);
buf BUFG3(G[3], tempSW);

buf BUFB0(B[0], tempSW);
buf BUFB1(B[1], tempSW);
buf BUFB2(B[2], tempSW);
buf BUFB3(B[3], tempSW);

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


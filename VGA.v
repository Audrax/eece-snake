module VGA
(
    output HS,
    output VS,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    input tempSwR, tempSwG, tempSwB,
    input clk
);

buf BUFR0(R[0], tempSwR);
buf BUFR1(R[1], tempSwR);
buf BUFR2(R[2], tempSwR);
buf BUFR3(R[3], tempSwR);

buf BUFG0(G[0], tempSwG);
buf BUFG1(G[1], tempSwG);
buf BUFG2(G[2], tempSwG);
buf BUFG3(G[3], tempSwG);

buf BUFB0(B[0], tempSwB);
buf BUFB1(B[1], tempSwB);
buf BUFB2(B[2], tempSwB);
buf BUFB3(B[3], tempSwB);

wire clk25, hCountWire, vCountWire, hSyncWire;

clockDivide divide
(
    .clock100(clk),
    .clock25(clk25)
);

tenBitCounter hCount
(
    .max(10'b0111100000), //480
    .en_debounce(clk25),
    .clock(clk25),
    .count(hCountWire)
);



tenBitCounter vCount
(
    .max(10'b1010000000), //640
    .en_debounce(hSyncWire),
    .clock(clk25),
    .count(vCountWire)
);



assign HS = hSyncWire;

endmodule


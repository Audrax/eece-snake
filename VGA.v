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

// Temp Switches to drive RGB Pins

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

wire [19:0] hCountWire, vCountWire;
wire clk25, hSyncWire, hSetWire, hResetWire, vSetWire, vResetWire;

// Clock Divider for Pixel Clock

clockDivide divide
(
    .clock100(clk),
    .clock25(clk25)
);

// Horizontal Counter + Sync

twentyBitCounter hCount
(
    .max(20'b00000000001100100000), //800
    .en(1'b1),
    .clock(clk25),
    .count(hCountWire)
);

twentyBitComparitor hSet
(
    .A(hCountWire),
    .B(20'b00000000000000000000), // Zero Detect
    .F(hSetWire)
);

twentyBitComparitor hReset
(
    .A(hCountWire),
    .B(20'b00000000000001100000), // 3.84us (96 clks) Detect
    .F(hResetWire)
);

sr_latch hLatch
(
    .S(hSetWire),
    .R(hResetWire),
    .Q(hSyncWire),
    .Q_Not()
);

// Vertical Counter + Sync

twentyBitCounter vCount
(
    .max(20'b01100101110000100000), //416,800
    .en(hSyncWire),
    .clock(clk25),
    .count(vCountWire)
);

twentyBitComparitor vSet
(
    .A(vCountWire),
    .B(20'b00000000000000000000), // Zero Detect
    .F(vSetWire)
);

twentyBitComparitor vReset
(
    .A(vCountWire),
    .B(20'b00000000011001000000), // 64us (1600 clks) Detect
    .F(vResetWire)
);

sr_latch vLatch
(
    .S(vSetWire),
    .R(vResetWire),
    .Q(VS),
    .Q_Not()
);

buf bufHS(HS, hSyncWire);

endmodule


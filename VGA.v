module VGA
(
    output HS,
    output VS,
    output hCount,
    output vCount,
    /*output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    input tempSwR, tempSwG, tempSwB,*/
    input clk
);

// Temp Switches to drive RGB Pins

/*and BUFR0(R[0], tempSwR, hSyncWire, vSyncWire);
and BUFR1(R[1], tempSwR, hSyncWire, vSyncWire);
and BUFR2(R[2], tempSwR, hSyncWire, vSyncWire);
and BUFR3(R[3], tempSwR, hSyncWire, vSyncWire);

and BUFG0(G[0], tempSwG, hSyncWire, vSyncWire);
and BUFG1(G[1], tempSwG, hSyncWire, vSyncWire);
and BUFG2(G[2], tempSwG, hSyncWire, vSyncWire);
and BUFG3(G[3], tempSwG, hSyncWire, vSyncWire);

and BUFB0(B[0], tempSwB, hSyncWire, vSyncWire);
and BUFB1(B[1], tempSwB, hSyncWire, vSyncWire);
and BUFB2(B[2], tempSwB, hSyncWire, vSyncWire);
and BUFB3(B[3], tempSwB, hSyncWire, vSyncWire); */

wire [19:0] hCountWire, vCountWire;
wire clk25, hSyncWire, vSyncWire, hSetWire, hResetWire, vSetWire, vResetWire;

// Clock Divider for Pixel Clock

clockDivide divide
(
    .clock100(clk),
    .clock25(clk25)
);

// Horizontal Counter + Sync

twentyBitCounter hCounter
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
    .F(hResetWire)
);

twentyBitComparitor hReset
(
    .A(hCountWire),
    .B(20'b00000000000001100000), // 3.84us (96 clks) Detect
    .F(hSetWire)
);

sr_latch hLatch
(
    .S(hSetWire),
    .R(hResetWire),
    .Q(hSyncWire),
    .Q_Not()
);

// Vertical Counter + Sync

twentyBitCounter vCounter
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
    .F(vResetWire)
);

twentyBitComparitor vReset
(
    .A(vCountWire),
    .B(20'b00000000011001000000), // 64us (1600 clks) Detect
    .F(vSetWire)
);

sr_latch vLatch
(
    .S(vSetWire),
    .R(vResetWire),
    .Q(vSyncWire),
    .Q_Not()
);

// Prop wires to sync pins
buf bufHS(HS, hSyncWire);
buf bufVS(VS, vSyncWire);

// Output count addresses
buf bufHCount(hCount, hCountWire);
buf bufVCount(vCount, vCountWire);

endmodule


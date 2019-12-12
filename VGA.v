module VGA
(
    output HS,
    output VS,
    output hCount,
    output vCount,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    //input tempSwR, tempSwG, tempSwB,
    input clk
);

// Temp Switches to drive RGB Pins
/*wire color;
and BUFR0(R[0], tempSwR, color);
and BUFR1(R[1], tempSwR, color);
and BUFR2(R[2], tempSwR, color);
and BUFR3(R[3], tempSwR, color);

and BUFG0(G[0], tempSwG, color);
and BUFG1(G[1], tempSwG, color);
and BUFG2(G[2], tempSwG, color);
and BUFG3(G[3], tempSwG, color);

and BUFB0(B[0], tempSwB, color);
and BUFB1(B[1], tempSwB, color);
and BUFB2(B[2], tempSwB, color);
and BUFB3(B[3], tempSwB, color);*/

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

/*wire colorSetWireH, colorResetWireH, colorSetWireV, colorResetWireV, colorSetWire, colorResetWire, colorWireV, colorWireH;
twentyBitComparitor colorSetH
(
    .A(hCountWire),
    .B(20'b00000000000010010001),
    .F(colorSetWireH)
);

twentyBitComparitor colorResetH
(
    .A(hCountWire),
    .B(20'b00000000001100010001),
    .F(colorResetWireH)
);

twentyBitComparitor colorSetV
(
    .A(vCountWire),
    .B(20'b00000110000011100001),
    .F(colorSetWireV)
);

twentyBitComparitor colorResetV
(
    .A(vCountWire),
    .B(20'b01100011110011100001),
    .F(colorResetWireV)
);

sr_latch colorLatchH
(
    .S(colorSetWireH),
    .R(colorResetWireH),
    .Q(colorWireH),
    .Q_Not()
);

sr_latch colorLatchV
(
    .S(colorSetWireV),
    .R(colorResetWireV),
    .Q(colorWireV),
    .Q_Not()
);

and and1(color, colorWireV, colorWireH);*/

// Output count addresses
buf bufHCount(hCount, hCountWire);
buf bufVCount(vCount, vCountWire);

endmodule


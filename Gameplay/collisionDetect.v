module collisionDetect
(
    input [19:0] headX, headY, bodyX, bodyY,
    input walls,
    output gameOver
);

wire gameOverWire, bodyCrashXWire, bodyCrashYWire;

twentyBitComparitor wallCrashRight
(
    .A(headX),
    .B(20'b00000000001100010001),
    .F(gameOverWire)
);

twentyBitComparitor wallCrashLeft
(
    .A(headX),
    .B(20'b00000000000010001111),
    .F(gameOverWire)
);

twentyBitComparitor wallCrashUp
(
    .A(headY),
    .B(20'b00000110000011011111),
    .F(gameOverWire)
);

twentyBitComparitor wallCrashDown
(
    .A(headY),
    .B(20'b01100011110011100001),
    .F(gameOverWire)
);

twentyBitComparitor bodyCrashX
(
    .A(headX),
    .B(bodyX),
    .F(bodyCrashXWire)
);

twentyBitComparitor bodyCrashY
(
    .A(headY),
    .B(bodyY),
    .F(bodyCrashYWire)
);

and and1(gameOverWire, bodyCrashXWire, bodyCrashYWire);

busMux #(1) mux1
(
    .i0(1'b0), // Walls are off (0 is temp)
    .i1(gameOverWire), // Walls are on
    .sel(walls),
    .q(gameOver)
);

endmodule
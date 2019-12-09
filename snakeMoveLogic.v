module snakeMoveLogic
(
    input clock, wallsOn, Up, Down, Left, Right,
    input [19:0] bitNum,
    output gameOver,
    output [19:0] X, Y
);

wire headChkWire;
wire [19:0] curHeadXPos, curHeadYPos, nextHeadXPos, nextHeadYPos, curBodyXPos, curBodyYPos, prevXPos, prevYPos;

// Convert Up, Down, Left, and Right into a 3 bit signal (I'm dumb and made it 4 bits)
wire [2:0] dir;
busMux16 #(3) threeBitConv
(
    .i0(3'b000), // noMove 0000
    .i1(3'b100), // Right 0001
    .i2(3'b011), // Left 0010
    .i3(),
    .i4(3'b010), // Down 0100
    .i5(),
    .i6(),
    .i7(3'b001), // Up 1000
    .i8(),
    .i9(),
    .i10(),
    .i11(),
    .i12(),
    .i13(),
    .i14(),
    .i15(),
    .sel({Up, Down, Left, Right}),
    .q(dir)
);

// Is the current bit number zero? (head pos)
twentyBitComparitor headChk
(
    .A(bitNum),
    .B(20'b00000000000000000000),
    .F(headChkWire)
);

// Hold head position in register if bit number is 0
register #(20) headPosX
(
    .clk(clock),
    .load(headChkWire),
    .d(nextHeadXPos),
    .q(curHeadXPos)
);

register #(20) headPosY
(
    .clk(clock),
    .load(headChkWire),
    .d(nextHeadYPos),
    .q(curHeadYPos)
);

// Update head pos based on current button state
wire [19:0] upWire, downWire, leftWire, rightWire;
    // 20 bit 8:1 mux for ALU
busMux8 #(20) onHeadX
(
    .i0(20'b00000000000101110000), // noMove (Initial Start Pos x=320+48)
    .i1(20'b00000000000000000000), // Up
    .i2(20'b00000000000000000000), // Down
    .i3(leftWire), // Left
    .i4(rightWire), // Right
    .i5(20'b00000000000000000000), // These shouldn't be used
    .i6(20'b00000000000000000000),
    .i7(20'b00000000000000000000),
    .sel(dir),
    .q(nextHeadXPos)
);

busMux8 #(20) onHeadY
(
    .i0(20'b00110100100010100000), // noMove (Initial Start Pos y=192000+23200)
    .i1(upWire), // Up
    .i2(downWire), // Down
    .i3(20'b00000000000000000000), // Left
    .i4(20'b00000000000000000000), // Right
    .i5(20'b00000000000000000000), // These shouldn't be used
    .i6(20'b00000000000000000000),
    .i7(20'b00000000000000000000),
    .sel(dir),
    .q(nextHeadYPos)
);

    // Adders and Subtractors for ALU
twentyBitAdder addUp
(
    .A(curHeadYPos),
    .B(20'b00000000000000000001), // y+1
    .S(upWire)
);

twentyBitSubtractor subDown
(
    .A(curHeadYPos),
    .B(20'b00000000000000000001), // y-1
    .D(downWire)
);

twentyBitSubtractor subLeft
(
    .A(curHeadXPos),
    .B(20'b00000000000000000001), // x-1
    .D(leftWire)
);

twentyBitAdder addRight
(
    .A(curHeadXPos),
    .B(20'b00000000000000000001), // x+1
    .S(rightWire)
);

// Assign previous x and y values to current part of body
buf curX(curBodyXPos, prevXPos);
buf curY(curBodyYPos, prevYPos);

wire [19:0] xWire, yWire;

// Create a 20-bit 2:1 mux for ALU
busMux #(20) muxHeadX
(
    .i0(curBodyXPos), // If currently moving the body, output x body val
    .i1(curHeadXPos), // Otherwise output x head val
    .sel(headChkWire),
    .data_out(xWire)
);

busMux #(20) muxHeadY
(
    .i0(curBodyXPos),
    .i1(curHeadYPos),
    .sel(headChkWire),
    .data_out(yWire)
);

// Store the current x and y values into a register
register #(20) prevX
(
    .clk(clock),
    .load(1'b1),
    .d(xWire),
    .q(prevXPos)
);

register #(20) prevY
(
    .clk(clock),
    .load(1'b1),
    .d(yWire),
    .q(prevYPos)
);

buf bufx(X, xWire);
buf bufy(Y, yWire);

endmodule
module main
(
    input Up, Down, Left, Right, clock,
    output VS, HS,
    output [3:0] Red, Green, Blue
);

wire U, D, L, R, noMove;

snakeMoveState moveState
(
    .Up(Up),
    .Down(Down),
    .Left(Left),
    .Right(Right),
    .clock(clock),
    .U(U),
    .D(D),
    .L(L),
    .R(R),
    .noMove(noMove)
);

wire gameOver;
wire [19:0] X, Y;

snakeMoveLogic moveLogic
(
    .Up(U),
    .Down(D),
    .Left(L),
    .Right(R),
    .clock(clock),
    .wallsOn(1'b1), // Temp
    .bitNum(20'b00000000000000000000), // Temp
    .gameOver(gameOver),
    .X(X),
    .Y(Y),
    .headX(),
    .headY()
);

wire hCount, vCount;

VGA vga
(
    .clk(clock),
    .HS(HS),
    .VS(VS),
    .hCount(hCount),
    .vCount(vCount)
);

wire xOut, yOut;

twentyBitComparitor vgaX
(
    .A(hCount),
    .B(X),
    .F(xOut)
);

twentyBitComparitor vgaY
(
    .A(vCount),
    .B(Y),
    .F(yOut)
);

wire draw;

and and2(draw, xOut, yOut);
assign Red = draw;
assign Green = draw;
assign Blue = draw;

endmodule
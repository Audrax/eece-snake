module snakeMovement
(
    input bUp, dDown, bLeft, bRight,
    input clock,
    output up, down, left, right
);

PushButton_Debouncer upDeb
(
    .PB(bUp),
    .clk(clock),
    .PB_up(up)
);

PushButton_Debouncer downDeb
(
    .PB(bDown),
    .clk(clock),
    .PB_up(down)
);

PushButton_Debouncer leftDeb
(
    .PB(bLeft),
    .clk(clock),
    .PB_up(left)
);

PushButton_Debouncer rightDeb
(
    .PB(bRight),
    .clk(clock),
    .PB_up(right)
);

endmodule

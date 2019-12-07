module snakeMoveState
(
    input Up, Down, Left, Right, clock,
    output U, D, L, R
);

wire debU, debD, debL, debR;

// Debouncers for buttons
PushButton_Debouncer deb1
(
    .clk(clock),
    .PB(Up),
    .PB_down(),
    .PB_up(debU)
);

PushButton_Debouncer deb2
(
    .clk(clock),
    .PB(Down),
    .PB_down(),
    .PB_up(debD)
);

PushButton_Debouncer deb3
(
    .clk(clock),
    .PB(Left),
    .PB_down(),
    .PB_up(debL)
);

PushButton_Debouncer deb4
(
    .clk(clock),
    .PB(Right),
    .PB_down(),
    .PB_up(debR)
);


dff_en dff1
(
    .in_D(),
    .in_CLK(clock),
    .in_EN(),
    .data_out()
);

endmodule

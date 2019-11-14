module counter
(
    input [4:0] max,
    input en,
    input clock,
    output [4:0] count
);

// Logical Comparitor for Max

wire opcode;
wire [4:0]xnorwire;

wire [4:0] muxout;
wire [4:0] addout;
wire [4:0] dffwire;

xnor xnor1(xnorwire[0], max[0], addout[0]);
xnor xnor2(xnorwire[1], max[1], addout[1]);
xnor xnor3(xnorwire[2], max[2], addout[2]);
xnor xnor4(xnorwire[3], max[3], addout[3]);
xnor xnor5(xnorwire[4], max[4], addout[4]);
nand and1(opcode, xnorwire[0], xnorwire[1], xnorwire[2], xnorwire[3], xnorwire[4]);

// Mux for ALU
mux #(2,1) mux1
(
    .data_out(muxout[0]),
    .select_in({opcode}),
    .data_in({dffwire[0],1'b0})
);

mux #(2,1) mux2
(
    .data_out(muxout[1]),
    .select_in({opcode}),
    .data_in({dffwire[1],1'b0})
);

mux #(2,1) mux3
(
    .data_out(muxout[2]),
    .select_in({opcode}),
    .data_in({dffwire[2],1'b0})
);

mux #(2,1) mux4
(
    .data_out(muxout[3]),
    .select_in({opcode}),
    .data_in({dffwire[3],1'b0})
);

mux #(2,1) mux5
(
    .data_out(muxout[4]),
    .select_in({opcode}),
    .data_in({dffwire[4],1'b0})
);

//Flip-Flops for Enable

dff_en dff1
(
    .data_out(dffwire[0]),
    .in_D(addout[0]),
    .in_CLK(clock),
    .in_EN(en)
);

dff_en dff2
(
    .data_out(dffwire[1]),
    .in_D(addout[1]),
    .in_CLK(clock),
    .in_EN(en)
);

dff_en dff3
(
    .data_out(dffwire[2]),
    .in_D(addout[2]),
    .in_CLK(clock),
    .in_EN(en)
);

dff_en dff4
(
    .data_out(dffwire[3]),
    .in_D(addout[3]),
    .in_CLK(clock),
    .in_EN(en)
);

dff_en dff5
(
    .data_out(dffwire[4]),
    .in_D(addout[4]),
    .in_CLK(clock),
    .in_EN(en)
);

// Logical 5-Bit Adder

fiveBitAdder add1
(
    .A(01'b1),
    .B(muxout),
    .S(addout)
);

assign count = muxout;

endmodule

module counter
(
    input [9:0] max,
    input en_debounce,
    input clock,
    output [9:0] count
);

// Debouncer
PushButton_Debouncer PushButton_Debouncer1
(
    .clk(clock),
    .PB(en_debounce),
    .PB_up(en)
);

// Logical Comparitor for Max

wire opcode;

wire [9:0] muxout;
wire [9:0] addout;
wire [9:0] dffwire;

tenBitComparitor comparitor1
(
    .A(max),
    .B(dffwire),
    .F(opcode)
);

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

mux #(2,1) mux6
(
    .data_out(muxout[5]),
    .select_in({opcode}),
    .data_in({dffwire[5],1'b0})
);

mux #(2,1) mux7
(
    .data_out(muxout[6]),
    .select_in({opcode}),
    .data_in({dffwire[6],1'b0})
);

mux #(2,1) mux8
(
    .data_out(muxout[7]),
    .select_in({opcode}),
    .data_in({dffwire[7],1'b0})
);

mux #(2,1) mux9
(
    .data_out(muxout[8]),
    .select_in({opcode}),
    .data_in({dffwire[8],1'b0})
);

mux #(2,1) mux10
(
    .data_out(muxout[9]),
    .select_in({opcode}),
    .data_in({dffwire[9],1'b0})
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

dff_en dff6
(
    .data_out(dffwire[5]),
    .in_D(addout[5]),
    .in_CLK(clock),
    .in_EN(en)
);

dff_en dff7
(
    .data_out(dffwire[6]),
    .in_D(addout[6]),
    .in_CLK(clock),
    .in_EN(en)
);

dff_en dff8
(
    .data_out(dffwire[7]),
    .in_D(addout[7]),
    .in_CLK(clock),
    .in_EN(en)
);

dff_en dff9
(
    .data_out(dffwire[8]),
    .in_D(addout[8]),
    .in_CLK(clock),
    .in_EN(en)
);

dff_en dff10
(
    .data_out(dffwire[9]),
    .in_D(addout[9]),
    .in_CLK(clock),
    .in_EN(en)
);

// Logical 10-Bit Adder

tenBitAdder add1
(
    .A(01'b1),
    .B(muxout),
    .S(addout)
);

assign count = muxout;

endmodule

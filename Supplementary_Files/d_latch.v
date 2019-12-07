

module d_latch
(
    input in_D, in_G,
    output reg data_out
);
 always @ (*)
if(in_G)
    data_out<=in_D;
endmodule


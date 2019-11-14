module FULLADDER(A, B, Ci, Co, SUM)
{
    input A,
    input B,
    input Cin,
    output Co,
    output SUM
}

wire xorwire, andwire, andwire2;
xor xor1(xorwire, A, B);
xor xor2(SUM, xorwire, Ci);

and and1(andwire, xorwire, Ci);
and and2(andwire2, A, B);
or or1(Co, andwire, andwire2);

endmodule

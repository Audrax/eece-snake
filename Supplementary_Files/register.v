`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Component: parallel load register
// Author: Gabriel Dubinsky
//
// Description: loads d on clk rising edge and outputs continuously to q
//              only loads new q if load=1 during rising edge
//
// Usage: To use this component, copy it into the location of the other sources in
//        your project. Add the source to your project using the same menu you use
//        to create new sources. Refer to the instructions on the WatsonWiki
//        Verilog component library download page for instructions on how to
//        modify the data size accepted by the component.
//////////////////////////////////////////////////////////////////////////////////

module register
    #(parameter DataSize = 2)
    (
    clk,
    load,
    d,
    q
    );

    //parameter DataSize = 2; // ** Set this to required data size **

    input clk,load;
    input  [DataSize-1:0] d;
    output [DataSize-1:0] q;

    reg [DataSize-1:0] q = {DataSize{1'b0}};

    always @ (posedge clk)
        if (load) begin
            q <= d;
        end

endmodule
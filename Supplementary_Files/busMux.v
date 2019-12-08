`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Component: 2 to 1 Multiplexer
// Author: Nicole Santoro
//
// Description: output q = i0 if sel == 0, else q = i1
//
// Usage: To use this component, copy it into the location of the other sources in
//        your project. Add the source to your project using the same menu you use
//        to create new sources. Refer to the instructions on the WatsonWiki
//        Verilog component library download page for instructions on how to
//        modify the data size accepted by the component.
//////////////////////////////////////////////////////////////////////////////////


module busMux
    #(parameter DataSize = 2) //Set this to required data size
    (
    i0, i1,
    sel,
    q
    );
    
    input[DataSize-1:0] i0, i1;
    input sel;
    
    output[DataSize-1:0] q;
    
    assign q = sel ? i1 : i0; // if sel == 1 q = i1, else q = i0
    
endmodule
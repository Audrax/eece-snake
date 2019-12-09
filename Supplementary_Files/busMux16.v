`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Component: 16 to 1 Multiplexer
// Author: Nicole Santoro
//
// Description: output q = i0 if sel == 0000, q = i1 if sel == 0001, q = i2 if sel == 0010, q = i3 if sel == 0011, 
//                     q = i4 if sel == 0100, q = i5 if sel == 0101, q = i6 if sel == 0110, q = i7 if sel == 0111,
//                     q = i8 if sel == 1000, q = i9 if sel == 1001, q = i10 if sel == 1010, q = i11 if sel == 1011, 
//                     q = i12 if sel == 1100, q = i13 if sel == 1101, q = i14 if sel == 110, else q = i15
//
// Usage: To use this component, copy it into the location of the other sources in
//        your project. Add the source to your project using the same menu you use
//        to create new sources. Refer to the instructions on the WatsonWiki
//        Verilog component library download page for instructions on how to
//        modify the data size accepted by the component.
//////////////////////////////////////////////////////////////////////////////////


module busMux16
    #(parameter DataSize = 2) //Set this to required data size
    (
    i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15,
    sel,
    q
    );
    
    input[DataSize-1:0] i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15;
    input[3:0] sel;
    
    output[DataSize-1:0] q;
    
    assign q =  (sel == 4'b0000) ? i0:
                (sel == 4'b0001) ? i1:
                (sel == 4'b0010) ? i2:
                (sel == 4'b0011) ? i3:
                (sel == 4'b0100) ? i4:
                (sel == 4'b0101) ? i5:
                (sel == 4'b0110) ? i6:
                (sel == 4'b0111) ? i7:
                (sel == 4'b1000) ? i8:
                (sel == 4'b1001) ? i9:
                (sel == 4'b1010) ? i10:
                (sel == 4'b1011) ? i11:
                (sel == 4'b1100) ? i12:
                (sel == 4'b1101) ? i13:
                (sel == 4'b1110) ? i14:
                                   i15;
                
endmodule

module Coordinate_Creation

(

    input clk,
    output coordinate
    
 );
 


 //Genearting X location of apple 
 LinearFeedBackShiftReg Location
 (
    .locationX(clk),
    .locationX1(coordinate)
  );
  
endmodule
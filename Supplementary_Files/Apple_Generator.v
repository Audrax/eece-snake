
module Apple_Generator

(
    output APH,
    output APV,
    output is_Eaten,
    output [3:00] R,
    input headX,
    input headY,
    input bodyX,
    input bodyY,
    input clk
    
 );
 
 wire opcode_LFBSGX, opcode_LFBSGY ,opcode_ComparitorX, opcode_ComparitorY, opcode_Comparitor;
 
 //Genearting X location of apple 
 LinearFeedBackShiftReg AppleX
 (
    .locationX(clk),
    .locationX1(opcode_LFBSGX)
  );
  
  //Generating Y location of apple
  LinearFeedBackShiftReg AppleY
 (
    .locationY(clk),
    .locationY1(opcode_LFBSGY)
  );
 
//Comparing X body locations
 twentyBitComparitor XBodyComp
(
    .A(opcode_LFBSGX),
    .B(bodyX),
    .F(opcode_ComparitorX)
);
//Comparing Y body locations
 twentyBitComparitor YBodyComp
(
    .A(opcode_LFBSGY),
    .B(bodyX),
    .F(opcode_ComparitorY)
);

nand nand1(opcode_Comparitor, opcode_ComparitorX,opcode_ComparitorY);


 
 //Mux for ALU
 
 mux #(2,1) bodyPositionX
 (
    .select_in(),
    .data_in({opcode_LFBSGX,bodyX}),
    .data_out()
 );
  mux # (2,1) mux2
 (
    .select_in(),
    .data_in(),
    .data_out()
 );
   mux # (2,1) mux3
 (
    .select_in(),
    .data_in(),
    .data_out()
 );
 
 mux # (2,1) mux4
 (
    .select_in(),
    .data_in(),
    .data_out()
 );

  

   
endmodule

 


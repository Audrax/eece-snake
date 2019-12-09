module Apple_Generator

(
    output APH,
    output APV,
    output is_Eaten,
    output [3:00] R,
    input [19:0] X, Y, headX, headY,
    input clk
    
 );
 
 wire Apple_Eaten_check, X_Location, Y_Location, Final_X_Location,Final_Y_Location, is_AppleEatenx,is_AppleEateny, is_outOfRangeX1, is_outOfRangeY1  ;
 wire is_outOfRange, is_BodyonAppleX, is_BodyonAppleY, body_Check, Generate_Location,is_outOfRangeY2,is_outOfRangeX2;
 
 
 //Creating Random location using LSBR
 
 Coordinate_Creation Xlocation
 (
    .locationX(clk),
    .locationX1(X_Location)
 );   

 Coordinate_Creation Ylocation
 (
    .locationY(clk),
    .locationY1(Y_Location)
 );   


//Checking if snake ate apple
twentyBitComparitor ComparingHeadLocationX
(
    .A(headX),
    .B(X_Location),
    .F(is_AppleEatenx)
);

twentyBitComparitor ComparingHeadLocationY
(
    .A(headY),
    .B(Y_Location),
    .F(is_AppleEateny)
);


and and1(is_Eaten,is_AppleEatenx,is_AppleEatenx);

//Checking if apple falls out of range
twentyBitComparitor X_RangeCheck1
(
    .A(X_Location),
    .B(20'b00000000001100010001), //bp+pw+dp+1
    .F(is_outOfRangeX1)
);
twentyBitComparitor X_RangeCheck2
(
    .A(X_Location),
    .B(20'b00000000000010001111),//bp+pw-1
    .F(is_outOfRangeX2)
);


twentyBitComparitor Y_RangeCheck1//bp+pw-1
(
    .A(Y),
    .B(20'b00000000000010001111),
    .F(is_outOfRangeY1)
);

twentyBitComparitor Y_RangeCheck2//bp+pw+dp+1
(
    .A(Y),
    .B(20'b01100011110011100001),
    .F(is_outOfRangeY2)
);

or or1(is_outOfRange,is_outOfRangeX1,is_outOfRangeY1,is_outOfRangeX2,is_outOfRangeY2);

// Body check
twentyBitComparitor ComparingBodyLocationX
(
    .A(X),
    .B(X_Location),
    .F(is_BodyonAppleX)
);

twentyBitComparitor ComparingBodyLocationY
(
    .A(Y),
    .B(Y_Location),
    .F(is_BodyonAppleY)
);

and and3(body_Check,is_BodyonAppleX,is_BodyonAppleY);

//if it proceeds all the checks, create location;
and and4(Generate_Location, body_Check,is_outOfRange, is_Eaten);

busMux #(20) muxRangeCheck
(
    .i0(is_OutofRange), // If currently moving the body, output x body val
    .i1(is_), // Otherwise output x head val
    .sel(headChkWire),
    .q(xWire)
);

   
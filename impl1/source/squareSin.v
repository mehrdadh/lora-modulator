///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: squareSin.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//  Produces a square wave based on the sin or cos function
//  and factors out pi for ease of implementation.
//
//  For sin: returns 1 if (0 < angle < 1), and 0 else.
//  For cos: returns 0 if (1/2 < angle < 3/2), and 1 else.
//
// Author: <Mehrdad Hessar>
/////////////////////////////////////////////////////////////////////////////////////////////////// 
`include "LoRaTXDefines.v"
`include "RadioDefines.v"

module squareSin(
input       [`PRECISION-1:0]    angle,
output reg  [`QLength-1:0]      sinOut
);

always @(*) begin
    ////constant values for debugging
    //if (angle <`SCALE_2Q)
        //sinOut = `QLength'b11000000000011;
    //else if (angle < `SCALE_2Q)
        //sinOut = `QLength'b00111111111100;

    if (angle < 1*`SCALE_HQ)
        sinOut = `QLength'b11100111100001;
    else if (angle < 3*`SCALE_HQ)
        sinOut = `QLength'd1567;
    else if (angle < 7*`SCALE_HQ)
        sinOut = `QLength'd3784;
    else if (angle < 9*`SCALE_HQ)
        sinOut = `QLength'd1567;
    else if (angle < 11*`SCALE_HQ)
        sinOut = `QLength'b11100111100001;
    else if (angle < 15*`SCALE_HQ)
        sinOut = `QLength'b11000100111000;
    else
        sinOut = `QLength'b11100111100001;
end

endmodule
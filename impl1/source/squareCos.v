///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: squareCos.v
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

module squareCos(
input       [`PRECISION-1:0]    angle,
output reg  [`ILength-1:0]      cosOut
);


always @(angle) begin
    ////constant values for debugging
    //if (angle <`SCALE_2Q)
        //cosOut = `ILength'b00111111111100;
    //else if (angle < `SCALE_2Q)
        //cosOut = `ILength'b11000000000011;

    if (angle < 3*`SCALE_HQ)
        cosOut = `ILength'd3784;
    else if (angle < 5*`SCALE_HQ)
        cosOut = `ILength'd1567;
    else if (angle < 7*`SCALE_HQ)
        cosOut = `ILength'b11100111100001;
    else if (angle < 11*`SCALE_HQ)
        cosOut = `ILength'b11000100111000;
    else if (angle < 13*`SCALE_HQ)
        cosOut = `ILength'b11100111100001;
    else if (angle < 15*`SCALE_HQ)
        cosOut = `ILength'd1567;
    else
        cosOut = `ILength'd3784;
end

endmodule

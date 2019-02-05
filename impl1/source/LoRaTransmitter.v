//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Feb  3 18:57:04 2019
// Version: v12.0 12.500.0.22
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// LoRaTransmitter
module LoRaTransmitter(
    // Inputs
    POR_N,
    clk_in,
	pll_clko,
    // Outputs
    //I,
    //Q,
    serial_clk,
    clk_4M,
    countDone,
    serial,
	IQSerializer_0_serial_N
    // Inouts
    /*TXCLK_N,
    TXCLK_P,
    TXD_N,
    TXD_P
	*/
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
//input         LOCK;
input         POR_N;
input         clk_in;
output	wire  pll_clko;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------

output        serial_clk;
output        clk_4M;
output        countDone;
output        serial;
output 	      IQSerializer_0_serial_N;
//output		  clkOut_2;

//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
/*inout         TXCLK_N;
inout         TXCLK_P;
inout         TXD_N;
inout         TXD_P;
*/
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire 	pll_sel;
wire	[13:0] I;
wire 	[13:0] Q;
wire          AND2_0_Y;
wire          clk_4M_net_0;
//wire          clk_50M;//wire          pll_clko;
wire          serial_clk;
wire          clockDivider_0_clkLock;
wire          countDone_net_0;
wire          POR_N;
wire          pll_lock;
wire   [13:0] I_net_0;
wire          IQSerializer_0_serial_N;
wire          loraModulator_0_IQStart;
wire          loraModulator_0_symDone;
wire   [2:0]  loraPacketGenerator_0_BW_select;
wire          loraPacketGenerator_0_chirpReset;
wire   [2:0]  loraPacketGenerator_0_SF_select;
wire   [1:0]  loraPacketGenerator_0_symType;
wire   [11:0] loraPacketGenerator_0_symVal;
wire   [13:0] Q_net_0;
wire          serial_net_0;
//wire          SYSRESET_0_POWER_ON_RESET_N;
/*wire          TXCLK_N;
wire          TXCLK_P;
wire          TXD_N;
wire          TXD_P;*/
//wire          clkOut_2_net_0;
wire          serial_net_1;
wire          clk_4M_net_1;
wire          countDone_net_1;
wire   [13:0] I_net_1;
wire   [13:0] Q_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire          GND_net;
wire   [7:2]  PADDR_const_net_0;
wire   [7:0]  PWDATA_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net            = 1'b1;
assign GND_net            = 1'b0;
assign PADDR_const_net_0  = 6'h00;
assign PWDATA_const_net_0 = 8'h00;
assign pll_sel = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
//assign clkOut_2_net_0  = clkOut_2;
//assign clkOut          = clkOut_2_net_0;
assign serial_net_1    = serial_net_0;
assign serial          = serial_net_1;
assign clk_4M_net_1    = clk_4M_net_0;
assign clk_4M          = clk_4M_net_1;
assign countDone_net_1 = countDone_net_0;
assign countDone       = countDone_net_1;
assign I_net_1         = I_net_0;
assign I[13:0]         = I_net_1;
assign Q_net_1         = Q_net_0;
assign Q[13:0]         = Q_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
assign AND2_0_Y = pll_lock & POR_N;
/*
AND2 AND2_0(
        // Inputs
        .A ( FCCC_0_LOCK ),
        .B ( SYSRESET_0_POWER_ON_RESET_N ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );
*/
//--------clockDivider
clockDivider #( 
        .Freq ( 4 ) )
clockDivider_0(
        // Inputs
        .clk      ( pll_clko ),
        .pll_lock ( AND2_0_Y ),
        // Outputs
        .clkOut   ( clk_4M_net_0 ),
        .clkLock  ( clockDivider_0_clkLock ) 
        );

//--------counter
counter counter_0(
        // Inputs
        .clk       ( clk_4M_net_0 ),
        .clkLock   ( clockDivider_0_clkLock ),
        // Outputs
        .countDone ( countDone_net_0 ) 
        );

//--------LoRaTransmitter_FCCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
/*LoRaTransmitter_FCCC_0_FCCC FCCC_0(
        // Inputs
        .CLK0_PAD ( clk_50M ),
        // Outputs
        .Y0       ( pll_clko ),
        .LOCK     ( FCCC_0_LOCK ) 
        );
*/
//--------IQSerializer
IQSerializer #( 
        .IDATA ( 3 ),
        .Init0 ( 0 ),
        .Init1 ( 1 ),
        .ISYNC ( 2 ),
        .QDATA ( 5 ),
        .QSYNC ( 4 ),
        .VCC   ( 1 ),
        .VSS   ( 0 ) )
IQSerializer_0(
        // Inputs
        .clk        ( pll_clko ),
        .start      ( loraModulator_0_IQStart ),
        .I          ( I_net_0 ),
        .Q          ( Q_net_0 ),
        // Outputs
        .serial_N   ( IQSerializer_0_serial_N ),
        .serial     ( serial_net_0 ),
        .serial_clk ( serial_clk ) 
        );

//--------loraModulator
loraModulator loraModulator_0(
        // Inputs
        .clk       ( clk_4M_net_0 ),
        .rst       ( loraPacketGenerator_0_chirpReset ),
        .symVal    ( loraPacketGenerator_0_symVal ),
        .symType   ( loraPacketGenerator_0_symType ),
        .SF_select ( loraPacketGenerator_0_SF_select ),
        .BW_select ( loraPacketGenerator_0_BW_select ),
        // Outputs
        .IQStart   ( loraModulator_0_IQStart ),
        .symDone   ( loraModulator_0_symDone ),
        .I         ( I_net_0 ),
        .Q         ( Q_net_0 ) 
        );

//--------loraPacketGenerator
loraPacketGenerator #( 
        .STATE_CONST0      ( 8 ),
        .STATE_CONST1      ( 9 ),
        .STATE_DONE        ( 7 ),
        .STATE_DOWNCHIRP_0 ( 3 ),
        .STATE_DOWNCHIRP_1 ( 4 ),
        .STATE_PAYLOAD     ( 6 ),
        .STATE_PREAMBLE    ( 0 ),
        .STATE_QDOWNCHIRP  ( 5 ),
        .STATE_SYNC_0      ( 1 ),
        .STATE_SYNC_1      ( 2 ),
        .VCC               ( 1 ),
        .VSS               ( 0 ) )
loraPacketGenerator_0(
        // Inputs
        .clk        ( clk_4M_net_0 ),
        .clkLock    ( clockDivider_0_clkLock ),
        .rst        ( countDone_net_0 ),
        .symDone    ( loraModulator_0_symDone ),
        // Outputs
        .chirpReset ( loraPacketGenerator_0_chirpReset ),
        .SF_select  ( loraPacketGenerator_0_SF_select ),
        .BW_select  ( loraPacketGenerator_0_BW_select ),
        .symVal     ( loraPacketGenerator_0_symVal ),
        .symType    ( loraPacketGenerator_0_symType ) 
        );

/*
//--------SYSRESET
SYSRESET SYSRESET_0(
        // Inputs
        .DEVRST_N         ( DEVRST_N ),
        // Outputs
        .POWER_ON_RESET_N ( SYSRESET_0_POWER_ON_RESET_N ) 
        );

//--------BIBUF_DIFF
BIBUF_DIFF TXCLK(
        // Inputs
        .D    ( clkOut_2 ),
        .E    ( VCC_net ),
        // Outputs
        .Y    (  ),
        // Inouts
        .PADP ( TXCLK_P ),
        .PADN ( TXCLK_N ) 
        );

//--------BIBUF_DIFF
BIBUF_DIFF TXD(
        // Inputs
        .D    ( IQSerializer_0_serial_N ),
        .E    ( VCC_net ),
        // Outputs
        .Y    (  ),
        // Inouts
        .PADP ( TXD_P ),
        .PADN ( TXD_N ) 
        );
*/

my_pll_64mhz my_pll_instance (
		// Inputs
		.SEL(pll_sel),
		.CLKI (pll_clki), 
		.CLKI2 (clk_in), 
		// Outputs
		.CLKOP (pll_clko),
		.LOCK (pll_lock)
		);
		
endmodule

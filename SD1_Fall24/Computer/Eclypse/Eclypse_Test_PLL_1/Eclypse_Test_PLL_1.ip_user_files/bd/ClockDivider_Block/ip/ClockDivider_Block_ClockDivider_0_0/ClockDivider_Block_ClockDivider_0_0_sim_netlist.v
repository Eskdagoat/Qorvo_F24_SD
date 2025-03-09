// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Sat Jan 25 23:22:04 2025
// Host        : AB-Beast running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/SD1_Fall24/Computer/Eclypse/Eclypse_Test_PLL_1/Eclypse_Test_PLL_1.gen/sources_1/bd/ClockDivider_Block/ip/ClockDivider_Block_ClockDivider_0_0/ClockDivider_Block_ClockDivider_0_0_sim_netlist.v
// Design      : ClockDivider_Block_ClockDivider_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ClockDivider_Block_ClockDivider_0_0,ClockDivider,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "ClockDivider,Vivado 2024.2.1" *) 
(* NotValidForBitStream *)
module ClockDivider_Block_ClockDivider_0_0
   (CLK_IN,
    CLK_OUT);
  input CLK_IN;
  output CLK_OUT;

  wire CLK_IN;
  wire CLK_OUT;

  ClockDivider_Block_ClockDivider_0_0_ClockDivider inst
       (.CLK_IN(CLK_IN),
        .CLK_OUT(CLK_OUT));
endmodule

(* ORIG_REF_NAME = "ClockDivider" *) 
module ClockDivider_Block_ClockDivider_0_0_ClockDivider
   (CLK_OUT,
    CLK_IN);
  output CLK_OUT;
  input CLK_IN;

  wire CLK_IN;
  wire CLK_OUT;
  wire counter;
  wire p_0_in;

  LUT1 #(
    .INIT(2'h1)) 
    CLK_OUT_i_1
       (.I0(counter),
        .O(p_0_in));
  FDRE CLK_OUT_reg
       (.C(CLK_IN),
        .CE(1'b1),
        .D(p_0_in),
        .Q(CLK_OUT),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(CLK_IN),
        .CE(1'b1),
        .D(p_0_in),
        .Q(counter),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Sun Nov 17 23:12:18 2024
//Host        : AB-Beast running 64-bit major release  (build 9200)
//Command     : generate_target MainDesign.bd
//Design      : MainDesign
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "MainDesign,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=MainDesign,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "MainDesign.hwdef" *) 
module MainDesign
   (CLK_IN,
    LD1,
    LD2,
    LD3,
    PMODa0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN, CLK_DOMAIN MainDesign_CLK_IN, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input CLK_IN;
  output LD1;
  output LD2;
  output LD3;
  output PMODa0;

  wire CLK_IN_1;
  wire ClockDivider_1_CLK_OUT;
  wire ClockDivider_2_CLK_OUT;
  wire ClockDivider_3_CLK_OUT;
  wire ClockDivider_4_CLK_OUT;

  assign CLK_IN_1 = CLK_IN;
  assign LD1 = ClockDivider_1_CLK_OUT;
  assign LD2 = ClockDivider_2_CLK_OUT;
  assign LD3 = ClockDivider_3_CLK_OUT;
  assign PMODa0 = ClockDivider_4_CLK_OUT;
  MainDesign_ClockDivider_1_0 ClockDivider_1
       (.CLK_IN(CLK_IN_1),
        .CLK_OUT(ClockDivider_1_CLK_OUT));
  MainDesign_ClockDivider_2_0 ClockDivider_2
       (.CLK_IN(CLK_IN_1),
        .CLK_OUT(ClockDivider_2_CLK_OUT));
  MainDesign_ClockDivider_3_0 ClockDivider_3
       (.CLK_IN(CLK_IN_1),
        .CLK_OUT(ClockDivider_3_CLK_OUT));
  MainDesign_ClockDivider_4_0 ClockDivider_4
       (.CLK_IN(CLK_IN_1),
        .CLK_OUT(ClockDivider_4_CLK_OUT));
endmodule

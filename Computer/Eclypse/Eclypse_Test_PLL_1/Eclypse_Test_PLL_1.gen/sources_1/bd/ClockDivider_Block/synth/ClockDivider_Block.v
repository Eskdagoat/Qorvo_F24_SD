//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Wed Nov 20 23:23:51 2024
//Host        : AB-Beast running 64-bit major release  (build 9200)
//Command     : generate_target ClockDivider_Block.bd
//Design      : ClockDivider_Block
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ClockDivider_Block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ClockDivider_Block,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "ClockDivider_Block.hwdef" *) 
module ClockDivider_Block
   (CLK_IN,
    PMODa0);
  input CLK_IN;
  output PMODa0;

  wire CLK_IN_1;
  wire ClockDivider_0_CLK_OUT;

  assign CLK_IN_1 = CLK_IN;
  assign PMODa0 = ClockDivider_0_CLK_OUT;
  ClockDivider_Block_ClockDivider_0_0 ClockDivider_0
       (.CLK_IN(CLK_IN_1),
        .CLK_OUT(ClockDivider_0_CLK_OUT));
endmodule
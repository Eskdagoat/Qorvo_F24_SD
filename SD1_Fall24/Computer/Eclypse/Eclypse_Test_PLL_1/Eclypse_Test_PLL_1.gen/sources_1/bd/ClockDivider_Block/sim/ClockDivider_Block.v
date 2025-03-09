//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
//Date        : Mon Feb 10 13:52:29 2025
//Host        : AB-Lenovo5 running 64-bit major release  (build 9200)
//Command     : generate_target ClockDivider_Block.bd
//Design      : ClockDivider_Block
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ClockDivider_Block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ClockDivider_Block,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "ClockDivider_Block.hwdef" *) 
module ClockDivider_Block
   (CLK_IN,
    pmod_a_2,
    pmod_a_3,
    pmod_a_6,
    pmod_a_7,
    syzygy_a_p2c_clk_p);
  input CLK_IN;
  output pmod_a_2;
  output pmod_a_3;
  output pmod_a_6;
  output pmod_a_7;
  input syzygy_a_p2c_clk_p;

  wire CLK_IN;
  wire pmod_a_2;
  wire pmod_a_3;
  wire pmod_a_6;
  wire pmod_a_7;
  wire syzygy_a_p2c_clk_p;

  ClockDivider_Block_ClockDivider_0_0 ClockDivider_0
       (.CLK_IN(CLK_IN),
        .CLK_OUT(pmod_a_7));
  ClockDivider_Block_ClockDivider_0_1 ClockDivider_1
       (.CLK_IN(syzygy_a_p2c_clk_p),
        .CLK_OUT(pmod_a_6));
  ClockDivider_Block_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(syzygy_a_p2c_clk_p),
        .clk_out1(pmod_a_3),
        .clk_out2(pmod_a_2));
endmodule

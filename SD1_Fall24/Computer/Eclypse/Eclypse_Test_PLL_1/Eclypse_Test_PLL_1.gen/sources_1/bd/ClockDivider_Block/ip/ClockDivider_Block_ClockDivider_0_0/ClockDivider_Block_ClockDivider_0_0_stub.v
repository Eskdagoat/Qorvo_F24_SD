// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
// Date        : Sat Jan 25 23:22:04 2025
// Host        : AB-Beast running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/SD1_Fall24/Computer/Eclypse/Eclypse_Test_PLL_1/Eclypse_Test_PLL_1.gen/sources_1/bd/ClockDivider_Block/ip/ClockDivider_Block_ClockDivider_0_0/ClockDivider_Block_ClockDivider_0_0_stub.v
// Design      : ClockDivider_Block_ClockDivider_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "ClockDivider_Block_ClockDivider_0_0,ClockDivider,{}" *) (* CORE_GENERATION_INFO = "ClockDivider_Block_ClockDivider_0_0,ClockDivider,{x_ipProduct=Vivado 2024.2.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ClockDivider,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,DIVISOR=0X000000C}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "ClockDivider,Vivado 2024.2.1" *) 
module ClockDivider_Block_ClockDivider_0_0(CLK_IN, CLK_OUT)
/* synthesis syn_black_box black_box_pad_pin="CLK_OUT" */
/* synthesis syn_force_seq_prim="CLK_IN" */;
  input CLK_IN /* synthesis syn_isclock = 1 */;
  output CLK_OUT;
endmodule

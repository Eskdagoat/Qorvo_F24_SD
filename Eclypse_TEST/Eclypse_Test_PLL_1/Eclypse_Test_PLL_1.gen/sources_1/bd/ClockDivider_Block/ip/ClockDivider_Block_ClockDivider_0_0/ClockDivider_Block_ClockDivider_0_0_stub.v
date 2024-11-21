// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Nov 20 23:24:35 2024
// Host        : AB-Beast running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/Eclypse_TEST/Eclypse_Test_PLL_1/Eclypse_Test_PLL_1.gen/sources_1/bd/ClockDivider_Block/ip/ClockDivider_Block_ClockDivider_0_0/ClockDivider_Block_ClockDivider_0_0_stub.v
// Design      : ClockDivider_Block_ClockDivider_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ClockDivider,Vivado 2024.1" *)
module ClockDivider_Block_ClockDivider_0_0(CLK_IN, CLK_OUT)
/* synthesis syn_black_box black_box_pad_pin="CLK_OUT" */
/* synthesis syn_force_seq_prim="CLK_IN" */;
  input CLK_IN /* synthesis syn_isclock = 1 */;
  output CLK_OUT;
endmodule

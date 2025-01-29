//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
//Date        : Sat Jan 25 23:21:18 2025
//Host        : AB-Beast running 64-bit major release  (build 9200)
//Command     : generate_target ClockDivider_Block_wrapper.bd
//Design      : ClockDivider_Block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ClockDivider_Block_wrapper
   (CLK_IN,
    PMODa0);
  input CLK_IN;
  output PMODa0;

  wire CLK_IN;
  wire PMODa0;

  ClockDivider_Block ClockDivider_Block_i
       (.CLK_IN(CLK_IN),
        .PMODa0(PMODa0));
endmodule

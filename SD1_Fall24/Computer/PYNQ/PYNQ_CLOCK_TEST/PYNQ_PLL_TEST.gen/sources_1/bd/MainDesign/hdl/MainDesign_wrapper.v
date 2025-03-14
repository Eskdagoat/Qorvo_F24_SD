//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Sun Nov 17 23:49:24 2024
//Host        : AB-Beast running 64-bit major release  (build 9200)
//Command     : generate_target MainDesign_wrapper.bd
//Design      : MainDesign_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module MainDesign_wrapper
   (CLK_IN,
    PMODa0);
  input CLK_IN;
  output PMODa0;

  wire CLK_IN;
  wire PMODa0;

  MainDesign MainDesign_i
       (.CLK_IN(CLK_IN),
        .PMODa0(PMODa0));
endmodule

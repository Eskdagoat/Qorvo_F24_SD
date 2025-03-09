//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
//Date        : Mon Feb 10 13:52:29 2025
//Host        : AB-Lenovo5 running 64-bit major release  (build 9200)
//Command     : generate_target ClockDivider_Block_wrapper.bd
//Design      : ClockDivider_Block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ClockDivider_Block_wrapper
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

  ClockDivider_Block ClockDivider_Block_i
       (.CLK_IN(CLK_IN),
        .pmod_a_2(pmod_a_2),
        .pmod_a_3(pmod_a_3),
        .pmod_a_6(pmod_a_6),
        .pmod_a_7(pmod_a_7),
        .syzygy_a_p2c_clk_p(syzygy_a_p2c_clk_p));
endmodule

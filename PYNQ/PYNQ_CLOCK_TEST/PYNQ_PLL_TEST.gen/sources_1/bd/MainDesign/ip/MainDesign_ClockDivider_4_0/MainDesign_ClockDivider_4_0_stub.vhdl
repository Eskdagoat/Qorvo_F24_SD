-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Nov 17 22:05:24 2024
-- Host        : AB-Beast running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/PYNQ/PYNQ_PLL_TEST/PYNQ_PLL_TEST.gen/sources_1/bd/MainDesign/ip/MainDesign_ClockDivider_4_0/MainDesign_ClockDivider_4_0_stub.vhdl
-- Design      : MainDesign_ClockDivider_4_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_ClockDivider_4_0 is
  Port ( 
    CLK_IN : in STD_LOGIC;
    CLK_OUT : out STD_LOGIC
  );

end MainDesign_ClockDivider_4_0;

architecture stub of MainDesign_ClockDivider_4_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK_IN,CLK_OUT";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ClockDivider,Vivado 2024.1";
begin
end;

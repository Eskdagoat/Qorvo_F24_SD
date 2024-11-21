-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Wed Nov 20 23:24:35 2024
-- Host        : AB-Beast running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/Eclypse_TEST/Eclypse_Test_PLL_1/Eclypse_Test_PLL_1.gen/sources_1/bd/ClockDivider_Block/ip/ClockDivider_Block_ClockDivider_0_0/ClockDivider_Block_ClockDivider_0_0_stub.vhdl
-- Design      : ClockDivider_Block_ClockDivider_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClockDivider_Block_ClockDivider_0_0 is
  Port ( 
    CLK_IN : in STD_LOGIC;
    CLK_OUT : out STD_LOGIC
  );

end ClockDivider_Block_ClockDivider_0_0;

architecture stub of ClockDivider_Block_ClockDivider_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK_IN,CLK_OUT";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ClockDivider,Vivado 2024.1";
begin
end;

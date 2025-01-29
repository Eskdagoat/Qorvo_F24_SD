-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
-- Date        : Sat Jan 25 23:22:04 2025
-- Host        : AB-Beast running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/SD1_Fall24/Computer/Eclypse/Eclypse_Test_PLL_1/Eclypse_Test_PLL_1.gen/sources_1/bd/ClockDivider_Block/ip/ClockDivider_Block_ClockDivider_0_0/ClockDivider_Block_ClockDivider_0_0_stub.vhdl
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

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ClockDivider_Block_ClockDivider_0_0 : entity is "ClockDivider_Block_ClockDivider_0_0,ClockDivider,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of ClockDivider_Block_ClockDivider_0_0 : entity is "ClockDivider_Block_ClockDivider_0_0,ClockDivider,{x_ipProduct=Vivado 2024.2.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ClockDivider,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,DIVISOR=0X000000C}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ClockDivider_Block_ClockDivider_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of ClockDivider_Block_ClockDivider_0_0 : entity is "module_ref";
end ClockDivider_Block_ClockDivider_0_0;

architecture stub of ClockDivider_Block_ClockDivider_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "CLK_IN,CLK_OUT";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "ClockDivider,Vivado 2024.2.1";
begin
end;

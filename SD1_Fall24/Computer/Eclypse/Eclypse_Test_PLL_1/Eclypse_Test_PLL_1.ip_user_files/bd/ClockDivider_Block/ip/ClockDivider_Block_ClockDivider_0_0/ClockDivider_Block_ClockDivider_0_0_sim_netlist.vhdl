-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2.1 (win64) Build 5266912 Sun Dec 15 09:03:24 MST 2024
-- Date        : Sat Jan 25 23:22:04 2025
-- Host        : AB-Beast running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/SD1_Fall24/Computer/Eclypse/Eclypse_Test_PLL_1/Eclypse_Test_PLL_1.gen/sources_1/bd/ClockDivider_Block/ip/ClockDivider_Block_ClockDivider_0_0/ClockDivider_Block_ClockDivider_0_0_sim_netlist.vhdl
-- Design      : ClockDivider_Block_ClockDivider_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ClockDivider_Block_ClockDivider_0_0_ClockDivider is
  port (
    CLK_OUT : out STD_LOGIC;
    CLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ClockDivider_Block_ClockDivider_0_0_ClockDivider : entity is "ClockDivider";
end ClockDivider_Block_ClockDivider_0_0_ClockDivider;

architecture STRUCTURE of ClockDivider_Block_ClockDivider_0_0_ClockDivider is
  signal counter : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
begin
CLK_OUT_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter,
      O => p_0_in
    );
CLK_OUT_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK_IN,
      CE => '1',
      D => p_0_in,
      Q => CLK_OUT,
      R => '0'
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN,
      CE => '1',
      D => p_0_in,
      Q => counter,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ClockDivider_Block_ClockDivider_0_0 is
  port (
    CLK_IN : in STD_LOGIC;
    CLK_OUT : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ClockDivider_Block_ClockDivider_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ClockDivider_Block_ClockDivider_0_0 : entity is "ClockDivider_Block_ClockDivider_0_0,ClockDivider,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ClockDivider_Block_ClockDivider_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of ClockDivider_Block_ClockDivider_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ClockDivider_Block_ClockDivider_0_0 : entity is "ClockDivider,Vivado 2024.2.1";
end ClockDivider_Block_ClockDivider_0_0;

architecture STRUCTURE of ClockDivider_Block_ClockDivider_0_0 is
begin
inst: entity work.ClockDivider_Block_ClockDivider_0_0_ClockDivider
     port map (
      CLK_IN => CLK_IN,
      CLK_OUT => CLK_OUT
    );
end STRUCTURE;

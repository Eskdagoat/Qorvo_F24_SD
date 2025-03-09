# PMOD A
set_property -dict {PACKAGE_PIN B15 IOSTANDARD LVCMOS33} [get_ports {pmod_a_0}];
set_property -dict {PACKAGE_PIN C15 IOSTANDARD LVCMOS33} [get_ports {pmod_a_1}];
set_property -dict {PACKAGE_PIN D15 IOSTANDARD LVCMOS33} [get_ports {pmod_a_2}];
set_property -dict {PACKAGE_PIN E16 IOSTANDARD LVCMOS33} [get_ports {pmod_a_3}];
set_property -dict {PACKAGE_PIN E15 IOSTANDARD LVCMOS33} [get_ports {pmod_a_4}];
set_property -dict {PACKAGE_PIN F17 IOSTANDARD LVCMOS33} [get_ports {pmod_a_5}];
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports {pmod_a_6}];
set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS33} [get_ports {pmod_a_7}];

## 125MHz Clock from Ethernet PHY
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { CLK_IN }]; #IO_L12P_T1_MRCC Sch=sysclk
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { CLK_IN }];

# 122.88MHz clock from ADC
#set_property -dict { PACKAGE_PIN M19  IOSTANDARD LVCMOS33 } [get_ports { syzygy_a_p2c_clk_p  }]; #IO_L13P_T2_MRCC Sch=syzygy_a_p2c_clk_p syzygy_a_p2c_clk_p  This is actually c2p, just named incorrectly...
#create_clock -period 8 -waveform {0 4} [get_ports syzygy_a_p2c_clk_p ]

set_property IOSTANDARD LVCMOS18 [get_ports syzygy_a_p2c_clk_p]
set_property PACKAGE_PIN M19 [get_ports syzygy_a_p2c_clk_p]
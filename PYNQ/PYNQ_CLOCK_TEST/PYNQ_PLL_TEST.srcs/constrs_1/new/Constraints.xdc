# Configuring LEDs
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports { LD0 }];
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports { LD1 }];
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports { LD2 }];
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports { LD3 }];
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports { PMODa0 }];
# Clock signal 125 MHz
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { CLK_IN }];
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 5} [get_ports { CLK_IN }];
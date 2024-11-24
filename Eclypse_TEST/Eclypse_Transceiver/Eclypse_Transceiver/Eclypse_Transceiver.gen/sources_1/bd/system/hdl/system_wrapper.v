//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Sat Nov 23 22:43:33 2024
//Host        : AB-UB24Vivado running 64-bit Ubuntu 24.04.1 LTS
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    adc_data_i,
    adc_dco_i,
    adc_spi_o,
    cdce_gpio_tri_io,
    cdce_iic_tri_io,
    clk_i,
    dac_clk_o,
    dac_data_o,
    dac_spi_o,
    dac_tri_io,
    led_o,
    pmod_a_tri_io,
    pmod_b_tri_io);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input [13:0]adc_data_i;
  input adc_dco_i;
  output [2:0]adc_spi_o;
  inout [4:0]cdce_gpio_tri_io;
  inout [1:0]cdce_iic_tri_io;
  input clk_i;
  output dac_clk_o;
  output [13:0]dac_data_o;
  output [2:0]dac_spi_o;
  inout [3:0]dac_tri_io;
  output [5:0]led_o;
  inout [7:0]pmod_a_tri_io;
  inout [7:0]pmod_b_tri_io;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [13:0]adc_data_i;
  wire adc_dco_i;
  wire [2:0]adc_spi_o;
  wire [4:0]cdce_gpio_tri_io;
  wire [1:0]cdce_iic_tri_io;
  wire clk_i;
  wire dac_clk_o;
  wire [13:0]dac_data_o;
  wire [2:0]dac_spi_o;
  wire [3:0]dac_tri_io;
  wire [5:0]led_o;
  wire [7:0]pmod_a_tri_io;
  wire [7:0]pmod_b_tri_io;

  system system_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .adc_data_i(adc_data_i),
        .adc_dco_i(adc_dco_i),
        .adc_spi_o(adc_spi_o),
        .cdce_gpio_tri_io(cdce_gpio_tri_io),
        .cdce_iic_tri_io(cdce_iic_tri_io),
        .clk_i(clk_i),
        .dac_clk_o(dac_clk_o),
        .dac_data_o(dac_data_o),
        .dac_spi_o(dac_spi_o),
        .dac_tri_io(dac_tri_io),
        .led_o(led_o),
        .pmod_a_tri_io(pmod_a_tri_io),
        .pmod_b_tri_io(pmod_b_tri_io));
endmodule

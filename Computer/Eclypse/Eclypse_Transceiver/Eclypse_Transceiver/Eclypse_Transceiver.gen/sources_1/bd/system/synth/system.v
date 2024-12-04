//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Sat Nov 23 22:43:33 2024
//Host        : AB-UB24Vivado running 64-bit Ubuntu 24.04.1 LTS
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module rx_0_imp_165NBE3
   (S_AXIS_A_tdata,
    S_AXIS_A_tvalid,
    clk_out1,
    din,
    din1,
    m_axis_tdata,
    m_axis_tready,
    m_axis_tvalid,
    peripheral_aresetn,
    read_count);
  input [15:0]S_AXIS_A_tdata;
  input S_AXIS_A_tvalid;
  input clk_out1;
  input [7:0]din;
  input [63:0]din1;
  output [31:0]m_axis_tdata;
  input m_axis_tready;
  output m_axis_tvalid;
  input peripheral_aresetn;
  output [15:0]read_count;

  wire [15:0]S_AXIS_A_tdata;
  wire S_AXIS_A_tvalid;
  wire [23:0]bcast_0_M00_AXIS_TDATA;
  wire [0:0]bcast_0_M00_AXIS_TVALID;
  wire [47:24]bcast_0_M01_AXIS_TDATA;
  wire [1:1]bcast_0_M01_AXIS_TVALID;
  wire [31:0]cic_0_M_AXIS_DATA_TDATA;
  wire cic_0_M_AXIS_DATA_TVALID;
  wire [31:0]cic_1_M_AXIS_DATA_TDATA;
  wire cic_1_M_AXIS_DATA_TVALID;
  wire clk_out1;
  wire [63:0]comb_0_M_AXIS_TDATA;
  wire comb_0_M_AXIS_TREADY;
  wire comb_0_M_AXIS_TVALID;
  wire [31:0]conv_0_M_AXIS_TDATA;
  wire conv_0_M_AXIS_TREADY;
  wire conv_0_M_AXIS_TVALID;
  wire [63:0]conv_1_M_AXIS_TDATA;
  wire conv_1_M_AXIS_TREADY;
  wire conv_1_M_AXIS_TVALID;
  wire [47:0]dds_0_M_AXIS_DATA_TDATA;
  wire dds_0_M_AXIS_DATA_TVALID;
  wire [7:0]din;
  wire [63:0]din1;
  wire [31:0]fir_0_M_AXIS_DATA_TDATA;
  wire fir_0_M_AXIS_DATA_TVALID;
  wire [31:0]fp_0_M_AXIS_RESULT_TDATA;
  wire fp_0_M_AXIS_RESULT_TREADY;
  wire fp_0_M_AXIS_RESULT_TVALID;
  wire [63:0]lfsr_0_m_axis_TDATA;
  wire lfsr_0_m_axis_TVALID;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [63:0]mult_0_M_AXIS_DOUT_TDATA;
  wire mult_0_M_AXIS_DOUT_TVALID;
  wire peripheral_aresetn;
  wire [39:0]phase_0_m_axis_TDATA;
  wire phase_0_m_axis_TVALID;
  wire [15:0]rate_0_m_axis_TDATA;
  wire rate_0_m_axis_TREADY;
  wire rate_0_m_axis_TVALID;
  wire [15:0]rate_1_m_axis_TDATA;
  wire rate_1_m_axis_TREADY;
  wire rate_1_m_axis_TVALID;
  wire [15:0]read_count;
  wire [0:0]slice_0_dout;
  wire [39:0]slice_1_dout;
  wire [15:0]slice_2_dout;
  wire [23:0]subset_0_M_AXIS_TDATA;
  wire subset_0_M_AXIS_TVALID;

  system_bcast_0_1 bcast_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata({bcast_0_M01_AXIS_TDATA,bcast_0_M00_AXIS_TDATA}),
        .m_axis_tvalid({bcast_0_M01_AXIS_TVALID,bcast_0_M00_AXIS_TVALID}),
        .s_axis_tdata(mult_0_M_AXIS_DOUT_TDATA),
        .s_axis_tvalid(mult_0_M_AXIS_DOUT_TVALID));
  system_cic_0_0 cic_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(cic_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cic_0_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(rate_0_m_axis_TDATA),
        .s_axis_config_tready(rate_0_m_axis_TREADY),
        .s_axis_config_tvalid(rate_0_m_axis_TVALID),
        .s_axis_data_tdata(bcast_0_M00_AXIS_TDATA),
        .s_axis_data_tvalid(bcast_0_M00_AXIS_TVALID));
  system_cic_1_0 cic_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(cic_1_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cic_1_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(rate_1_m_axis_TDATA),
        .s_axis_config_tready(rate_1_m_axis_TREADY),
        .s_axis_config_tvalid(rate_1_m_axis_TVALID),
        .s_axis_data_tdata(bcast_0_M01_AXIS_TDATA),
        .s_axis_data_tvalid(bcast_0_M01_AXIS_TVALID));
  system_comb_0_1 comb_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(comb_0_M_AXIS_TDATA),
        .m_axis_tready(comb_0_M_AXIS_TREADY),
        .m_axis_tvalid(comb_0_M_AXIS_TVALID),
        .s_axis_tdata({cic_1_M_AXIS_DATA_TDATA,cic_0_M_AXIS_DATA_TDATA}),
        .s_axis_tvalid({cic_1_M_AXIS_DATA_TVALID,cic_0_M_AXIS_DATA_TVALID}));
  system_conv_0_0 conv_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(conv_0_M_AXIS_TDATA),
        .m_axis_tready(conv_0_M_AXIS_TREADY),
        .m_axis_tvalid(conv_0_M_AXIS_TVALID),
        .s_axis_tdata(comb_0_M_AXIS_TDATA),
        .s_axis_tready(comb_0_M_AXIS_TREADY),
        .s_axis_tvalid(comb_0_M_AXIS_TVALID));
  system_conv_1_0 conv_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(conv_1_M_AXIS_TDATA),
        .m_axis_tready(conv_1_M_AXIS_TREADY),
        .m_axis_tvalid(conv_1_M_AXIS_TVALID),
        .s_axis_tdata(fp_0_M_AXIS_RESULT_TDATA),
        .s_axis_tready(fp_0_M_AXIS_RESULT_TREADY),
        .s_axis_tvalid(fp_0_M_AXIS_RESULT_TVALID));
  system_dds_0_0 dds_0
       (.aclk(clk_out1),
        .m_axis_data_tdata(dds_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(dds_0_M_AXIS_DATA_TVALID),
        .s_axis_phase_tdata(phase_0_m_axis_TDATA),
        .s_axis_phase_tvalid(phase_0_m_axis_TVALID));
  system_fifo_0_0 fifo_0
       (.aclk(clk_out1),
        .aresetn(slice_0_dout),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .read_count(read_count),
        .s_axis_tdata(conv_1_M_AXIS_TDATA),
        .s_axis_tready(conv_1_M_AXIS_TREADY),
        .s_axis_tvalid(conv_1_M_AXIS_TVALID));
  system_fir_0_0 fir_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(fir_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(fir_0_M_AXIS_DATA_TVALID),
        .s_axis_data_tdata(conv_0_M_AXIS_TDATA),
        .s_axis_data_tready(conv_0_M_AXIS_TREADY),
        .s_axis_data_tvalid(conv_0_M_AXIS_TVALID));
  system_fp_0_0 fp_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_result_tdata(fp_0_M_AXIS_RESULT_TDATA),
        .m_axis_result_tready(fp_0_M_AXIS_RESULT_TREADY),
        .m_axis_result_tvalid(fp_0_M_AXIS_RESULT_TVALID),
        .s_axis_a_tdata(subset_0_M_AXIS_TDATA),
        .s_axis_a_tvalid(subset_0_M_AXIS_TVALID));
  system_lfsr_0_0 lfsr_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(lfsr_0_m_axis_TDATA),
        .m_axis_tready(1'b1),
        .m_axis_tvalid(lfsr_0_m_axis_TVALID));
  system_mult_0_0 mult_0
       (.aclk(clk_out1),
        .m_axis_dout_tdata(mult_0_M_AXIS_DOUT_TDATA),
        .m_axis_dout_tvalid(mult_0_M_AXIS_DOUT_TVALID),
        .s_axis_a_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S_AXIS_A_tdata}),
        .s_axis_a_tvalid(S_AXIS_A_tvalid),
        .s_axis_b_tdata(dds_0_M_AXIS_DATA_TDATA),
        .s_axis_b_tvalid(dds_0_M_AXIS_DATA_TVALID),
        .s_axis_ctrl_tdata(lfsr_0_m_axis_TDATA[7:0]),
        .s_axis_ctrl_tvalid(lfsr_0_m_axis_TVALID));
  system_phase_0_0 phase_0
       (.aclk(clk_out1),
        .cfg_data(slice_1_dout),
        .m_axis_tdata(phase_0_m_axis_TDATA),
        .m_axis_tvalid(phase_0_m_axis_TVALID));
  system_rate_0_0 rate_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .cfg_data(slice_2_dout),
        .m_axis_tdata(rate_0_m_axis_TDATA),
        .m_axis_tready(rate_0_m_axis_TREADY),
        .m_axis_tvalid(rate_0_m_axis_TVALID));
  system_rate_1_0 rate_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .cfg_data(slice_2_dout),
        .m_axis_tdata(rate_1_m_axis_TDATA),
        .m_axis_tready(rate_1_m_axis_TREADY),
        .m_axis_tvalid(rate_1_m_axis_TVALID));
  system_slice_0_0 slice_0
       (.din(din),
        .dout(slice_0_dout));
  system_slice_1_0 slice_1
       (.din(din1),
        .dout(slice_1_dout));
  system_slice_2_0 slice_2
       (.din(din1),
        .dout(slice_2_dout));
  system_subset_0_0 subset_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(subset_0_M_AXIS_TDATA),
        .m_axis_tvalid(subset_0_M_AXIS_TVALID),
        .s_axis_tdata(fir_0_M_AXIS_DATA_TDATA),
        .s_axis_tvalid(fir_0_M_AXIS_DATA_TVALID));
endmodule

module rx_0_imp_3ESCUC
   (S_AXIS_A_tdata,
    S_AXIS_A_tvalid,
    clk_out1,
    din,
    din1,
    m_axis_tdata,
    m_axis_tready,
    m_axis_tvalid,
    peripheral_aresetn,
    read_count);
  input [15:0]S_AXIS_A_tdata;
  input S_AXIS_A_tvalid;
  input clk_out1;
  input [7:0]din;
  input [63:0]din1;
  output [31:0]m_axis_tdata;
  input m_axis_tready;
  output m_axis_tvalid;
  input peripheral_aresetn;
  output [15:0]read_count;

  wire [15:0]S_AXIS_A_tdata;
  wire S_AXIS_A_tvalid;
  wire [23:0]bcast_0_M00_AXIS_TDATA;
  wire [0:0]bcast_0_M00_AXIS_TVALID;
  wire [47:24]bcast_0_M01_AXIS_TDATA;
  wire [1:1]bcast_0_M01_AXIS_TVALID;
  wire [31:0]cic_0_M_AXIS_DATA_TDATA;
  wire cic_0_M_AXIS_DATA_TVALID;
  wire [31:0]cic_1_M_AXIS_DATA_TDATA;
  wire cic_1_M_AXIS_DATA_TVALID;
  wire clk_out1;
  wire [63:0]comb_0_M_AXIS_TDATA;
  wire comb_0_M_AXIS_TREADY;
  wire comb_0_M_AXIS_TVALID;
  wire [31:0]conv_0_M_AXIS_TDATA;
  wire conv_0_M_AXIS_TREADY;
  wire conv_0_M_AXIS_TVALID;
  wire [63:0]conv_1_M_AXIS_TDATA;
  wire conv_1_M_AXIS_TREADY;
  wire conv_1_M_AXIS_TVALID;
  wire [47:0]dds_0_M_AXIS_DATA_TDATA;
  wire dds_0_M_AXIS_DATA_TVALID;
  wire [7:0]din;
  wire [63:0]din1;
  wire [31:0]fir_0_M_AXIS_DATA_TDATA;
  wire fir_0_M_AXIS_DATA_TVALID;
  wire [31:0]fp_0_M_AXIS_RESULT_TDATA;
  wire fp_0_M_AXIS_RESULT_TREADY;
  wire fp_0_M_AXIS_RESULT_TVALID;
  wire [63:0]lfsr_0_m_axis_TDATA;
  wire lfsr_0_m_axis_TVALID;
  wire [31:0]m_axis_tdata;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [63:0]mult_0_M_AXIS_DOUT_TDATA;
  wire mult_0_M_AXIS_DOUT_TVALID;
  wire peripheral_aresetn;
  wire [39:0]phase_0_m_axis_TDATA;
  wire phase_0_m_axis_TVALID;
  wire [15:0]rate_0_m_axis_TDATA;
  wire rate_0_m_axis_TREADY;
  wire rate_0_m_axis_TVALID;
  wire [15:0]rate_1_m_axis_TDATA;
  wire rate_1_m_axis_TREADY;
  wire rate_1_m_axis_TVALID;
  wire [15:0]read_count;
  wire [0:0]slice_0_dout;
  wire [39:0]slice_1_dout;
  wire [15:0]slice_2_dout;
  wire [23:0]subset_0_M_AXIS_TDATA;
  wire subset_0_M_AXIS_TVALID;

  system_bcast_0_3 bcast_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata({bcast_0_M01_AXIS_TDATA,bcast_0_M00_AXIS_TDATA}),
        .m_axis_tvalid({bcast_0_M01_AXIS_TVALID,bcast_0_M00_AXIS_TVALID}),
        .s_axis_tdata(mult_0_M_AXIS_DOUT_TDATA),
        .s_axis_tvalid(mult_0_M_AXIS_DOUT_TVALID));
  system_cic_0_2 cic_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(cic_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cic_0_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(rate_0_m_axis_TDATA),
        .s_axis_config_tready(rate_0_m_axis_TREADY),
        .s_axis_config_tvalid(rate_0_m_axis_TVALID),
        .s_axis_data_tdata(bcast_0_M00_AXIS_TDATA),
        .s_axis_data_tvalid(bcast_0_M00_AXIS_TVALID));
  system_cic_1_2 cic_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(cic_1_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cic_1_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(rate_1_m_axis_TDATA),
        .s_axis_config_tready(rate_1_m_axis_TREADY),
        .s_axis_config_tvalid(rate_1_m_axis_TVALID),
        .s_axis_data_tdata(bcast_0_M01_AXIS_TDATA),
        .s_axis_data_tvalid(bcast_0_M01_AXIS_TVALID));
  system_comb_0_3 comb_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(comb_0_M_AXIS_TDATA),
        .m_axis_tready(comb_0_M_AXIS_TREADY),
        .m_axis_tvalid(comb_0_M_AXIS_TVALID),
        .s_axis_tdata({cic_1_M_AXIS_DATA_TDATA,cic_0_M_AXIS_DATA_TDATA}),
        .s_axis_tvalid({cic_1_M_AXIS_DATA_TVALID,cic_0_M_AXIS_DATA_TVALID}));
  system_conv_0_2 conv_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(conv_0_M_AXIS_TDATA),
        .m_axis_tready(conv_0_M_AXIS_TREADY),
        .m_axis_tvalid(conv_0_M_AXIS_TVALID),
        .s_axis_tdata(comb_0_M_AXIS_TDATA),
        .s_axis_tready(comb_0_M_AXIS_TREADY),
        .s_axis_tvalid(comb_0_M_AXIS_TVALID));
  system_conv_1_2 conv_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(conv_1_M_AXIS_TDATA),
        .m_axis_tready(conv_1_M_AXIS_TREADY),
        .m_axis_tvalid(conv_1_M_AXIS_TVALID),
        .s_axis_tdata(fp_0_M_AXIS_RESULT_TDATA),
        .s_axis_tready(fp_0_M_AXIS_RESULT_TREADY),
        .s_axis_tvalid(fp_0_M_AXIS_RESULT_TVALID));
  system_dds_0_2 dds_0
       (.aclk(clk_out1),
        .m_axis_data_tdata(dds_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(dds_0_M_AXIS_DATA_TVALID),
        .s_axis_phase_tdata(phase_0_m_axis_TDATA),
        .s_axis_phase_tvalid(phase_0_m_axis_TVALID));
  system_fifo_0_2 fifo_0
       (.aclk(clk_out1),
        .aresetn(slice_0_dout),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .read_count(read_count),
        .s_axis_tdata(conv_1_M_AXIS_TDATA),
        .s_axis_tready(conv_1_M_AXIS_TREADY),
        .s_axis_tvalid(conv_1_M_AXIS_TVALID));
  system_fir_0_2 fir_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(fir_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(fir_0_M_AXIS_DATA_TVALID),
        .s_axis_data_tdata(conv_0_M_AXIS_TDATA),
        .s_axis_data_tready(conv_0_M_AXIS_TREADY),
        .s_axis_data_tvalid(conv_0_M_AXIS_TVALID));
  system_fp_0_2 fp_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_result_tdata(fp_0_M_AXIS_RESULT_TDATA),
        .m_axis_result_tready(fp_0_M_AXIS_RESULT_TREADY),
        .m_axis_result_tvalid(fp_0_M_AXIS_RESULT_TVALID),
        .s_axis_a_tdata(subset_0_M_AXIS_TDATA),
        .s_axis_a_tvalid(subset_0_M_AXIS_TVALID));
  system_lfsr_0_2 lfsr_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(lfsr_0_m_axis_TDATA),
        .m_axis_tready(1'b1),
        .m_axis_tvalid(lfsr_0_m_axis_TVALID));
  system_mult_0_2 mult_0
       (.aclk(clk_out1),
        .m_axis_dout_tdata(mult_0_M_AXIS_DOUT_TDATA),
        .m_axis_dout_tvalid(mult_0_M_AXIS_DOUT_TVALID),
        .s_axis_a_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,S_AXIS_A_tdata}),
        .s_axis_a_tvalid(S_AXIS_A_tvalid),
        .s_axis_b_tdata(dds_0_M_AXIS_DATA_TDATA),
        .s_axis_b_tvalid(dds_0_M_AXIS_DATA_TVALID),
        .s_axis_ctrl_tdata(lfsr_0_m_axis_TDATA[7:0]),
        .s_axis_ctrl_tvalid(lfsr_0_m_axis_TVALID));
  system_phase_0_2 phase_0
       (.aclk(clk_out1),
        .cfg_data(slice_1_dout),
        .m_axis_tdata(phase_0_m_axis_TDATA),
        .m_axis_tvalid(phase_0_m_axis_TVALID));
  system_rate_0_2 rate_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .cfg_data(slice_2_dout),
        .m_axis_tdata(rate_0_m_axis_TDATA),
        .m_axis_tready(rate_0_m_axis_TREADY),
        .m_axis_tvalid(rate_0_m_axis_TVALID));
  system_rate_1_2 rate_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .cfg_data(slice_2_dout),
        .m_axis_tdata(rate_1_m_axis_TDATA),
        .m_axis_tready(rate_1_m_axis_TREADY),
        .m_axis_tvalid(rate_1_m_axis_TVALID));
  system_slice_0_2 slice_0
       (.din(din),
        .dout(slice_0_dout));
  system_slice_1_2 slice_1
       (.din(din1),
        .dout(slice_1_dout));
  system_slice_2_2 slice_2
       (.din(din1),
        .dout(slice_2_dout));
  system_subset_0_1 subset_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(subset_0_M_AXIS_TDATA),
        .m_axis_tvalid(subset_0_M_AXIS_TVALID),
        .s_axis_tdata(fir_0_M_AXIS_DATA_TDATA),
        .s_axis_tvalid(fir_0_M_AXIS_DATA_TVALID));
endmodule

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=107,numReposBlks=101,numNonXlnxBlks=51,numHierBlks=6,maxHierDepth=2,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=1,synth_mode=None}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
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
  wire [31:0]adc_0_m_axis_TDATA;
  wire adc_0_m_axis_TVALID;
  wire [13:0]adc_data_i;
  wire adc_dco_i;
  wire [2:0]adc_spi_o;
  wire [15:0]bcast_0_M00_AXIS_TDATA;
  wire [0:0]bcast_0_M00_AXIS_TVALID;
  wire [31:16]bcast_0_M01_AXIS_TDATA;
  wire [1:1]bcast_0_M01_AXIS_TVALID;
  wire [4:0]cdce_gpio_tri_io;
  wire [1:0]cdce_iic_tri_io;
  wire [31:0]comb_0_M_AXIS_TDATA;
  wire comb_0_M_AXIS_TREADY;
  wire comb_0_M_AXIS_TVALID;
  wire [0:0]const_0_dout;
  wire dac_clk_o;
  wire [13:0]dac_data_o;
  wire [2:0]dac_spi_o;
  wire [3:0]dac_tri_io;
  wire [31:0]fifo_0_m_axis_TDATA;
  wire fifo_0_m_axis_TREADY;
  wire fifo_0_m_axis_TVALID;
  wire [31:0]fifo_1_m_axis_TDATA;
  wire fifo_1_m_axis_TREADY;
  wire fifo_1_m_axis_TVALID;
  wire pll_0_clk_out1;
  wire pll_0_locked;
  wire ps_0_FCLK_CLK0;
  wire [31:0]ps_0_M_AXI_GP0_ARADDR;
  wire [11:0]ps_0_M_AXI_GP0_ARID;
  wire [3:0]ps_0_M_AXI_GP0_ARLEN;
  wire ps_0_M_AXI_GP0_ARREADY;
  wire ps_0_M_AXI_GP0_ARVALID;
  wire [31:0]ps_0_M_AXI_GP0_AWADDR;
  wire [11:0]ps_0_M_AXI_GP0_AWID;
  wire ps_0_M_AXI_GP0_AWREADY;
  wire ps_0_M_AXI_GP0_AWVALID;
  wire [11:0]ps_0_M_AXI_GP0_BID;
  wire ps_0_M_AXI_GP0_BREADY;
  wire ps_0_M_AXI_GP0_BVALID;
  wire [31:0]ps_0_M_AXI_GP0_RDATA;
  wire [11:0]ps_0_M_AXI_GP0_RID;
  wire ps_0_M_AXI_GP0_RLAST;
  wire ps_0_M_AXI_GP0_RREADY;
  wire ps_0_M_AXI_GP0_RVALID;
  wire [31:0]ps_0_M_AXI_GP0_WDATA;
  wire ps_0_M_AXI_GP0_WLAST;
  wire ps_0_M_AXI_GP0_WREADY;
  wire [3:0]ps_0_M_AXI_GP0_WSTRB;
  wire ps_0_M_AXI_GP0_WVALID;
  wire [31:0]ps_0_M_AXI_GP1_ARADDR;
  wire [11:0]ps_0_M_AXI_GP1_ARID;
  wire [3:0]ps_0_M_AXI_GP1_ARLEN;
  wire ps_0_M_AXI_GP1_ARREADY;
  wire ps_0_M_AXI_GP1_ARVALID;
  wire [31:0]ps_0_M_AXI_GP1_AWADDR;
  wire [11:0]ps_0_M_AXI_GP1_AWID;
  wire ps_0_M_AXI_GP1_AWREADY;
  wire ps_0_M_AXI_GP1_AWVALID;
  wire [11:0]ps_0_M_AXI_GP1_BID;
  wire ps_0_M_AXI_GP1_BREADY;
  wire ps_0_M_AXI_GP1_BVALID;
  wire [31:0]ps_0_M_AXI_GP1_RDATA;
  wire [11:0]ps_0_M_AXI_GP1_RID;
  wire ps_0_M_AXI_GP1_RLAST;
  wire ps_0_M_AXI_GP1_RREADY;
  wire ps_0_M_AXI_GP1_RVALID;
  wire [31:0]ps_0_M_AXI_GP1_WDATA;
  wire ps_0_M_AXI_GP1_WLAST;
  wire ps_0_M_AXI_GP1_WREADY;
  wire [3:0]ps_0_M_AXI_GP1_WSTRB;
  wire ps_0_M_AXI_GP1_WVALID;
  wire [0:0]rst_0_peripheral_aresetn;
  wire [47:0]trx_0_M_AXIS_DOUT_TDATA;
  wire trx_0_M_AXIS_DOUT_TVALID;
  wire [31:0]trx_0_m01_axis_TDATA;
  wire trx_0_m01_axis_TREADY;
  wire trx_0_m01_axis_TVALID;
  wire [31:0]trx_0_m02_axis_TDATA;
  wire trx_0_m02_axis_TREADY;
  wire trx_0_m02_axis_TVALID;
  wire [47:0]trx_1_M_AXIS_DOUT_TDATA;
  wire trx_1_M_AXIS_DOUT_TVALID;

  system_adc_0_0 adc_0
       (.aclk(pll_0_clk_out1),
        .adc_data(adc_data_i),
        .m_axis_tdata(adc_0_m_axis_TDATA),
        .m_axis_tvalid(adc_0_m_axis_TVALID));
  system_bcast_0_0 bcast_0
       (.aclk(pll_0_clk_out1),
        .aresetn(rst_0_peripheral_aresetn),
        .m_axis_tdata({bcast_0_M01_AXIS_TDATA,bcast_0_M00_AXIS_TDATA}),
        .m_axis_tvalid({bcast_0_M01_AXIS_TVALID,bcast_0_M00_AXIS_TVALID}),
        .s_axis_tdata(adc_0_m_axis_TDATA),
        .s_axis_tvalid(adc_0_m_axis_TVALID));
  system_comb_0_0 comb_0
       (.aclk(pll_0_clk_out1),
        .aresetn(rst_0_peripheral_aresetn),
        .m_axis_tdata(comb_0_M_AXIS_TDATA),
        .m_axis_tready(comb_0_M_AXIS_TREADY),
        .m_axis_tvalid(comb_0_M_AXIS_TVALID),
        .s_axis_tdata({trx_1_M_AXIS_DOUT_TDATA[15:0],trx_0_M_AXIS_DOUT_TDATA[15:0]}),
        .s_axis_tvalid({trx_1_M_AXIS_DOUT_TVALID,trx_0_M_AXIS_DOUT_TVALID}));
  system_const_0_0 const_0
       (.dout(const_0_dout));
  system_dac_0_0 dac_0
       (.aclk(pll_0_clk_out1),
        .dac_clk(dac_clk_o),
        .dac_data(dac_data_o),
        .locked(pll_0_locked),
        .s_axis_tdata(comb_0_M_AXIS_TDATA),
        .s_axis_tready(comb_0_M_AXIS_TREADY),
        .s_axis_tvalid(comb_0_M_AXIS_TVALID));
  system_fifo_0_4 fifo_0
       (.aclk(pll_0_clk_out1),
        .aresetn(rst_0_peripheral_aresetn),
        .m_axis_tdata(fifo_0_m_axis_TDATA),
        .m_axis_tready(fifo_0_m_axis_TREADY),
        .m_axis_tvalid(fifo_0_m_axis_TVALID),
        .s_axis_tdata(trx_0_m01_axis_TDATA),
        .s_axis_tready(trx_0_m01_axis_TREADY),
        .s_axis_tvalid(trx_0_m01_axis_TVALID));
  system_fifo_1_0 fifo_1
       (.aclk(pll_0_clk_out1),
        .aresetn(rst_0_peripheral_aresetn),
        .m_axis_tdata(fifo_1_m_axis_TDATA),
        .m_axis_tready(fifo_1_m_axis_TREADY),
        .m_axis_tvalid(fifo_1_m_axis_TVALID),
        .s_axis_tdata(trx_0_m02_axis_TDATA),
        .s_axis_tready(trx_0_m02_axis_TREADY),
        .s_axis_tvalid(trx_0_m02_axis_TVALID));
  system_gpio_0_0 gpio_0
       (.aclk(ps_0_FCLK_CLK0),
        .gpio(cdce_gpio_tri_io));
  system_gpio_1_0 gpio_1
       (.aclk(ps_0_FCLK_CLK0),
        .gpio(dac_tri_io));
  system_iic_0_0 iic_0
       (.aclk(ps_0_FCLK_CLK0),
        .iic(cdce_iic_tri_io));
  system_pll_0_0 pll_0
       (.clk_in1(adc_dco_i),
        .clk_out1(pll_0_clk_out1),
        .locked(pll_0_locked));
  system_ps_0_0 ps_0
       (.DDR_Addr(DDR_addr),
        .DDR_BankAddr(DDR_ba),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm),
        .DDR_DQ(DDR_dq),
        .DDR_DQS(DDR_dqs_p),
        .DDR_DQS_n(DDR_dqs_n),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(ps_0_FCLK_CLK0),
        .GPIO_I({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .I2C0_SCL_I(1'b0),
        .I2C0_SDA_I(1'b0),
        .MIO(FIXED_IO_mio),
        .M_AXI_GP0_ACLK(pll_0_clk_out1),
        .M_AXI_GP0_ARADDR(ps_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARID(ps_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(ps_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARREADY(ps_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARVALID(ps_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(ps_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWID(ps_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWREADY(ps_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWVALID(ps_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(ps_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(ps_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP({1'b0,1'b0}),
        .M_AXI_GP0_BVALID(ps_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(ps_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(ps_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(ps_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(ps_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP({1'b0,1'b0}),
        .M_AXI_GP0_RVALID(ps_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(ps_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WLAST(ps_0_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(ps_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(ps_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(ps_0_M_AXI_GP0_WVALID),
        .M_AXI_GP1_ACLK(pll_0_clk_out1),
        .M_AXI_GP1_ARADDR(ps_0_M_AXI_GP1_ARADDR),
        .M_AXI_GP1_ARID(ps_0_M_AXI_GP1_ARID),
        .M_AXI_GP1_ARLEN(ps_0_M_AXI_GP1_ARLEN),
        .M_AXI_GP1_ARREADY(ps_0_M_AXI_GP1_ARREADY),
        .M_AXI_GP1_ARVALID(ps_0_M_AXI_GP1_ARVALID),
        .M_AXI_GP1_AWADDR(ps_0_M_AXI_GP1_AWADDR),
        .M_AXI_GP1_AWID(ps_0_M_AXI_GP1_AWID),
        .M_AXI_GP1_AWREADY(ps_0_M_AXI_GP1_AWREADY),
        .M_AXI_GP1_AWVALID(ps_0_M_AXI_GP1_AWVALID),
        .M_AXI_GP1_BID(ps_0_M_AXI_GP1_BID),
        .M_AXI_GP1_BREADY(ps_0_M_AXI_GP1_BREADY),
        .M_AXI_GP1_BRESP({1'b0,1'b0}),
        .M_AXI_GP1_BVALID(ps_0_M_AXI_GP1_BVALID),
        .M_AXI_GP1_RDATA(ps_0_M_AXI_GP1_RDATA),
        .M_AXI_GP1_RID(ps_0_M_AXI_GP1_RID),
        .M_AXI_GP1_RLAST(ps_0_M_AXI_GP1_RLAST),
        .M_AXI_GP1_RREADY(ps_0_M_AXI_GP1_RREADY),
        .M_AXI_GP1_RRESP({1'b0,1'b0}),
        .M_AXI_GP1_RVALID(ps_0_M_AXI_GP1_RVALID),
        .M_AXI_GP1_WDATA(ps_0_M_AXI_GP1_WDATA),
        .M_AXI_GP1_WLAST(ps_0_M_AXI_GP1_WLAST),
        .M_AXI_GP1_WREADY(ps_0_M_AXI_GP1_WREADY),
        .M_AXI_GP1_WSTRB(ps_0_M_AXI_GP1_WSTRB),
        .M_AXI_GP1_WVALID(ps_0_M_AXI_GP1_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .USB0_VBUS_PWRFAULT(1'b0));
  system_rst_0_0 rst_0
       (.aux_reset_in(1'b1),
        .dcm_locked(pll_0_locked),
        .ext_reset_in(const_0_dout),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_0_peripheral_aresetn),
        .slowest_sync_clk(pll_0_clk_out1));
  system_spi_0_0 spi_0
       (.aclk(pll_0_clk_out1),
        .aresetn(rst_0_peripheral_aresetn),
        .s_axis_tdata(fifo_0_m_axis_TDATA),
        .s_axis_tready(fifo_0_m_axis_TREADY),
        .s_axis_tvalid(fifo_0_m_axis_TVALID),
        .spi_data(adc_spi_o));
  system_spi_1_0 spi_1
       (.aclk(pll_0_clk_out1),
        .aresetn(rst_0_peripheral_aresetn),
        .s_axis_tdata(fifo_1_m_axis_TDATA),
        .s_axis_tready(fifo_1_m_axis_TREADY),
        .s_axis_tvalid(fifo_1_m_axis_TVALID),
        .spi_data(dac_spi_o));
  trx_0_imp_1FSE773 trx_0
       (.M_AXIS_DOUT_tdata(trx_0_M_AXIS_DOUT_TDATA),
        .M_AXIS_DOUT_tvalid(trx_0_M_AXIS_DOUT_TVALID),
        .S_AXIS_A_tdata(bcast_0_M00_AXIS_TDATA),
        .S_AXIS_A_tvalid(bcast_0_M00_AXIS_TVALID),
        .aclk(pll_0_clk_out1),
        .aresetn(rst_0_peripheral_aresetn),
        .m01_axis_tdata(trx_0_m01_axis_TDATA),
        .m01_axis_tready(trx_0_m01_axis_TREADY),
        .m01_axis_tvalid(trx_0_m01_axis_TVALID),
        .m02_axis_tdata(trx_0_m02_axis_TDATA),
        .m02_axis_tready(trx_0_m02_axis_TREADY),
        .m02_axis_tvalid(trx_0_m02_axis_TVALID),
        .s_axi_araddr(ps_0_M_AXI_GP0_ARADDR),
        .s_axi_arid(ps_0_M_AXI_GP0_ARID),
        .s_axi_arlen(ps_0_M_AXI_GP0_ARLEN),
        .s_axi_arready(ps_0_M_AXI_GP0_ARREADY),
        .s_axi_arvalid(ps_0_M_AXI_GP0_ARVALID),
        .s_axi_awaddr(ps_0_M_AXI_GP0_AWADDR),
        .s_axi_awid(ps_0_M_AXI_GP0_AWID),
        .s_axi_awready(ps_0_M_AXI_GP0_AWREADY),
        .s_axi_awvalid(ps_0_M_AXI_GP0_AWVALID),
        .s_axi_bid(ps_0_M_AXI_GP0_BID),
        .s_axi_bready(ps_0_M_AXI_GP0_BREADY),
        .s_axi_bvalid(ps_0_M_AXI_GP0_BVALID),
        .s_axi_rdata(ps_0_M_AXI_GP0_RDATA),
        .s_axi_rid(ps_0_M_AXI_GP0_RID),
        .s_axi_rlast(ps_0_M_AXI_GP0_RLAST),
        .s_axi_rready(ps_0_M_AXI_GP0_RREADY),
        .s_axi_rvalid(ps_0_M_AXI_GP0_RVALID),
        .s_axi_wdata(ps_0_M_AXI_GP0_WDATA),
        .s_axi_wlast(ps_0_M_AXI_GP0_WLAST),
        .s_axi_wready(ps_0_M_AXI_GP0_WREADY),
        .s_axi_wstrb(ps_0_M_AXI_GP0_WSTRB),
        .s_axi_wvalid(ps_0_M_AXI_GP0_WVALID));
  trx_1_imp_7ZUS0R trx_1
       (.M_AXIS_DOUT_tdata(trx_1_M_AXIS_DOUT_TDATA),
        .M_AXIS_DOUT_tvalid(trx_1_M_AXIS_DOUT_TVALID),
        .S_AXIS_A_tdata(bcast_0_M01_AXIS_TDATA),
        .S_AXIS_A_tvalid(bcast_0_M01_AXIS_TVALID),
        .aclk(pll_0_clk_out1),
        .aresetn(rst_0_peripheral_aresetn),
        .s_axi_araddr(ps_0_M_AXI_GP1_ARADDR),
        .s_axi_arid(ps_0_M_AXI_GP1_ARID),
        .s_axi_arlen(ps_0_M_AXI_GP1_ARLEN),
        .s_axi_arready(ps_0_M_AXI_GP1_ARREADY),
        .s_axi_arvalid(ps_0_M_AXI_GP1_ARVALID),
        .s_axi_awaddr(ps_0_M_AXI_GP1_AWADDR),
        .s_axi_awid(ps_0_M_AXI_GP1_AWID),
        .s_axi_awready(ps_0_M_AXI_GP1_AWREADY),
        .s_axi_awvalid(ps_0_M_AXI_GP1_AWVALID),
        .s_axi_bid(ps_0_M_AXI_GP1_BID),
        .s_axi_bready(ps_0_M_AXI_GP1_BREADY),
        .s_axi_bvalid(ps_0_M_AXI_GP1_BVALID),
        .s_axi_rdata(ps_0_M_AXI_GP1_RDATA),
        .s_axi_rid(ps_0_M_AXI_GP1_RID),
        .s_axi_rlast(ps_0_M_AXI_GP1_RLAST),
        .s_axi_rready(ps_0_M_AXI_GP1_RREADY),
        .s_axi_rvalid(ps_0_M_AXI_GP1_RVALID),
        .s_axi_wdata(ps_0_M_AXI_GP1_WDATA),
        .s_axi_wlast(ps_0_M_AXI_GP1_WLAST),
        .s_axi_wready(ps_0_M_AXI_GP1_WREADY),
        .s_axi_wstrb(ps_0_M_AXI_GP1_WSTRB),
        .s_axi_wvalid(ps_0_M_AXI_GP1_WVALID));
endmodule

module trx_0_imp_1FSE773
   (M_AXIS_DOUT_tdata,
    M_AXIS_DOUT_tvalid,
    S_AXIS_A_tdata,
    S_AXIS_A_tvalid,
    aclk,
    aresetn,
    m01_axis_tdata,
    m01_axis_tready,
    m01_axis_tvalid,
    m02_axis_tdata,
    m02_axis_tready,
    m02_axis_tvalid,
    s_axi_araddr,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arready,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awid,
    s_axi_awready,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wvalid);
  output [47:0]M_AXIS_DOUT_tdata;
  output M_AXIS_DOUT_tvalid;
  input [15:0]S_AXIS_A_tdata;
  input S_AXIS_A_tvalid;
  input aclk;
  input aresetn;
  output [31:0]m01_axis_tdata;
  input m01_axis_tready;
  output m01_axis_tvalid;
  output [31:0]m02_axis_tdata;
  input m02_axis_tready;
  output m02_axis_tvalid;
  input [31:0]s_axi_araddr;
  input [11:0]s_axi_arid;
  input [3:0]s_axi_arlen;
  output s_axi_arready;
  input s_axi_arvalid;
  input [31:0]s_axi_awaddr;
  input [11:0]s_axi_awid;
  output s_axi_awready;
  input s_axi_awvalid;
  output [11:0]s_axi_bid;
  input s_axi_bready;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output [11:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;

  wire [47:0]M_AXIS_DOUT_tdata;
  wire M_AXIS_DOUT_tvalid;
  wire [15:0]S_AXIS_A_tdata;
  wire S_AXIS_A_tvalid;
  wire aclk;
  wire aresetn;
  wire [63:0]cfg_slice_0_dout;
  wire [63:0]cfg_slice_1_dout;
  wire [31:0]concat_0_dout;
  wire [159:0]hub_0_cfg_data;
  wire [31:0]hub_0_m00_axis_TDATA;
  wire hub_0_m00_axis_TREADY;
  wire hub_0_m00_axis_TVALID;
  wire [31:0]m01_axis_tdata;
  wire m01_axis_tready;
  wire m01_axis_tvalid;
  wire [31:0]m02_axis_tdata;
  wire m02_axis_tready;
  wire m02_axis_tvalid;
  wire [7:0]rst_slice_0_dout;
  wire [7:0]rst_slice_1_dout;
  wire [31:0]rx_0_m_axis_TDATA;
  wire rx_0_m_axis_TREADY;
  wire rx_0_m_axis_TVALID;
  wire [15:0]rx_0_read_count;
  wire [31:0]s_axi_araddr;
  wire [11:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [11:0]s_axi_awid;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire [11:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire [11:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [15:0]tx_0_write_count;

  system_cfg_slice_0_0 cfg_slice_0
       (.din(hub_0_cfg_data),
        .dout(cfg_slice_0_dout));
  system_cfg_slice_1_0 cfg_slice_1
       (.din(hub_0_cfg_data),
        .dout(cfg_slice_1_dout));
  system_concat_0_0 concat_0
       (.In0(rx_0_read_count),
        .In1(tx_0_write_count),
        .dout(concat_0_dout));
  system_hub_0_0 hub_0
       (.aclk(aclk),
        .aresetn(aresetn),
        .b00_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .b01_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .b02_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .b03_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .b04_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .b05_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .cfg_data(hub_0_cfg_data),
        .m00_axis_tdata(hub_0_m00_axis_TDATA),
        .m00_axis_tready(hub_0_m00_axis_TREADY),
        .m00_axis_tvalid(hub_0_m00_axis_TVALID),
        .m01_axis_tdata(m01_axis_tdata),
        .m01_axis_tready(m01_axis_tready),
        .m01_axis_tvalid(m01_axis_tvalid),
        .m02_axis_tdata(m02_axis_tdata),
        .m02_axis_tready(m02_axis_tready),
        .m02_axis_tvalid(m02_axis_tvalid),
        .m03_axis_tready(1'b1),
        .m04_axis_tready(1'b1),
        .m05_axis_tready(1'b1),
        .s00_axis_tdata(rx_0_m_axis_TDATA),
        .s00_axis_tready(rx_0_m_axis_TREADY),
        .s00_axis_tvalid(rx_0_m_axis_TVALID),
        .s01_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s01_axis_tvalid(1'b0),
        .s02_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s02_axis_tvalid(1'b0),
        .s03_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s03_axis_tvalid(1'b0),
        .s04_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s04_axis_tvalid(1'b0),
        .s05_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s05_axis_tvalid(1'b0),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awid(s_axi_awid),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .sts_data(concat_0_dout));
  system_rst_slice_0_0 rst_slice_0
       (.din(hub_0_cfg_data),
        .dout(rst_slice_0_dout));
  system_rst_slice_1_0 rst_slice_1
       (.din(hub_0_cfg_data),
        .dout(rst_slice_1_dout));
  rx_0_imp_165NBE3 rx_0
       (.S_AXIS_A_tdata(S_AXIS_A_tdata),
        .S_AXIS_A_tvalid(S_AXIS_A_tvalid),
        .clk_out1(aclk),
        .din(rst_slice_0_dout),
        .din1(cfg_slice_0_dout),
        .m_axis_tdata(rx_0_m_axis_TDATA),
        .m_axis_tready(rx_0_m_axis_TREADY),
        .m_axis_tvalid(rx_0_m_axis_TVALID),
        .peripheral_aresetn(aresetn),
        .read_count(rx_0_read_count));
  tx_0_imp_16ZP63W tx_0
       (.M_AXIS_DOUT_tdata(M_AXIS_DOUT_tdata),
        .M_AXIS_DOUT_tvalid(M_AXIS_DOUT_tvalid),
        .clk_out1(aclk),
        .din(rst_slice_1_dout),
        .din1(cfg_slice_1_dout),
        .peripheral_aresetn(aresetn),
        .s_axis_tdata(hub_0_m00_axis_TDATA),
        .s_axis_tready(hub_0_m00_axis_TREADY),
        .s_axis_tvalid(hub_0_m00_axis_TVALID),
        .write_count(tx_0_write_count));
endmodule

module trx_1_imp_7ZUS0R
   (M_AXIS_DOUT_tdata,
    M_AXIS_DOUT_tvalid,
    S_AXIS_A_tdata,
    S_AXIS_A_tvalid,
    aclk,
    aresetn,
    s_axi_araddr,
    s_axi_arid,
    s_axi_arlen,
    s_axi_arready,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awid,
    s_axi_awready,
    s_axi_awvalid,
    s_axi_bid,
    s_axi_bready,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rid,
    s_axi_rlast,
    s_axi_rready,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wlast,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wvalid);
  output [47:0]M_AXIS_DOUT_tdata;
  output M_AXIS_DOUT_tvalid;
  input [15:0]S_AXIS_A_tdata;
  input S_AXIS_A_tvalid;
  input aclk;
  input aresetn;
  input [31:0]s_axi_araddr;
  input [11:0]s_axi_arid;
  input [3:0]s_axi_arlen;
  output s_axi_arready;
  input s_axi_arvalid;
  input [31:0]s_axi_awaddr;
  input [11:0]s_axi_awid;
  output s_axi_awready;
  input s_axi_awvalid;
  output [11:0]s_axi_bid;
  input s_axi_bready;
  output s_axi_bvalid;
  output [31:0]s_axi_rdata;
  output [11:0]s_axi_rid;
  output s_axi_rlast;
  input s_axi_rready;
  output s_axi_rvalid;
  input [31:0]s_axi_wdata;
  input s_axi_wlast;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;

  wire [47:0]M_AXIS_DOUT_tdata;
  wire M_AXIS_DOUT_tvalid;
  wire [15:0]S_AXIS_A_tdata;
  wire S_AXIS_A_tvalid;
  wire aclk;
  wire aresetn;
  wire [63:0]cfg_slice_0_dout;
  wire [63:0]cfg_slice_1_dout;
  wire [31:0]concat_0_dout;
  wire [159:0]hub_0_cfg_data;
  wire [31:0]hub_0_m00_axis_TDATA;
  wire hub_0_m00_axis_TREADY;
  wire hub_0_m00_axis_TVALID;
  wire [7:0]rst_slice_0_dout;
  wire [7:0]rst_slice_1_dout;
  wire [31:0]rx_0_m_axis_TDATA;
  wire rx_0_m_axis_TREADY;
  wire rx_0_m_axis_TVALID;
  wire [15:0]rx_0_read_count;
  wire [31:0]s_axi_araddr;
  wire [11:0]s_axi_arid;
  wire [3:0]s_axi_arlen;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [11:0]s_axi_awid;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire [11:0]s_axi_bid;
  wire s_axi_bready;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire [11:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wlast;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [15:0]tx_0_write_count;

  system_cfg_slice_0_1 cfg_slice_0
       (.din(hub_0_cfg_data),
        .dout(cfg_slice_0_dout));
  system_cfg_slice_1_1 cfg_slice_1
       (.din(hub_0_cfg_data),
        .dout(cfg_slice_1_dout));
  system_concat_0_1 concat_0
       (.In0(rx_0_read_count),
        .In1(tx_0_write_count),
        .dout(concat_0_dout));
  system_hub_0_1 hub_0
       (.aclk(aclk),
        .aresetn(aresetn),
        .b00_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .b01_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .b02_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .b03_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .b04_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .b05_bram_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .cfg_data(hub_0_cfg_data),
        .m00_axis_tdata(hub_0_m00_axis_TDATA),
        .m00_axis_tready(hub_0_m00_axis_TREADY),
        .m00_axis_tvalid(hub_0_m00_axis_TVALID),
        .m01_axis_tready(1'b1),
        .m02_axis_tready(1'b1),
        .m03_axis_tready(1'b1),
        .m04_axis_tready(1'b1),
        .m05_axis_tready(1'b1),
        .s00_axis_tdata(rx_0_m_axis_TDATA),
        .s00_axis_tready(rx_0_m_axis_TREADY),
        .s00_axis_tvalid(rx_0_m_axis_TVALID),
        .s01_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s01_axis_tvalid(1'b0),
        .s02_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s02_axis_tvalid(1'b0),
        .s03_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s03_axis_tvalid(1'b0),
        .s04_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s04_axis_tvalid(1'b0),
        .s05_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s05_axis_tvalid(1'b0),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awid(s_axi_awid),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wlast(s_axi_wlast),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .sts_data(concat_0_dout));
  system_rst_slice_0_1 rst_slice_0
       (.din(hub_0_cfg_data),
        .dout(rst_slice_0_dout));
  system_rst_slice_1_1 rst_slice_1
       (.din(hub_0_cfg_data),
        .dout(rst_slice_1_dout));
  rx_0_imp_3ESCUC rx_0
       (.S_AXIS_A_tdata(S_AXIS_A_tdata),
        .S_AXIS_A_tvalid(S_AXIS_A_tvalid),
        .clk_out1(aclk),
        .din(rst_slice_0_dout),
        .din1(cfg_slice_0_dout),
        .m_axis_tdata(rx_0_m_axis_TDATA),
        .m_axis_tready(rx_0_m_axis_TREADY),
        .m_axis_tvalid(rx_0_m_axis_TVALID),
        .peripheral_aresetn(aresetn),
        .read_count(rx_0_read_count));
  tx_0_imp_DAFK3 tx_0
       (.M_AXIS_DOUT_tdata(M_AXIS_DOUT_tdata),
        .M_AXIS_DOUT_tvalid(M_AXIS_DOUT_tvalid),
        .clk_out1(aclk),
        .din(rst_slice_1_dout),
        .din1(cfg_slice_1_dout),
        .peripheral_aresetn(aresetn),
        .s_axis_tdata(hub_0_m00_axis_TDATA),
        .s_axis_tready(hub_0_m00_axis_TREADY),
        .s_axis_tvalid(hub_0_m00_axis_TVALID),
        .write_count(tx_0_write_count));
endmodule

module tx_0_imp_16ZP63W
   (M_AXIS_DOUT_tdata,
    M_AXIS_DOUT_tvalid,
    clk_out1,
    din,
    din1,
    peripheral_aresetn,
    s_axis_tdata,
    s_axis_tready,
    s_axis_tvalid,
    write_count);
  output [47:0]M_AXIS_DOUT_tdata;
  output M_AXIS_DOUT_tvalid;
  input clk_out1;
  input [7:0]din;
  input [63:0]din1;
  input peripheral_aresetn;
  input [31:0]s_axis_tdata;
  output s_axis_tready;
  input s_axis_tvalid;
  output [15:0]write_count;

  wire [47:0]M_AXIS_DOUT_tdata;
  wire M_AXIS_DOUT_tvalid;
  wire [23:0]bcast_0_M00_AXIS_TDATA;
  wire bcast_0_M00_AXIS_TREADY;
  wire [0:0]bcast_0_M00_AXIS_TVALID;
  wire [47:24]bcast_0_M01_AXIS_TDATA;
  wire bcast_0_M01_AXIS_TREADY;
  wire [1:1]bcast_0_M01_AXIS_TVALID;
  wire [23:0]cic_0_M_AXIS_DATA_TDATA;
  wire cic_0_M_AXIS_DATA_TVALID;
  wire [23:0]cic_1_M_AXIS_DATA_TDATA;
  wire cic_1_M_AXIS_DATA_TVALID;
  wire clk_out1;
  wire [47:0]comb_0_M_AXIS_TDATA;
  wire comb_0_M_AXIS_TVALID;
  wire [31:0]conv_0_M_AXIS_TDATA;
  wire conv_0_M_AXIS_TREADY;
  wire conv_0_M_AXIS_TVALID;
  wire [63:0]conv_1_M_AXIS_TDATA;
  wire conv_1_M_AXIS_TREADY;
  wire conv_1_M_AXIS_TVALID;
  wire [47:0]dds_0_M_AXIS_DATA_TDATA;
  wire dds_0_M_AXIS_DATA_TVALID;
  wire [7:0]din;
  wire [63:0]din1;
  wire [63:0]fifo_0_m_axis_TDATA;
  wire fifo_0_m_axis_TREADY;
  wire fifo_0_m_axis_TVALID;
  wire [31:0]fir_0_M_AXIS_DATA_TDATA;
  wire fir_0_M_AXIS_DATA_TREADY;
  wire fir_0_M_AXIS_DATA_TVALID;
  wire [23:0]fp_0_M_AXIS_RESULT_TDATA;
  wire fp_0_M_AXIS_RESULT_TREADY;
  wire fp_0_M_AXIS_RESULT_TVALID;
  wire [63:0]lfsr_0_m_axis_TDATA;
  wire lfsr_0_m_axis_TVALID;
  wire peripheral_aresetn;
  wire [39:0]phase_0_m_axis_TDATA;
  wire phase_0_m_axis_TVALID;
  wire [15:0]rate_0_m_axis_TDATA;
  wire rate_0_m_axis_TREADY;
  wire rate_0_m_axis_TVALID;
  wire [15:0]rate_1_m_axis_TDATA;
  wire rate_1_m_axis_TREADY;
  wire rate_1_m_axis_TVALID;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [0:0]slice_0_dout;
  wire [39:0]slice_1_dout;
  wire [15:0]slice_2_dout;
  wire [15:0]write_count;

  system_bcast_0_2 bcast_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata({bcast_0_M01_AXIS_TDATA,bcast_0_M00_AXIS_TDATA}),
        .m_axis_tready({bcast_0_M01_AXIS_TREADY,bcast_0_M00_AXIS_TREADY}),
        .m_axis_tvalid({bcast_0_M01_AXIS_TVALID,bcast_0_M00_AXIS_TVALID}),
        .s_axis_tdata(conv_1_M_AXIS_TDATA),
        .s_axis_tready(conv_1_M_AXIS_TREADY),
        .s_axis_tvalid(conv_1_M_AXIS_TVALID));
  system_cic_0_1 cic_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(cic_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cic_0_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(rate_0_m_axis_TDATA),
        .s_axis_config_tready(rate_0_m_axis_TREADY),
        .s_axis_config_tvalid(rate_0_m_axis_TVALID),
        .s_axis_data_tdata(bcast_0_M00_AXIS_TDATA),
        .s_axis_data_tready(bcast_0_M00_AXIS_TREADY),
        .s_axis_data_tvalid(bcast_0_M00_AXIS_TVALID));
  system_cic_1_1 cic_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(cic_1_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cic_1_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(rate_1_m_axis_TDATA),
        .s_axis_config_tready(rate_1_m_axis_TREADY),
        .s_axis_config_tvalid(rate_1_m_axis_TVALID),
        .s_axis_data_tdata(bcast_0_M01_AXIS_TDATA),
        .s_axis_data_tready(bcast_0_M01_AXIS_TREADY),
        .s_axis_data_tvalid(bcast_0_M01_AXIS_TVALID));
  system_comb_0_2 comb_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(comb_0_M_AXIS_TDATA),
        .m_axis_tready(1'b1),
        .m_axis_tvalid(comb_0_M_AXIS_TVALID),
        .s_axis_tdata({cic_1_M_AXIS_DATA_TDATA,cic_0_M_AXIS_DATA_TDATA}),
        .s_axis_tvalid({cic_1_M_AXIS_DATA_TVALID,cic_0_M_AXIS_DATA_TVALID}));
  system_conv_0_1 conv_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(conv_0_M_AXIS_TDATA),
        .m_axis_tready(conv_0_M_AXIS_TREADY),
        .m_axis_tvalid(conv_0_M_AXIS_TVALID),
        .s_axis_tdata(fifo_0_m_axis_TDATA),
        .s_axis_tready(fifo_0_m_axis_TREADY),
        .s_axis_tvalid(fifo_0_m_axis_TVALID));
  system_conv_1_1 conv_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(conv_1_M_AXIS_TDATA),
        .m_axis_tready(conv_1_M_AXIS_TREADY),
        .m_axis_tvalid(conv_1_M_AXIS_TVALID),
        .s_axis_tdata(fir_0_M_AXIS_DATA_TDATA),
        .s_axis_tready(fir_0_M_AXIS_DATA_TREADY),
        .s_axis_tvalid(fir_0_M_AXIS_DATA_TVALID));
  system_dds_0_1 dds_0
       (.aclk(clk_out1),
        .m_axis_data_tdata(dds_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(dds_0_M_AXIS_DATA_TVALID),
        .s_axis_phase_tdata(phase_0_m_axis_TDATA),
        .s_axis_phase_tvalid(phase_0_m_axis_TVALID));
  system_fifo_0_1 fifo_0
       (.aclk(clk_out1),
        .aresetn(slice_0_dout),
        .m_axis_tdata(fifo_0_m_axis_TDATA),
        .m_axis_tready(fifo_0_m_axis_TREADY),
        .m_axis_tvalid(fifo_0_m_axis_TVALID),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .write_count(write_count));
  system_fir_0_1 fir_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(fir_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tready(fir_0_M_AXIS_DATA_TREADY),
        .m_axis_data_tvalid(fir_0_M_AXIS_DATA_TVALID),
        .s_axis_data_tdata(fp_0_M_AXIS_RESULT_TDATA),
        .s_axis_data_tready(fp_0_M_AXIS_RESULT_TREADY),
        .s_axis_data_tvalid(fp_0_M_AXIS_RESULT_TVALID));
  system_fp_0_1 fp_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_result_tdata(fp_0_M_AXIS_RESULT_TDATA),
        .m_axis_result_tready(fp_0_M_AXIS_RESULT_TREADY),
        .m_axis_result_tvalid(fp_0_M_AXIS_RESULT_TVALID),
        .s_axis_a_tdata(conv_0_M_AXIS_TDATA),
        .s_axis_a_tready(conv_0_M_AXIS_TREADY),
        .s_axis_a_tvalid(conv_0_M_AXIS_TVALID));
  system_lfsr_0_1 lfsr_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(lfsr_0_m_axis_TDATA),
        .m_axis_tready(1'b1),
        .m_axis_tvalid(lfsr_0_m_axis_TVALID));
  system_mult_0_1 mult_0
       (.aclk(clk_out1),
        .m_axis_dout_tdata(M_AXIS_DOUT_tdata),
        .m_axis_dout_tvalid(M_AXIS_DOUT_tvalid),
        .s_axis_a_tdata(comb_0_M_AXIS_TDATA),
        .s_axis_a_tvalid(comb_0_M_AXIS_TVALID),
        .s_axis_b_tdata(dds_0_M_AXIS_DATA_TDATA),
        .s_axis_b_tvalid(dds_0_M_AXIS_DATA_TVALID),
        .s_axis_ctrl_tdata(lfsr_0_m_axis_TDATA[7:0]),
        .s_axis_ctrl_tvalid(lfsr_0_m_axis_TVALID));
  system_phase_0_1 phase_0
       (.aclk(clk_out1),
        .cfg_data(slice_1_dout),
        .m_axis_tdata(phase_0_m_axis_TDATA),
        .m_axis_tvalid(phase_0_m_axis_TVALID));
  system_rate_0_1 rate_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .cfg_data(slice_2_dout),
        .m_axis_tdata(rate_0_m_axis_TDATA),
        .m_axis_tready(rate_0_m_axis_TREADY),
        .m_axis_tvalid(rate_0_m_axis_TVALID));
  system_rate_1_1 rate_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .cfg_data(slice_2_dout),
        .m_axis_tdata(rate_1_m_axis_TDATA),
        .m_axis_tready(rate_1_m_axis_TREADY),
        .m_axis_tvalid(rate_1_m_axis_TVALID));
  system_slice_0_1 slice_0
       (.din(din),
        .dout(slice_0_dout));
  system_slice_1_1 slice_1
       (.din(din1),
        .dout(slice_1_dout));
  system_slice_2_1 slice_2
       (.din(din1),
        .dout(slice_2_dout));
endmodule

module tx_0_imp_DAFK3
   (M_AXIS_DOUT_tdata,
    M_AXIS_DOUT_tvalid,
    clk_out1,
    din,
    din1,
    peripheral_aresetn,
    s_axis_tdata,
    s_axis_tready,
    s_axis_tvalid,
    write_count);
  output [47:0]M_AXIS_DOUT_tdata;
  output M_AXIS_DOUT_tvalid;
  input clk_out1;
  input [7:0]din;
  input [63:0]din1;
  input peripheral_aresetn;
  input [31:0]s_axis_tdata;
  output s_axis_tready;
  input s_axis_tvalid;
  output [15:0]write_count;

  wire [47:0]M_AXIS_DOUT_tdata;
  wire M_AXIS_DOUT_tvalid;
  wire [23:0]bcast_0_M00_AXIS_TDATA;
  wire bcast_0_M00_AXIS_TREADY;
  wire [0:0]bcast_0_M00_AXIS_TVALID;
  wire [47:24]bcast_0_M01_AXIS_TDATA;
  wire bcast_0_M01_AXIS_TREADY;
  wire [1:1]bcast_0_M01_AXIS_TVALID;
  wire [23:0]cic_0_M_AXIS_DATA_TDATA;
  wire cic_0_M_AXIS_DATA_TVALID;
  wire [23:0]cic_1_M_AXIS_DATA_TDATA;
  wire cic_1_M_AXIS_DATA_TVALID;
  wire clk_out1;
  wire [47:0]comb_0_M_AXIS_TDATA;
  wire comb_0_M_AXIS_TVALID;
  wire [31:0]conv_0_M_AXIS_TDATA;
  wire conv_0_M_AXIS_TREADY;
  wire conv_0_M_AXIS_TVALID;
  wire [63:0]conv_1_M_AXIS_TDATA;
  wire conv_1_M_AXIS_TREADY;
  wire conv_1_M_AXIS_TVALID;
  wire [47:0]dds_0_M_AXIS_DATA_TDATA;
  wire dds_0_M_AXIS_DATA_TVALID;
  wire [7:0]din;
  wire [63:0]din1;
  wire [63:0]fifo_0_m_axis_TDATA;
  wire fifo_0_m_axis_TREADY;
  wire fifo_0_m_axis_TVALID;
  wire [31:0]fir_0_M_AXIS_DATA_TDATA;
  wire fir_0_M_AXIS_DATA_TREADY;
  wire fir_0_M_AXIS_DATA_TVALID;
  wire [23:0]fp_0_M_AXIS_RESULT_TDATA;
  wire fp_0_M_AXIS_RESULT_TREADY;
  wire fp_0_M_AXIS_RESULT_TVALID;
  wire [63:0]lfsr_0_m_axis_TDATA;
  wire lfsr_0_m_axis_TVALID;
  wire peripheral_aresetn;
  wire [39:0]phase_0_m_axis_TDATA;
  wire phase_0_m_axis_TVALID;
  wire [15:0]rate_0_m_axis_TDATA;
  wire rate_0_m_axis_TREADY;
  wire rate_0_m_axis_TVALID;
  wire [15:0]rate_1_m_axis_TDATA;
  wire rate_1_m_axis_TREADY;
  wire rate_1_m_axis_TVALID;
  wire [31:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [0:0]slice_0_dout;
  wire [39:0]slice_1_dout;
  wire [15:0]slice_2_dout;
  wire [15:0]write_count;

  system_bcast_0_4 bcast_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata({bcast_0_M01_AXIS_TDATA,bcast_0_M00_AXIS_TDATA}),
        .m_axis_tready({bcast_0_M01_AXIS_TREADY,bcast_0_M00_AXIS_TREADY}),
        .m_axis_tvalid({bcast_0_M01_AXIS_TVALID,bcast_0_M00_AXIS_TVALID}),
        .s_axis_tdata(conv_1_M_AXIS_TDATA),
        .s_axis_tready(conv_1_M_AXIS_TREADY),
        .s_axis_tvalid(conv_1_M_AXIS_TVALID));
  system_cic_0_3 cic_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(cic_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cic_0_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(rate_0_m_axis_TDATA),
        .s_axis_config_tready(rate_0_m_axis_TREADY),
        .s_axis_config_tvalid(rate_0_m_axis_TVALID),
        .s_axis_data_tdata(bcast_0_M00_AXIS_TDATA),
        .s_axis_data_tready(bcast_0_M00_AXIS_TREADY),
        .s_axis_data_tvalid(bcast_0_M00_AXIS_TVALID));
  system_cic_1_3 cic_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(cic_1_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cic_1_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(rate_1_m_axis_TDATA),
        .s_axis_config_tready(rate_1_m_axis_TREADY),
        .s_axis_config_tvalid(rate_1_m_axis_TVALID),
        .s_axis_data_tdata(bcast_0_M01_AXIS_TDATA),
        .s_axis_data_tready(bcast_0_M01_AXIS_TREADY),
        .s_axis_data_tvalid(bcast_0_M01_AXIS_TVALID));
  system_comb_0_4 comb_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(comb_0_M_AXIS_TDATA),
        .m_axis_tready(1'b1),
        .m_axis_tvalid(comb_0_M_AXIS_TVALID),
        .s_axis_tdata({cic_1_M_AXIS_DATA_TDATA,cic_0_M_AXIS_DATA_TDATA}),
        .s_axis_tvalid({cic_1_M_AXIS_DATA_TVALID,cic_0_M_AXIS_DATA_TVALID}));
  system_conv_0_3 conv_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(conv_0_M_AXIS_TDATA),
        .m_axis_tready(conv_0_M_AXIS_TREADY),
        .m_axis_tvalid(conv_0_M_AXIS_TVALID),
        .s_axis_tdata(fifo_0_m_axis_TDATA),
        .s_axis_tready(fifo_0_m_axis_TREADY),
        .s_axis_tvalid(fifo_0_m_axis_TVALID));
  system_conv_1_3 conv_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(conv_1_M_AXIS_TDATA),
        .m_axis_tready(conv_1_M_AXIS_TREADY),
        .m_axis_tvalid(conv_1_M_AXIS_TVALID),
        .s_axis_tdata(fir_0_M_AXIS_DATA_TDATA),
        .s_axis_tready(fir_0_M_AXIS_DATA_TREADY),
        .s_axis_tvalid(fir_0_M_AXIS_DATA_TVALID));
  system_dds_0_3 dds_0
       (.aclk(clk_out1),
        .m_axis_data_tdata(dds_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(dds_0_M_AXIS_DATA_TVALID),
        .s_axis_phase_tdata(phase_0_m_axis_TDATA),
        .s_axis_phase_tvalid(phase_0_m_axis_TVALID));
  system_fifo_0_3 fifo_0
       (.aclk(clk_out1),
        .aresetn(slice_0_dout),
        .m_axis_tdata(fifo_0_m_axis_TDATA),
        .m_axis_tready(fifo_0_m_axis_TREADY),
        .m_axis_tvalid(fifo_0_m_axis_TVALID),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .write_count(write_count));
  system_fir_0_3 fir_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_data_tdata(fir_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tready(fir_0_M_AXIS_DATA_TREADY),
        .m_axis_data_tvalid(fir_0_M_AXIS_DATA_TVALID),
        .s_axis_data_tdata(fp_0_M_AXIS_RESULT_TDATA),
        .s_axis_data_tready(fp_0_M_AXIS_RESULT_TREADY),
        .s_axis_data_tvalid(fp_0_M_AXIS_RESULT_TVALID));
  system_fp_0_3 fp_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_result_tdata(fp_0_M_AXIS_RESULT_TDATA),
        .m_axis_result_tready(fp_0_M_AXIS_RESULT_TREADY),
        .m_axis_result_tvalid(fp_0_M_AXIS_RESULT_TVALID),
        .s_axis_a_tdata(conv_0_M_AXIS_TDATA),
        .s_axis_a_tready(conv_0_M_AXIS_TREADY),
        .s_axis_a_tvalid(conv_0_M_AXIS_TVALID));
  system_lfsr_0_3 lfsr_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .m_axis_tdata(lfsr_0_m_axis_TDATA),
        .m_axis_tready(1'b1),
        .m_axis_tvalid(lfsr_0_m_axis_TVALID));
  system_mult_0_3 mult_0
       (.aclk(clk_out1),
        .m_axis_dout_tdata(M_AXIS_DOUT_tdata),
        .m_axis_dout_tvalid(M_AXIS_DOUT_tvalid),
        .s_axis_a_tdata(comb_0_M_AXIS_TDATA),
        .s_axis_a_tvalid(comb_0_M_AXIS_TVALID),
        .s_axis_b_tdata(dds_0_M_AXIS_DATA_TDATA),
        .s_axis_b_tvalid(dds_0_M_AXIS_DATA_TVALID),
        .s_axis_ctrl_tdata(lfsr_0_m_axis_TDATA[7:0]),
        .s_axis_ctrl_tvalid(lfsr_0_m_axis_TVALID));
  system_phase_0_3 phase_0
       (.aclk(clk_out1),
        .cfg_data(slice_1_dout),
        .m_axis_tdata(phase_0_m_axis_TDATA),
        .m_axis_tvalid(phase_0_m_axis_TVALID));
  system_rate_0_3 rate_0
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .cfg_data(slice_2_dout),
        .m_axis_tdata(rate_0_m_axis_TDATA),
        .m_axis_tready(rate_0_m_axis_TREADY),
        .m_axis_tvalid(rate_0_m_axis_TVALID));
  system_rate_1_3 rate_1
       (.aclk(clk_out1),
        .aresetn(peripheral_aresetn),
        .cfg_data(slice_2_dout),
        .m_axis_tdata(rate_1_m_axis_TDATA),
        .m_axis_tready(rate_1_m_axis_TREADY),
        .m_axis_tvalid(rate_1_m_axis_TVALID));
  system_slice_0_3 slice_0
       (.din(din),
        .dout(slice_0_dout));
  system_slice_1_3 slice_1
       (.din(din1),
        .dout(slice_1_dout));
  system_slice_2_3 slice_2
       (.din(din1),
        .dout(slice_2_dout));
endmodule

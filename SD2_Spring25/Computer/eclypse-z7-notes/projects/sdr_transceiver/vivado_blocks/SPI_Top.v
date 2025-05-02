module SPI_2x #(
  parameter integer CLK_DIV          = 8,   // Clock divider for both SPI masters
  parameter integer SPI_DATA_WIDTH_1 = 32,  // Data width for SPI Master 1
  parameter integer SPI_DATA_WIDTH_2 = 8    // Data width for SPI Master 2
)(
  input  wire        clk,
  input  wire        aresetn,

  // AXI-Stream to SPI master 1
  input  wire [31:0] s_axis_tdata_1,
  input  wire        s_axis_tvalid_1,
  output wire        s_axis_tready_1,

  // AXI-Stream to SPI master 2
  input  wire [31:0] s_axis_tdata_2,
  input  wire        s_axis_tvalid_2,
  output wire        s_axis_tready_2,

  // SPI outputs
  output wire        sck,   // Shared SCK
  output wire        cs_1,
  output wire        cs_2,
  output wire        mosi,
  output wire        miso  // Placeholder for now
);

  wire mosi_1, mosi_2;
  wire sck_1, sck_2;
  wire busy_1, busy_2;

  wire spi1_selected;
  wire spi2_selected;

  //----------------------------------------------------------------
  // SPI Master 1
  //----------------------------------------------------------------
  axis_spi_QR #(
    .SPI_DATA_WIDTH(SPI_DATA_WIDTH_1),
    .CLK_DIV(CLK_DIV)
  ) spi_master_1 (
    .clk(clk),
    .aresetn(aresetn),
    .s_axis_tdata(s_axis_tdata_1),
    .s_axis_tvalid(spi1_selected),
    .s_axis_tready(axis_ready_1),
    .MOSI(mosi_1),
    .SCK(sck_1),
    .CS(cs_1),
    .busy(busy_1)
  );

  //----------------------------------------------------------------
  // SPI Master 2
  //----------------------------------------------------------------
  axis_spi_QR #(
    .SPI_DATA_WIDTH(SPI_DATA_WIDTH_2),
    .CLK_DIV(CLK_DIV)
  ) spi_master_2 (
    .clk(clk),
    .aresetn(aresetn),
    .s_axis_tdata(s_axis_tdata_2),
    .s_axis_tvalid(spi2_selected),
    .s_axis_tready(axis_ready_2),
    .MOSI(mosi_2),
    .SCK(sck_2),
    .CS(cs_2),
    .busy(busy_2)
  );

  //----------------------------------------------------------------
  // Gating logic
  //----------------------------------------------------------------
  assign spi1_selected = s_axis_tvalid_1 & ~busy_1;
  assign spi2_selected = s_axis_tvalid_2 & ~busy_1 & ~busy_2 & ~s_axis_tvalid_1;

  assign s_axis_tready_1 = ~busy_1;
  assign s_axis_tready_2 = ~busy_1 & ~s_axis_tvalid_1;

  //----------------------------------------------------------------
  // Shared SCK and MOSI outputs
  //----------------------------------------------------------------
  assign sck = (!cs_1) ? sck_1 :
               (!cs_2) ? sck_2 : 1'b0;

  assign mosi = (!cs_1) ? mosi_1 :
                (!cs_2) ? mosi_2 : 1'b0;

  assign miso = 1'bz; // placeholder

endmodule

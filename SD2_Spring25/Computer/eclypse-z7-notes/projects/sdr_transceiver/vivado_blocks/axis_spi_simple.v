`timescale 1 ns / 1 ps

module axis_spi_QR #
(
  parameter integer SPI_DATA_WIDTH = 32,  // Can be 8, 16, 24, or 32
  parameter integer CLK_DIV = 4           // Must be >= 2
)
(
  input  wire              clk,
  input  wire              resetn,

  // AXI-Stream slave
  input  wire [31:0]       s_axis_tdata,
  input  wire              s_axis_tvalid,
  output wire              s_axis_tready,

  // SPI signals
  output wire              MOSI,
  output wire              SCK,
  output wire              CS,
  output wire              busy        // High when transferring
);

  // Internal registers
  reg [31:0] shift_reg = 32'h0000_0000;
  reg [5:0]  bit_cnt = 0;
  reg [15:0] clk_cnt = 0;
  reg        sck_reg = 0;
  reg        cs_n_reg = 1;
  reg        busy_reg = 0;

  assign MOSI = shift_reg[SPI_DATA_WIDTH-1];  // MOSI
  assign SCK = sck_reg;        // SCK
  assign CS = cs_n_reg;       // CS_N

  assign s_axis_tready = ~busy_reg;
  assign busy = busy_reg;

  always @(posedge clk) begin
    if (!resetn) begin
      shift_reg <= 32'h0000_0000;
      bit_cnt   <= 0;
      clk_cnt   <= 0;
      sck_reg   <= 0;
      cs_n_reg  <= 1;
      busy_reg  <= 0;
    end else begin
      if (s_axis_tvalid && s_axis_tready) begin
        // Start new transfer
        shift_reg <= s_axis_tdata;
        bit_cnt   <= SPI_DATA_WIDTH;
        clk_cnt   <= 0;
        sck_reg   <= 0;
        cs_n_reg  <= 0;
        busy_reg  <= 1;
      end else if (busy_reg) begin
        clk_cnt <= clk_cnt + 1;

        if (clk_cnt == (CLK_DIV / 2 - 1)) begin
          sck_reg <= 1;  // Rising edge (sampling point for slave)
        end

        if (clk_cnt == (CLK_DIV - 1)) begin
          sck_reg <= 0;  // Falling edge (shift data)
          clk_cnt <= 0;
          shift_reg <= {shift_reg[30:0], 1'b0};
          bit_cnt <= bit_cnt - 1;

          if (bit_cnt == 1) begin
            busy_reg <= 0;
            cs_n_reg <= 1;
          end
        end
      end
    end
  end
endmodule

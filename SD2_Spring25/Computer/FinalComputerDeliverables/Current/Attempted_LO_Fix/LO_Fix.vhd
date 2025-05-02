library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADF4351_SPI_AXI is
    Port (
        clk           : in  std_logic;
        rst_n         : in  std_logic;

        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        s_axis_tdata  : in  std_logic_vector(31 downto 0);

        spi_clk       : out std_logic;
        spi_mosi      : out std_logic;
        spi_cs        : out std_logic := '0';

        spi_done      : out std_logic
    );
end ADF4351_SPI_AXI;

architecture Behavioral of ADF4351_SPI_AXI is
    type state_type is (IDLE, LOAD, SHIFT_HIGH, SHIFT_LOW, DONE);
    signal state         : state_type := IDLE;

    signal shift_reg     : std_logic_vector(31 downto 0) := (others => '0');
    signal bit_cnt       : integer range 0 to 31 := 0;

    signal spi_clk_reg   : std_logic := '0';
    signal spi_mosi_reg  : std_logic := '0';
    signal spi_done_reg  : std_logic := '0';

    signal clk_div_cnt   : integer range 0 to 3 := 0;
    constant CLK_DIV     : integer := 2;
begin

    s_axis_tready <= '1';
    spi_clk       <= spi_clk_reg;
    spi_mosi      <= spi_mosi_reg;
    spi_done      <= spi_done_reg;

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state         <= IDLE;
            shift_reg     <= (others => '0');
            bit_cnt       <= 0;
            spi_clk_reg   <= '0';
            spi_mosi_reg  <= '0';
            spi_done_reg  <= '0';
            clk_div_cnt   <= 0;
        elsif rising_edge(clk) then
            spi_done_reg <= '0';

            case state is
                when IDLE =>
                    spi_clk_reg <= '0';
                    if s_axis_tvalid = '1' then
                        shift_reg     <= s_axis_tdata;
                        bit_cnt       <= 31;
                        spi_mosi_reg  <= s_axis_tdata(31);
                        clk_div_cnt   <= CLK_DIV;
                        state         <= SHIFT_HIGH;
                    end if;

                when SHIFT_HIGH =>
                    if clk_div_cnt = 0 then
                        spi_clk_reg <= '1';
                        clk_div_cnt <= CLK_DIV;
                        state       <= SHIFT_LOW;
                    else
                        clk_div_cnt <= clk_div_cnt - 1;
                    end if;

                when SHIFT_LOW =>
                    if clk_div_cnt = 0 then
                        spi_clk_reg <= '0';
                        clk_div_cnt <= CLK_DIV;
                        if bit_cnt = 0 then
                            state <= DONE;
                        else
                            bit_cnt       <= bit_cnt - 1;
                            shift_reg     <= shift_reg(30 downto 0) & '0';
                            spi_mosi_reg  <= shift_reg(30);  -- next MSB
                            state         <= SHIFT_HIGH;
                        end if;
                    else
                        clk_div_cnt <= clk_div_cnt - 1;
                    end if;

                when DONE =>
                    spi_done_reg <= '1';
                    state        <= IDLE;

                when others =>
                    state <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;

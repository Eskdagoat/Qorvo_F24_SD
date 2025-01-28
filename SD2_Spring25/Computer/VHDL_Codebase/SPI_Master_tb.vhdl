library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Testbench for SPI_Master
entity SPI_Master_tb is
-- Testbench has no ports
end SPI_Master_tb;

architecture Behavioral of SPI_Master_tb is

    -- Component declaration for the SPI_Master
    component SPI_Master is
        Port (
            clk           : in  STD_LOGIC;
            reset         : in  STD_LOGIC;

            -- Control signals
            start_exp     : in  STD_LOGIC;
            start_lo      : in  STD_LOGIC;
            busy          : out STD_LOGIC;

            -- SPI signals
            SCK           : out STD_LOGIC;
            MOSI          : out STD_LOGIC;
            MISO          : in  STD_LOGIC;
            CS_Exp        : out STD_LOGIC;
            CS_LO         : out STD_LOGIC;

            -- Data interface
            data_in       : in  STD_LOGIC_VECTOR(7 downto 0);
            data_out      : out STD_LOGIC_VECTOR(7 downto 0);
            done          : out STD_LOGIC
        );
    end component;

    -- Internal signals
    signal clk         : STD_LOGIC := '0';          -- 10 MHz Clock signal
    signal reset       : STD_LOGIC := '0';          -- Reset signal
    signal start_exp   : STD_LOGIC := '0';          -- Start communication with Exp
    signal start_lo    : STD_LOGIC := '0';          -- Start communication with LO
    signal busy        : STD_LOGIC;                 -- Busy signal from SPI_Master

    signal SCK         : STD_LOGIC;                 -- SPI Clock
    signal MOSI        : STD_LOGIC;                 -- Master Out Slave In
    signal MISO        : STD_LOGIC := '0';          -- Master In Slave Out
    signal CS_Exp      : STD_LOGIC;                 -- Chip-select for Exp
    signal CS_LO       : STD_LOGIC;                 -- Chip-select for LO

    signal data_in     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- Data to send
    signal data_out    : STD_LOGIC_VECTOR(7 downto 0);                    -- Data received
    signal done        : STD_LOGIC;                 -- Done signal from SPI_Master

    -- Clock generation: 10 MHz clock
    constant CLK_PERIOD : time := 100 ns; -- Period for 10 MHz clock

begin

    -- Instantiate the SPI_Master
    uut: SPI_Master
        Port map (
            clk         => clk,
            reset       => reset,
            start_exp   => start_exp,
            start_lo    => start_lo,
            busy        => busy,
            SCK         => SCK,
            MOSI        => MOSI,
            MISO        => MISO,
            CS_Exp      => CS_Exp,
            CS_LO       => CS_LO,
            data_in     => data_in,
            data_out    => data_out,
            done        => done
        );

    -- Clock process to generate a 10 MHz clock signal
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimulus process to test the SPI_Master
    stimulus : process
    begin
        -- Reset the system
        reset <= '1';
        wait for 2 * CLK_PERIOD;
        reset <= '0';

        -- Test communication with Exp (MCP23017)
        data_in <= "10101010";  -- Example data to send
        start_exp <= '1';        -- Start communication with Exp
        wait for CLK_PERIOD;
        start_exp <= '0';        -- Deassert start signal

        wait until done = '1';   -- Wait until transaction completes
        assert (data_out = "01010101") report "Test failed for Exp!" severity error;

        -- Test communication with LO (ADF4351)
        data_in <= "11001100";  -- Example data to send
        start_lo <= '1';         -- Start communication with LO
        wait for CLK_PERIOD;
        start_lo <= '0';         -- Deassert start signal

        wait until done = '1';   -- Wait until transaction completes
        assert (data_out = "00110011") report "Test failed for LO!" severity error;

        -- End simulation
        wait for 10 * CLK_PERIOD;
        assert false report "Simulation completed successfully!" severity note;
        wait;
    end process;

end Behavioral;

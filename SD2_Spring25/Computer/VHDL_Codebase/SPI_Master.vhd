library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- SPI Master Module
-- This module supports two devices:
-- 1. Exp: MCP23017 (16-bit transactions)
-- 2. LO: ADF4351 (32-bit transactions)
-- It manages SPI communication, timing, and device-specific requirements.

entity SPI_Master is
    Port (
        clk           : in  STD_LOGIC;               -- 10 MHz Clock input
        reset         : in  STD_LOGIC;               -- Reset signal

        -- Control signals
        start_exp     : in  STD_LOGIC;               -- Start communication with Exp (MCP23017)
        start_lo      : in  STD_LOGIC;               -- Start communication with LO (ADF4351)
        busy          : out STD_LOGIC;               -- Indicates SPI transaction is ongoing

        -- SPI signals
        SCK           : out STD_LOGIC;               -- SPI Clock
        MOSI          : out STD_LOGIC;               -- Master Out Slave In
        MISO          : in  STD_LOGIC;               -- Master In Slave Out
        CS_Exp        : out STD_LOGIC;               -- Chip-select for Exp (MCP23017)
        CS_LO         : out STD_LOGIC;               -- Chip-select for LO (ADF4351)

        -- Data interface
        data_in       : in  STD_LOGIC_VECTOR(31 downto 0); -- Data to be transmitted
        data_out      : out STD_LOGIC_VECTOR(31 downto 0); -- Data received from the device
        done          : out STD_LOGIC                -- Indicates transaction completion
    );
end SPI_Master;

architecture Behavioral of SPI_Master is

    -- Internal signals
    signal bit_counter : integer range 0 to 31 := 0; -- Counts bits sent/received
    signal shift_reg   : STD_LOGIC_VECTOR(31 downto 0); -- Shift register for MOSI
    signal rx_reg      : STD_LOGIC_VECTOR(31 downto 0); -- Shift register for MISO
    signal state       : integer range 0 to 2 := 0;  -- FSM state (0=Idle, 1=Transmit, 2=Complete)
    signal cs_active   : STD_LOGIC := '0';           -- Active device chip-select
    signal active_bits : integer := 16;             -- Number of bits for current transaction (16 or 32)

begin

    -- SPI Clock directly driven by 10 MHz clock input
    SCK <= clk;

    -- Main FSM for SPI communication
    process (clk, reset)
    begin
        if reset = '1' then
            -- Reset all signals
            MOSI <= '0';
            CS_Exp <= '1';
            CS_LO <= '1';
            state <= 0;
            bit_counter <= 0;
            shift_reg <= (others => '0');
            rx_reg <= (others => '0');
            done <= '0';
            busy <= '0';
            active_bits <= 16;
        elsif rising_edge(clk) then
            case state is
                when 0 =>  -- Idle state
                    done <= '0';
                    busy <= '0';
                    CS_Exp <= '1';
                    CS_LO <= '1';

                    -- Start transaction based on control signals
                    if start_exp = '1' and start_lo = '0' then
                        CS_Exp <= '0';
                        cs_active <= '0';
                        shift_reg <= (others => '0');
                        shift_reg(15 downto 0) <= data_in(15 downto 0); -- Use 16 bits for Exp
                        active_bits <= 16;
                        state <= 1;
                        busy <= '1';
                    elsif start_lo = '1' and start_exp = '0' then
                        CS_LO <= '0';
                        cs_active <= '1';
                        shift_reg <= data_in; -- Use full 32 bits for LO
                        active_bits <= 32;
                        state <= 1;
                        busy <= '1';
                    end if;

                when 1 =>  -- Transmit state
                    -- Send data on MOSI
                    MOSI <= shift_reg(31);
                    shift_reg <= shift_reg(30 downto 0) & '0';

                    -- Read data from MISO
                    rx_reg <= rx_reg(30 downto 0) & MISO;
                    bit_counter <= bit_counter + 1;

                    if bit_counter = (active_bits - 1) then
                        state <= 2;  -- Move to complete state
                    end if;

                when 2 =>  -- Complete state
                    -- Deactivate the appropriate chip-select line
                    if cs_active = '0' then
                        CS_Exp <= '1';
                    elsif cs_active = '1' then
                        CS_LO <= '1';
                    end if;

                    -- Output the received data and complete the transaction
                    data_out <= rx_reg;
                    done <= '1';
                    state <= 0;  -- Return to idle
            end case;
        end if;
    end process;

end Behavioral;

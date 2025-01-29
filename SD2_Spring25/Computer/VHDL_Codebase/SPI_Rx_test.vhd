library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SPI_Master is
    Port (
        clk           : in  STD_LOGIC;               -- 10 MHz Clock input
        reset         : in  STD_LOGIC;               -- Reset signal

        -- Control signals
        start_exp     : in  STD_LOGIC;               -- Start communication with Exp (MCP23017)
        start_lo      : in  STD_LOGIC;               -- Start communication with LO (ADF4351)
        read_exp      : in  STD_LOGIC;               -- Read from Exp (MCP23017)
        busy          : out STD_LOGIC;               -- Indicates SPI transaction is ongoing

        -- SPI signals
        SCK           : out STD_LOGIC;               -- SPI Clock
        MOSI          : out STD_LOGIC;               -- Master Out Slave In
        MISO          : in  STD_LOGIC;               -- Master In Slave Out
        CS_Exp        : out STD_LOGIC;               -- Chip-select for Exp (MCP23017)
        CS_LO         : out STD_LOGIC;               -- Chip-select for LO (ADF4351)

        -- Data interface
        data_in       : in  STD_LOGIC_VECTOR(31 downto 0); -- Data to be transmitted
        data_out      : out STD_LOGIC_VECTOR(15 downto 0); -- Data received from SPI (16 bits for Exp)
        muxout_status : in  STD_LOGIC;               -- MUXOUT status from ADF4351
        muxout_flag   : out STD_LOGIC;               -- MUXOUT signal captured
        done          : out STD_LOGIC                -- Indicates transaction completion
    );
end SPI_Master;

architecture Behavioral of SPI_Master is

    -- Internal signals
    signal bit_counter : integer range 0 to 15 := 0; -- Adjusted for 16-bit data from Exp
    signal shift_reg   : STD_LOGIC_VECTOR(31 downto 0);
    signal rx_reg      : STD_LOGIC_VECTOR(15 downto 0); -- Adjusted for 16-bit data from Exp
    signal state       : integer range 0 to 3 := 0;  -- FSM states
    signal cs_active   : STD_LOGIC := '0';           -- Active CS
    signal active_bits : integer := 16;
    signal mux_prev    : STD_LOGIC := '0';           -- Previous MUXOUT state

begin
    SCK <= clk;  -- SPI clock driven directly by system clock

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
            muxout_flag <= '0';
        elsif rising_edge(clk) then
            case state is
                when 0 =>  -- Idle state
                    done <= '0';
                    busy <= '0';
                    CS_Exp <= '1';
                    CS_LO <= '1';
                    
                    if start_exp = '1' then
                        CS_Exp <= '0';
                        shift_reg(15 downto 0) <= data_in(15 downto 0);
                        active_bits <= 16;
                        state <= 1;
                        busy <= '1';
                    elsif start_lo = '1' then
                        CS_LO <= '0';
                        shift_reg <= data_in;
                        active_bits <= 32;
                        state <= 1;
                        busy <= '1';
                    elsif read_exp = '1' then  -- Read from MCP23017
                        CS_Exp <= '0';
                        shift_reg(15 downto 0) <= x"41" & x"00";  -- Read opcode + register address
                        active_bits <= 16;
                        state <= 1;
                        busy <= '1';
                    end if;
                
                when 1 =>  -- Transmit and receive
                    MOSI <= shift_reg(31);
                    shift_reg <= shift_reg(30 downto 0) & '0';
                    rx_reg <= rx_reg(14 downto 0) & MISO; -- Capture only 16 bits for Exp
                    bit_counter <= bit_counter + 1;

                    if bit_counter = (active_bits - 1) then
                        state <= 2;
                    end if;
                
                when 2 =>  -- Complete transaction
                    if start_exp = '1' or read_exp = '1' then
                        CS_Exp <= '1';
                    elsif start_lo = '1' then
                        CS_LO <= '1';
                    end if;
                    
                    data_out <= rx_reg;  -- Only 16 bits for Exp
                    done <= '1';
                    state <= 0;
            end case;
        end if;
    end process;

    -- Monitor MUXOUT status from ADF4351
    process (clk)
    begin
        if rising_edge(clk) then
            if mux_prev = '0' and muxout_status = '1' then
                muxout_flag <= '1';  -- Rising edge detected
            else
                muxout_flag <= '0';
            end if;
            mux_prev <= muxout_status;
        end if;
    end process;

end Behavioral;

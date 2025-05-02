library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AXIS_LE_Controller is
    Port (
        clk           : in  std_logic;
        rst_n         : in  std_logic;

        s_axis_tvalid : in  std_logic;
        s_axis_tready : out std_logic;
        s_axis_tdata  : in  std_logic_vector(31 downto 0);

        le_out        : out std_logic
    );
end AXIS_LE_Controller;

architecture Behavioral of AXIS_LE_Controller is
    type state_type is (IDLE, WAIT_SPI, PULSE_LE, HOLD_LOW);
    signal state       : state_type := IDLE;
    signal le_reg      : std_logic := '0';
    signal wait_count  : integer range 0 to 15 := 0;

    constant SPI_WAIT_CYCLES : integer := 4;
    constant LE_PULSE_CYCLES : integer := 1;
begin

    s_axis_tready <= '1';
    le_out <= le_reg;

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state      <= IDLE;
            le_reg     <= '0';
            wait_count <= 0;
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    if s_axis_tvalid = '1' then
                        state <= WAIT_SPI;
                        wait_count <= SPI_WAIT_CYCLES;
                    end if;

                when WAIT_SPI =>
                    if wait_count = 0 then
                        state <= PULSE_LE;
                        le_reg <= '1';
                        wait_count <= LE_PULSE_CYCLES;
                    else
                        wait_count <= wait_count - 1;
                    end if;

                when PULSE_LE =>
                    if wait_count = 0 then
                        le_reg <= '0';
                        state <= HOLD_LOW;
                        wait_count <= 1;
                    else
                        wait_count <= wait_count - 1;
                    end if;

                when HOLD_LOW =>
                    state <= IDLE;
            end case;
        end if;
    end process;
end Behavioral;

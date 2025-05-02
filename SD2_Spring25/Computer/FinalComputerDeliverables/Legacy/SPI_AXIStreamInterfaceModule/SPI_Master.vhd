library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPI_Master_8bit is
    port (
        clk_in   : in  std_logic;   -- system clock
        reset_in : in  std_logic;   -- active-high reset

        start    : in  std_logic;   -- begin an 8-bit SPI transfer
        done     : out std_logic;   -- 1-cycle pulse when transfer finishes

        data_in  : in  std_logic_vector(7 downto 0); -- byte to transmit
        data_out : out std_logic_vector(7 downto 0); -- read from MISO

        -- SPI lines (Mode 0)
        sck      : out std_logic;  -- SPI clock
        mosi     : out std_logic;  -- MOSI
        miso     : in  std_logic   -- MISO
    );
end SPI_Master_8bit;

architecture Behavioral of SPI_Master_8bit is

    type spi_state_type is (IDLE, SHIFT, COMPLETE);
    signal state       : spi_state_type := IDLE;
    signal bit_counter : natural range 0 to 7 := 0;

    -- Internal shift registers
    signal shift_tx : std_logic_vector(7 downto 0) := (others => '0');
    signal shift_rx : std_logic_vector(7 downto 0) := (others => '0');

    -- Generate sck at half the input frequency
    signal sck_reg  : std_logic := '0';
    signal clk_div  : integer := 0;

    signal sck_prev : std_logic := '0';

begin

    ----------------------------------------------------------------------------
    -- 1) Generate SPI clock at half system clock (Mode 0 => idle low)
    ----------------------------------------------------------------------------
    process(clk_in, reset_in)
    begin
        if reset_in='1' then
            sck_reg <= '0';
            clk_div <= 0;
        elsif rising_edge(clk_in) then
            clk_div <= clk_div + 1;
            if clk_div = 0 then
                sck_reg <= not sck_reg;
                clk_div <= 0;
            end if;
        end if;
    end process;

    sck <= sck_reg;

    ----------------------------------------------------------------------------
    -- 2) Main FSM: SHIFT on falling edge, SAMPLE on rising edge
    ----------------------------------------------------------------------------
    process(clk_in, reset_in)
    begin
        if reset_in='1' then
            state       <= IDLE;
            bit_counter <= 0;
            shift_tx    <= (others => '0');
            shift_rx    <= (others => '0');
            data_out    <= (others => '0');
            mosi        <= '0';
            sck_prev    <= '0';
            done        <= '0';

        elsif rising_edge(clk_in) then
            sck_prev <= sck_reg;
            done <= '0';  -- default each cycle

            case state is
                when IDLE =>
                    if start='1' then
                        shift_tx    <= data_in;
                        bit_counter <= 0;
                        state       <= SHIFT;
                    end if;

                when SHIFT =>
                    -- detect falling edge of sck => shift out MSB
                    if (sck_reg='0' and sck_prev='1') then
                        mosi <= shift_tx(7);
                        shift_tx <= shift_tx(6 downto 0) & '0';

                    -- detect rising edge of sck => sample miso
                    elsif (sck_reg='1' and sck_prev='0') then
                        shift_rx <= shift_rx(6 downto 0) & miso;
                        bit_counter <= bit_counter + 1;

                        if bit_counter=7 then
                            state <= COMPLETE;
                        end if;
                    end if;

                when COMPLETE =>
                    data_out <= shift_rx;
                    done <= '1';
                    state <= IDLE;
            end case;
        end if;
    end process;

end Behavioral;

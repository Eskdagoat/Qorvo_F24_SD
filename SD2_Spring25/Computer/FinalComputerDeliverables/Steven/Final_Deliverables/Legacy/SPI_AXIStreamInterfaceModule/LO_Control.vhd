library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LO_Controller is
    port (
        clk_in    : in  std_logic;
        reset_in  : in  std_logic;

        -- 6 registers from the top-level
        reg5_in   : in  std_logic_vector(31 downto 0);
        reg4_in   : in  std_logic_vector(31 downto 0);
        reg3_in   : in  std_logic_vector(31 downto 0);
        reg2_in   : in  std_logic_vector(31 downto 0);
        reg1_in   : in  std_logic_vector(31 downto 0);
        reg0_in   : in  std_logic_vector(31 downto 0);

        start_lo  : in  std_logic;
        busy_lo   : out std_logic;
        done_lo   : out std_logic;

        -- SPI signals
        spi_done  : in  std_logic;
        spi_start : out std_logic;
        spi_tx    : out std_logic_vector(7 downto 0);

        cs_lo_n   : out std_logic;

        muxout_lo   : in  std_logic;
        lock_detect : out std_logic
    );
end LO_Controller;

architecture Behavioral of LO_Controller is

    type lo_state_type is (
        IDLE,
        -- R5
        R5_BYTE0, R5_WAIT0, R5_BYTE1, R5_WAIT1, R5_BYTE2, R5_WAIT2, R5_BYTE3, R5_WAIT3, R5_LATCH,
        -- R4
        R4_BYTE0, R4_WAIT0, R4_BYTE1, R4_WAIT1, R4_BYTE2, R4_WAIT2, R4_BYTE3, R4_WAIT3, R4_LATCH,
        -- R3
        R3_BYTE0, R3_WAIT0, R3_BYTE1, R3_WAIT1, R3_BYTE2, R3_WAIT2, R3_BYTE3, R3_WAIT3, R3_LATCH,
        -- R2
        R2_BYTE0, R2_WAIT0, R2_BYTE1, R2_WAIT1, R2_BYTE2, R2_WAIT2, R2_BYTE3, R2_WAIT3, R2_LATCH,
        -- R1
        R1_BYTE0, R1_WAIT0, R1_BYTE1, R1_WAIT1, R1_BYTE2, R1_WAIT2, R1_BYTE3, R1_WAIT3, R1_LATCH,
        -- R0
        R0_BYTE0, R0_WAIT0, R0_BYTE1, R0_WAIT1, R0_BYTE2, R0_WAIT2, R0_BYTE3, R0_WAIT3, R0_LATCH,
        COMPLETE
    );

    signal state       : lo_state_type := IDLE;
    signal busy_int    : std_logic := '0';
    signal done_int    : std_logic := '0';
    signal current_reg : std_logic_vector(31 downto 0) := (others => '0');

begin

    busy_lo <= busy_int;
    done_lo <= done_int;
    lock_detect <= muxout_lo; -- pass muxout to external lock detect line

    process(clk_in, reset_in)
    begin
        if reset_in='1' then
            state       <= IDLE;
            cs_lo_n     <= '1';
            spi_start   <= '0';
            spi_tx      <= (others => '0');
            busy_int    <= '0';
            done_int    <= '0';
            current_reg <= (others => '0');
        elsif rising_edge(clk_in) then
            spi_start <= '0';
            done_int  <= '0';

            case state is
                when IDLE =>
                    busy_int <= '0';
                    cs_lo_n  <= '1';
                    if start_lo='1' then
                        busy_int    <= '1';
                        current_reg <= reg5_in;
                        cs_lo_n     <= '0';
                        state       <= R5_BYTE0;
                    end if;

                -- R5
                when R5_BYTE0 =>
                    spi_tx <= current_reg(31 downto 24);
                    spi_start <= '1';
                    state <= R5_WAIT0;

                when R5_WAIT0 =>
                    if spi_done='1' then
                        state <= R5_BYTE1;
                    end if;

                when R5_BYTE1 =>
                    spi_tx <= current_reg(23 downto 16);
                    spi_start <= '1';
                    state <= R5_WAIT1;

                when R5_WAIT1 =>
                    if spi_done='1' then
                        state <= R5_BYTE2;
                    end if;

                when R5_BYTE2 =>
                    spi_tx <= current_reg(15 downto 8);
                    spi_start <= '1';
                    state <= R5_WAIT2;

                when R5_WAIT2 =>
                    if spi_done='1' then
                        state <= R5_BYTE3;
                    end if;

                when R5_BYTE3 =>
                    spi_tx <= current_reg(7 downto 0);
                    spi_start <= '1';
                    state <= R5_WAIT3;

                when R5_WAIT3 =>
                    if spi_done='1' then
                        cs_lo_n <= '1'; -- latch
                        state <= R5_LATCH;
                    end if;

                when R5_LATCH =>
                    current_reg <= reg4_in;
                    state <= R4_BYTE0;

                -- R4
                when R4_BYTE0 =>
                    cs_lo_n <= '0';
                    spi_tx <= current_reg(31 downto 24);
                    spi_start <= '1';
                    state <= R4_WAIT0;

                when R4_WAIT0 =>
                    if spi_done='1' then
                        state <= R4_BYTE1;
                    end if;

                when R4_BYTE1 =>
                    spi_tx <= current_reg(23 downto 16);
                    spi_start <= '1';
                    state <= R4_WAIT1;

                when R4_WAIT1 =>
                    if spi_done='1' then
                        state <= R4_BYTE2;
                    end if;

                when R4_BYTE2 =>
                    spi_tx <= current_reg(15 downto 8);
                    spi_start <= '1';
                    state <= R4_WAIT2;

                when R4_WAIT2 =>
                    if spi_done='1' then
                        state <= R4_BYTE3;
                    end if;

                when R4_BYTE3 =>
                    spi_tx <= current_reg(7 downto 0);
                    spi_start <= '1';
                    state <= R4_WAIT3;

                when R4_WAIT3 =>
                    if spi_done='1' then
                        cs_lo_n <= '1';
                        state <= R4_LATCH;
                    end if;

                when R4_LATCH =>
                    current_reg <= reg3_in;
                    state <= R3_BYTE0;

                -- R3
                when R3_BYTE0 =>
                    cs_lo_n <= '0';
                    spi_tx <= current_reg(31 downto 24);
                    spi_start <= '1';
                    state <= R3_WAIT0;

                when R3_WAIT0 =>
                    if spi_done='1' then
                        state <= R3_BYTE1;
                    end if;

                when R3_BYTE1 =>
                    spi_tx <= current_reg(23 downto 16);
                    spi_start <= '1';
                    state <= R3_WAIT1;

                when R3_WAIT1 =>
                    if spi_done='1' then
                        state <= R3_BYTE2;
                    end if;

                when R3_BYTE2 =>
                    spi_tx <= current_reg(15 downto 8);
                    spi_start <= '1';
                    state <= R3_WAIT2;

                when R3_WAIT2 =>
                    if spi_done='1' then
                        state <= R3_BYTE3;
                    end if;

                when R3_BYTE3 =>
                    spi_tx <= current_reg(7 downto 0);
                    spi_start <= '1';
                    state <= R3_WAIT3;

                when R3_WAIT3 =>
                    if spi_done='1' then
                        cs_lo_n <= '1';
                        state <= R3_LATCH;
                    end if;

                when R3_LATCH =>
                    current_reg <= reg2_in;
                    state <= R2_BYTE0;

                -- R2
                when R2_BYTE0 =>
                    cs_lo_n <= '0';
                    spi_tx <= current_reg(31 downto 24);
                    spi_start <= '1';
                    state <= R2_WAIT0;

                when R2_WAIT0 =>
                    if spi_done='1' then
                        state <= R2_BYTE1;
                    end if;

                when R2_BYTE1 =>
                    spi_tx <= current_reg(23 downto 16);
                    spi_start <= '1';
                    state <= R2_WAIT1;

                when R2_WAIT1 =>
                    if spi_done='1' then
                        state <= R2_BYTE2;
                    end if;

                when R2_BYTE2 =>
                    spi_tx <= current_reg(15 downto 8);
                    spi_start <= '1';
                    state <= R2_WAIT2;

                when R2_WAIT2 =>
                    if spi_done='1' then
                        state <= R2_BYTE3;
                    end if;

                when R2_BYTE3 =>
                    spi_tx <= current_reg(7 downto 0);
                    spi_start <= '1';
                    state <= R2_WAIT3;

                when R2_WAIT3 =>
                    if spi_done='1' then
                        cs_lo_n <= '1';
                        state <= R2_LATCH;
                    end if;

                when R2_LATCH =>
                    current_reg <= reg1_in;
                    state <= R1_BYTE0;

                -- R1
                when R1_BYTE0 =>
                    cs_lo_n <= '0';
                    spi_tx <= current_reg(31 downto 24);
                    spi_start <= '1';
                    state <= R1_WAIT0;

                when R1_WAIT0 =>
                    if spi_done='1' then
                        state <= R1_BYTE1;
                    end if;

                when R1_BYTE1 =>
                    spi_tx <= current_reg(23 downto 16);
                    spi_start <= '1';
                    state <= R1_WAIT1;

                when R1_WAIT1 =>
                    if spi_done='1' then
                        state <= R1_BYTE2;
                    end if;

                when R1_BYTE2 =>
                    spi_tx <= current_reg(15 downto 8);
                    spi_start <= '1';
                    state <= R1_WAIT2;

                when R1_WAIT2 =>
                    if spi_done='1' then
                        state <= R1_BYTE3;
                    end if;

                when R1_BYTE3 =>
                    spi_tx <= current_reg(7 downto 0);
                    spi_start <= '1';
                    state <= R1_WAIT3;

                when R1_WAIT3 =>
                    if spi_done='1' then
                        cs_lo_n <= '1';
                        state <= R1_LATCH;
                    end if;

                when R1_LATCH =>
                    current_reg <= reg0_in;
                    state <= R0_BYTE0;

                -- R0
                when R0_BYTE0 =>
                    cs_lo_n <= '0';
                    spi_tx <= current_reg(31 downto 24);
                    spi_start <= '1';
                    state <= R0_WAIT0;

                when R0_WAIT0 =>
                    if spi_done='1' then
                        state <= R0_BYTE1;
                    end if;

                when R0_BYTE1 =>
                    spi_tx <= current_reg(23 downto 16);
                    spi_start <= '1';
                    state <= R0_WAIT1;

                when R0_WAIT1 =>
                    if spi_done='1' then
                        state <= R0_BYTE2;
                    end if;

                when R0_BYTE2 =>
                    spi_tx <= current_reg(15 downto 8);
                    spi_start <= '1';
                    state <= R0_WAIT2;

                when R0_WAIT2 =>
                    if spi_done='1' then
                        state <= R0_BYTE3;
                    end if;

                when R0_BYTE3 =>
                    spi_tx <= current_reg(7 downto 0);
                    spi_start <= '1';
                    state <= R0_WAIT3;

                when R0_WAIT3 =>
                    if spi_done='1' then
                        cs_lo_n <= '1';
                        state <= R0_LATCH;
                    end if;

                when R0_LATCH =>
                    state <= COMPLETE;

                when COMPLETE =>
                    busy_int <= '0';
                    done_int <= '1';
                    state <= IDLE;

            end case;
        end if;
    end process;

end Behavioral;

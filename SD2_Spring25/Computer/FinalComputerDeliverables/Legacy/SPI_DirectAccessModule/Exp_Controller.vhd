library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Expander_Controller is
    port (
        clk_in       : in  std_logic;
        reset_in     : in  std_logic;

        start_exp    : in  std_logic;
        busy_exp     : out std_logic;
        done_exp     : out std_logic;

        write_enable : in  std_logic;
        write_data   : in  std_logic_vector(19 downto 0);
        read_data_out: out std_logic_vector(7 downto 0);

        -- SPI Master signals
        spi_done  : in  std_logic;
        spi_start : out std_logic;
        spi_tx    : out std_logic_vector(7 downto 0);
        spi_rx    : in  std_logic_vector(7 downto 0);

        cs_exp_n  : out std_logic
    );
end Expander_Controller;

architecture Behavioral of Expander_Controller is

    -- Internal signals to store the user config
    signal rw_int       : std_logic := '0';
    signal hw_addr_int  : std_logic_vector(2 downto 0) := (others => '0');
    signal reg_addr_int : std_logic_vector(7 downto 0) := (others => '0');
    signal data_in_int  : std_logic_vector(7 downto 0) := (others => '0');

    signal read_data_int : std_logic_vector(7 downto 0) := (others => '0');

    -- Build the 8-bit Control Byte: [0 1 0 0  A2 A1 A0  R/W]
    function build_control(
        hw: std_logic_vector(2 downto 0);
        rw_bit: std_logic
    ) return std_logic_vector is
        variable c: std_logic_vector(7 downto 0);
    begin
        c(7 downto 4) := "0100";  -- base bits
        c(3 downto 1) := hw;
        c(0)          := rw_bit;
        return c;
    end function;

    type fsm_state_type is (
        IDLE,

        -- Write states
        W_ASSERT_CS, W_CTRL, W_CTRL_WAIT,
        W_ADDR, W_ADDR_WAIT,
        W_DATA, W_DATA_WAIT,
        W_DONE,

        -- Read states
        R0_ASSERT_CS, R0_CTRL, R0_CTRL_WAIT,
        R0_ADDR, R0_ADDR_WAIT,
        R0_DEASSERT_CS,

        R1_ASSERT_CS, R1_CTRL, R1_CTRL_WAIT,
        R1_DATA, R1_DATA_WAIT,
        R_DONE
    );
    signal state    : fsm_state_type := IDLE;
    signal busy_int : std_logic := '0';
    signal done_int : std_logic := '0';

begin
    -- Expose read_data_int
    read_data_out <= read_data_int;

    busy_exp <= busy_int;
    done_exp <= done_int;

    ----------------------------------------------------------------------------
    -- 1) Write Interface: store RW, hw_addr, reg_addr, data_in
    ----------------------------------------------------------------------------
    process(clk_in, reset_in)
    begin
        if reset_in = '1' then
            rw_int       <= '0';
            hw_addr_int  <= (others => '0');
            reg_addr_int <= (others => '0');
            data_in_int  <= (others => '0');
        elsif rising_edge(clk_in) then
            if write_enable = '1' then
                rw_int       <= write_data(19);
                hw_addr_int  <= write_data(18 downto 16);
                reg_addr_int <= write_data(15 downto 8);
                data_in_int  <= write_data(7 downto 0);
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- 2) Main FSM: read/write the expander over SPI
    ----------------------------------------------------------------------------
    process(clk_in, reset_in)
    begin
        if reset_in = '1' then
            state <= IDLE;
            cs_exp_n <= '1';
            spi_start <= '0';
            spi_tx <= (others => '0');
            read_data_int <= (others => '0');
            busy_int <= '0';
            done_int <= '0';

        elsif rising_edge(clk_in) then
            spi_start <= '0';
            done_int  <= '0';

            case state is

                when IDLE =>
                    cs_exp_n <= '1';
                    busy_int <= '0';
                    if start_exp = '1' then
                        busy_int <= '1';
                        if rw_int = '0' then
                            state <= W_ASSERT_CS;  -- WRITE
                        else
                            state <= R0_ASSERT_CS; -- READ
                        end if;
                    end if;

                ----------------------------------------------------------------
                -- Write: 3 bytes in a single CS cycle
                ----------------------------------------------------------------
                when W_ASSERT_CS =>
                    cs_exp_n <= '0';
                    spi_tx <= build_control(hw_addr_int, '0'); -- R/W=0 => write
                    state  <= W_CTRL;

                when W_CTRL =>
                    spi_start <= '1';
                    state <= W_CTRL_WAIT;

                when W_CTRL_WAIT =>
                    if spi_done='1' then
                        spi_tx <= reg_addr_int;
                        state  <= W_ADDR;
                    end if;

                when W_ADDR =>
                    spi_start <= '1';
                    state <= W_ADDR_WAIT;

                when W_ADDR_WAIT =>
                    if spi_done='1' then
                        spi_tx <= data_in_int;
                        state  <= W_DATA;
                    end if;

                when W_DATA =>
                    spi_start <= '1';
                    state <= W_DATA_WAIT;

                when W_DATA_WAIT =>
                    if spi_done='1' then
                        state <= W_DONE;
                    end if;

                when W_DONE =>
                    cs_exp_n <= '1';
                    done_int <= '1';
                    busy_int <= '0';
                    state <= IDLE;

                ----------------------------------------------------------------
                -- Read: two CS cycles
                ----------------------------------------------------------------
                when R0_ASSERT_CS =>
                    cs_exp_n <= '0';
                    spi_tx <= build_control(hw_addr_int, '0'); -- write control first
                    state  <= R0_CTRL;

                when R0_CTRL =>
                    spi_start <= '1';
                    state <= R0_CTRL_WAIT;

                when R0_CTRL_WAIT =>
                    if spi_done='1' then
                        spi_tx <= reg_addr_int;
                        state <= R0_ADDR;
                    end if;

                when R0_ADDR =>
                    spi_start <= '1';
                    state <= R0_ADDR_WAIT;

                when R0_ADDR_WAIT =>
                    if spi_done='1' then
                        state <= R0_DEASSERT_CS;
                    end if;

                when R0_DEASSERT_CS =>
                    cs_exp_n <= '1';
                    -- second cycle starts
                    state <= R1_ASSERT_CS;

                when R1_ASSERT_CS =>
                    cs_exp_n <= '0';
                    spi_tx <= build_control(hw_addr_int, '1'); -- read control
                    state <= R1_CTRL;

                when R1_CTRL =>
                    spi_start <= '1';
                    state <= R1_CTRL_WAIT;

                when R1_CTRL_WAIT =>
                    if spi_done='1' then
                        spi_tx <= (others => '0'); -- dummy to clock in read
                        state  <= R1_DATA;
                    end if;

                when R1_DATA =>
                    spi_start <= '1';
                    state <= R1_DATA_WAIT;

                when R1_DATA_WAIT =>
                    if spi_done='1' then
                        read_data_int <= spi_rx;
                        state <= R_DONE;
                    end if;

                when R_DONE =>
                    cs_exp_n <= '1';
                    done_int <= '1';
                    busy_int <= '0';
                    state <= IDLE;
            end case;
        end if;
    end process;

end Behavioral;

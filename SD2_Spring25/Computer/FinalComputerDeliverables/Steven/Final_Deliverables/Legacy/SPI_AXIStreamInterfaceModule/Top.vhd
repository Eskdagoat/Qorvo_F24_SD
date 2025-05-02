library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPI_Module is
    port (
        --clk_in   : in  std_logic;
        ----------------------------------------------------------------
        -- Physical SPI lines
        ----------------------------------------------------------------
        sck      : out std_logic;
        mosi     : out std_logic;
        miso_exp : in  std_logic;  -- shared MISO

        cs_exp_n : out std_logic;
        cs_lo_n  : out std_logic;

        -- Additional signals for LO
        muxout_lo   : in  std_logic
    );
end SPI_Module;

architecture Behavioral of SPI_Module is
    
    
    ----------------------------------------------------------------
    -- Memory-Mapped Bus Interface or Custom Bus
    ----------------------------------------------------------------
    signal bus_cs       :   std_logic;                -- chip select
    signal bus_we       :   std_logic;                -- write enable (1=write)
    signal bus_addr     :   std_logic_vector(31 downto 0);
    signal bus_data_in  :   std_logic_vector(31 downto 0);
    signal bus_data_out :  std_logic_vector(31 downto 0);
    signal lock_detect :  std_logic;
    signal reset_in :   std_logic;
    
    signal clk_in : std_logic;
    ----------------------------------------------------------------------------
    -- Address constants (example)
    ----------------------------------------------------------------------------
    constant LO_REG5_ADDR   : std_logic_vector(31 downto 0) := x"45000100";
    constant LO_REG4_ADDR   : std_logic_vector(31 downto 0) := x"45000104";
    constant LO_REG3_ADDR   : std_logic_vector(31 downto 0) := x"45000108";
    constant LO_REG2_ADDR   : std_logic_vector(31 downto 0) := x"4500010C";
    constant LO_REG1_ADDR   : std_logic_vector(31 downto 0) := x"45000110";
    constant LO_REG0_ADDR   : std_logic_vector(31 downto 0) := x"45000114";
    constant LO_START_ADDR  : std_logic_vector(31 downto 0) := x"45000118";

    constant EXP_DATA_ADDR  : std_logic_vector(31 downto 0) := x"45000120"; -- lower 20 bits
    constant EXP_START_ADDR : std_logic_vector(31 downto 0) := x"45000124";

    ----------------------------------------------------------------------------
    -- Internal signals for LO
    ----------------------------------------------------------------------------
    signal lo_reg5 : std_logic_vector(31 downto 0) := (others => '0');
    signal lo_reg4 : std_logic_vector(31 downto 0) := (others => '0');
    signal lo_reg3 : std_logic_vector(31 downto 0) := (others => '0');
    signal lo_reg2 : std_logic_vector(31 downto 0) := (others => '0');
    signal lo_reg1 : std_logic_vector(31 downto 0) := (others => '0');
    signal lo_reg0 : std_logic_vector(31 downto 0) := (others => '0');

    signal lo_start_bit : std_logic := '0';  -- pulses '1' when user writes LO_START_ADDR

    -- If you want to see LO busy/done
    signal lo_busy_int : std_logic := '0';
    signal lo_done_int : std_logic := '0';

    ----------------------------------------------------------------------------
    -- Internal signals for Expander
    ----------------------------------------------------------------------------
    signal exp_data_20   : std_logic_vector(19 downto 0) := (others => '0');
    signal exp_start_bit : std_logic := '0';

    signal exp_busy_int : std_logic := '0';
    signal exp_done_int : std_logic := '0';

    ----------------------------------------------------------------------------
    -- SPI Master + Arbiter
    ----------------------------------------------------------------------------
    signal master_start : std_logic := '0';
    signal master_done  : std_logic;
    signal master_tx    : std_logic_vector(7 downto 0) := (others => '0');
    signal master_rx    : std_logic_vector(7 downto 0);

    -- LO <-> SPI
    signal lo_spi_start : std_logic;
    signal lo_spi_tx    : std_logic_vector(7 downto 0);

    -- Exp <-> SPI
    signal exp_spi_start : std_logic;
    signal exp_spi_tx    : std_logic_vector(7 downto 0);

begin

    ----------------------------------------------------------------------------
    -- (A) Bus Write Process
    ----------------------------------------------------------------------------
    process(clk_in, reset_in)
    begin
        if reset_in='1' then
            lo_reg5 <= (others => '0');
            lo_reg4 <= (others => '0');
            lo_reg3 <= (others => '0');
            lo_reg2 <= (others => '0');
            lo_reg1 <= (others => '0');
            lo_reg0 <= (others => '0');
            lo_start_bit <= '0';

            exp_data_20 <= (others => '0');
            exp_start_bit <= '0';

        elsif rising_edge(clk_in) then
            -- default each clock
            lo_start_bit  <= '0';
            exp_start_bit <= '0';

            if bus_cs='1' and bus_we='1' then
                case bus_addr is

                    -- LO registers
                    when LO_REG5_ADDR => lo_reg5 <= bus_data_in;
                    when LO_REG4_ADDR => lo_reg4 <= bus_data_in;
                    when LO_REG3_ADDR => lo_reg3 <= bus_data_in;
                    when LO_REG2_ADDR => lo_reg2 <= bus_data_in;
                    when LO_REG1_ADDR => lo_reg1 <= bus_data_in;
                    when LO_REG0_ADDR => lo_reg0 <= bus_data_in;

                    when LO_START_ADDR =>
                        lo_start_bit <= '1';

                    -- Expander 20-bit data
                    when EXP_DATA_ADDR =>
                        -- take lower 20 bits
                        exp_data_20 <= bus_data_in(19 downto 0);

                    when EXP_START_ADDR =>
                        exp_start_bit <= '1';

                    when others => null;

                end case;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- (B) Optional Readback Process
    ----------------------------------------------------------------------------
    process(
        bus_addr, bus_cs, bus_we,
        lo_reg5, lo_reg4, lo_reg3, lo_reg2, lo_reg1, lo_reg0,
        exp_data_20
    )
    begin
        bus_data_out <= (others => '0');

        if (bus_cs='1' and bus_we='0') then
            case bus_addr is
                when LO_REG5_ADDR => bus_data_out <= lo_reg5;
                when LO_REG4_ADDR => bus_data_out <= lo_reg4;
                when LO_REG3_ADDR => bus_data_out <= lo_reg3;
                when LO_REG2_ADDR => bus_data_out <= lo_reg2;
                when LO_REG1_ADDR => bus_data_out <= lo_reg1;
                when LO_REG0_ADDR => bus_data_out <= lo_reg0;

                when EXP_DATA_ADDR =>
                    bus_data_out(19 downto 0) <= exp_data_20;

                when others => null;
            end case;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- (C) SPI Master
    ----------------------------------------------------------------------------
    u_spi_master : entity work.SPI_Master_8bit
        port map (
            clk_in   => clk_in,
            reset_in => reset_in,

            start    => master_start,
            done     => master_done,

            data_in  => master_tx,
            data_out => master_rx,

            sck   => sck,
            mosi  => mosi,
            miso  => miso_exp
        );

    ----------------------------------------------------------------------------
    -- (D) LO Controller
    ----------------------------------------------------------------------------
    u_lo_ctrl : entity work.LO_Controller
        port map (
            clk_in    => clk_in,
            reset_in  => reset_in,

            reg5_in   => lo_reg5,
            reg4_in   => lo_reg4,
            reg3_in   => lo_reg3,
            reg2_in   => lo_reg2,
            reg1_in   => lo_reg1,
            reg0_in   => lo_reg0,

            start_lo  => lo_start_bit,
            busy_lo   => lo_busy_int,
            done_lo   => lo_done_int,

            spi_done  => master_done,
            spi_start => lo_spi_start,
            spi_tx    => lo_spi_tx,

            cs_lo_n   => cs_lo_n,

            muxout_lo   => muxout_lo,
            lock_detect => lock_detect
        );

    ----------------------------------------------------------------------------
    -- (E) Expander Controller (New version with 20-bit input + start)
    ----------------------------------------------------------------------------
    u_exp_ctrl : entity work.Expander_Controller
        port map (
            clk_in      => clk_in,
            reset_in    => reset_in,

            exp_data_in => exp_data_20,
            start_exp   => exp_start_bit,
            busy_exp    => exp_busy_int,
            done_exp    => exp_done_int,

            read_data_out => open,  -- or wire it out if you want to store somewhere

            spi_done  => master_done,
            spi_start => exp_spi_start,
            spi_tx    => exp_spi_tx,
            spi_rx    => master_rx,

            cs_exp_n  => cs_exp_n
        );

    ----------------------------------------------------------------------------
    -- (F) SPI Arbiter
    ----------------------------------------------------------------------------
    process(clk_in, reset_in)
    begin
        if reset_in = '1' then
            master_start <= '0';
            master_tx    <= (others => '0');
        elsif rising_edge(clk_in) then
            master_start <= '0';
            master_tx    <= (others => '0');

            -- Priority: LO first if busy
            if lo_busy_int='1' then
                master_start <= lo_spi_start;
                master_tx    <= lo_spi_tx;
            elsif exp_busy_int='1' then
                master_start <= exp_spi_start;
                master_tx    <= exp_spi_tx;
            end if;
        end if;
    end process;

end Behavioral;

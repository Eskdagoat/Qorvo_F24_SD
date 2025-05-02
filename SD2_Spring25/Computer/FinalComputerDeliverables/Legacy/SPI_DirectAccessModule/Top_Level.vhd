library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPI_Module is
    port (
        clk_in       : in  std_logic;
        reset_in     : in  std_logic;

        ----------------------------------------------------------------
        -- LO config interface
        ----------------------------------------------------------------
        lo_start       : in  std_logic;
        lo_busy        : out std_logic;
        lo_done        : out std_logic;
        lo_write_en    : in  std_logic;
        lo_write_addr  : in  std_logic_vector(2 downto 0);
        lo_write_data  : in  std_logic_vector(31 downto 0);

        ----------------------------------------------------------------
        -- Expander config interface
        ----------------------------------------------------------------
        exp_start      : in  std_logic;
        exp_busy       : out std_logic;
        exp_done       : out std_logic;
        exp_write_en   : in  std_logic;
        exp_write_data : in  std_logic_vector(19 downto 0);
        exp_read_data  : out std_logic_vector(7 downto 0);

        ----------------------------------------------------------------
        -- Physical SPI lines
        ----------------------------------------------------------------
        sck       : out std_logic;
        mosi      : out std_logic;
        miso_exp  : in  std_logic;  -- shared MISO
        cs_exp_n  : out std_logic;
        cs_lo_n   : out std_logic;

        -- Additional signals for LO
        muxout_lo   : in  std_logic;
        lock_detect : out std_logic;

        -- Possibly: reset_exp_n
        reset_exp_n : out std_logic
    );
end SPI_Module;

architecture Structural of SPI_Module is

    ----------------------------------------------------------------------------
    -- 1) SPI Master signals
    ----------------------------------------------------------------------------
    signal master_start : std_logic := '0';
    signal master_done  : std_logic;
    signal master_tx    : std_logic_vector(7 downto 0) := (others => '0');
    signal master_rx    : std_logic_vector(7 downto 0);

    ----------------------------------------------------------------------------
    -- 2) LO Controller <-> Master
    ----------------------------------------------------------------------------
    signal lo_busy_int  : std_logic := '0';  -- internal version
    signal lo_spi_start : std_logic;
    signal lo_spi_tx    : std_logic_vector(7 downto 0);

    ----------------------------------------------------------------------------
    -- 3) Expander Controller <-> Master
    ----------------------------------------------------------------------------
    signal exp_busy_int  : std_logic := '0'; -- internal version
    signal exp_spi_start : std_logic;
    signal exp_spi_tx    : std_logic_vector(7 downto 0);

begin

    ----------------------------------------------------------------------------
    -- (A) SPI Master Instantiation
    ----------------------------------------------------------------------------
    u_spi_master : entity work.SPI_Master_8bit
        port map (
            clk_in   => clk_in,
            reset_in => reset_in,

            start    => master_start,  -- from arbiter
            done     => master_done,

            data_in  => master_tx,
            data_out => master_rx,

            sck   => sck,
            mosi  => mosi,
            miso  => miso_exp
        );

    ----------------------------------------------------------------------------
    -- (B) LO Controller (no spi_rx, no spi_busy)
    ----------------------------------------------------------------------------
    u_lo_ctrl : entity work.LO_Controller
        port map (
            clk_in       => clk_in,
            reset_in     => reset_in,

            start_lo     => lo_start,
            busy_lo      => lo_busy_int,  -- internal
            done_lo      => lo_done,

            write_enable => lo_write_en,
            write_addr   => lo_write_addr,
            write_data   => lo_write_data,

            spi_done  => master_done,
            spi_start => lo_spi_start,
            spi_tx    => lo_spi_tx,

            cs_lo_n   => cs_lo_n,

            muxout_lo   => muxout_lo,
            lock_detect => lock_detect
        );

    -- Connect internal LO busy signal to top-level out port
    lo_busy <= lo_busy_int;

    ----------------------------------------------------------------------------
    -- (C) Expander Controller (no spi_busy, but has spi_rx)
    ----------------------------------------------------------------------------
    u_exp_ctrl : entity work.Expander_Controller
        port map (
            clk_in    => clk_in,
            reset_in  => reset_in,

            start_exp => exp_start,
            busy_exp  => exp_busy_int,  -- internal
            done_exp  => exp_done,

            write_enable  => exp_write_en,
            write_data    => exp_write_data,
            read_data_out => exp_read_data,

            spi_done  => master_done,
            spi_start => exp_spi_start,
            spi_tx    => exp_spi_tx,
            spi_rx    => master_rx,

            cs_exp_n  => cs_exp_n
        );

    -- Connect internal Expander busy to top-level out
    exp_busy <= exp_busy_int;

    ----------------------------------------------------------------------------
    -- (D) SPI Arbiter
    ----------------------------------------------------------------------------
    process(clk_in, reset_in)
    begin
        if reset_in = '1' then
            master_start <= '0';
            master_tx    <= (others => '0');
        elsif rising_edge(clk_in) then
            -- default
            master_start <= '0';
            master_tx    <= (others => '0');

            -- Priority for LO if lo_start=1 or lo_busy=1
            if (lo_start = '1' or lo_busy_int = '1') then
                master_start <= lo_spi_start;
                master_tx    <= lo_spi_tx;
            -- else pick Expander if it's starting or busy
            elsif (exp_start = '1' or exp_busy_int = '1') then
                master_start <= exp_spi_start;
                master_tx    <= exp_spi_tx;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- (E) Reset for Expander or others
    ----------------------------------------------------------------------------
    reset_exp_n <= not reset_in;

end Structural;

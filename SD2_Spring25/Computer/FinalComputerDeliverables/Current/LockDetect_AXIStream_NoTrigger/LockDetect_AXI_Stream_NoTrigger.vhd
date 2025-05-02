library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LockDetect_AXI_Stream_NoTrigger is
  port (
    aclk           : in  std_logic;
    aresetn        : in  std_logic;

    -- Signal from LO
    muxout_lo         : in  std_logic;

    -- AXIS Master Output
    m_axis_tvalid     : out std_logic;
    m_axis_tdata      : out std_logic_vector(31 downto 0);
    m_axis_tready     : in  std_logic
  );
end LockDetect_AXI_Stream_NoTrigger;

architecture Behavioral of LockDetect_AXI_Stream_NoTrigger is

  -- Debounce: 16 stable lock samples
  signal lock_counter : unsigned(4 downto 0) := (others => '0');
  signal lock_stable  : std_logic := '0';

  -- Periodic timer
  signal tick_counter : unsigned(19 downto 0) := (others => '0');
  signal tick         : std_logic := '0';

  -- AXI output
  signal tvalid_int   : std_logic := '0';
  signal tdata_int    : std_logic_vector(31 downto 0) := (others => '0');

begin

  -- Debounce Lock Detection
  process(aclk)
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
        lock_counter <= (others => '0');
        lock_stable  <= '0';
      elsif muxout_lo = '1' then
        if lock_counter < 16 then
          lock_counter <= lock_counter + 1;
        end if;
        if lock_counter = 15 then
          lock_stable <= '1';
        end if;
      else
        lock_counter <= (others => '0');
        lock_stable  <= '0';
      end if;
    end if;
  end process;

  -- Generate Tick
  process(aclk)
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
        tick_counter <= (others => '0');
        tick         <= '0';
      elsif tick_counter = x"FFFFF" then
        tick_counter <= (others => '0');
        tick         <= '1';
      else
        tick_counter <= tick_counter + 1;
        tick         <= '0';
      end if;
    end if;
  end process;

  -- Stream Lock Status on Tick
  process(aclk)
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
        tvalid_int <= '0';
      elsif tick = '1' then
        tdata_int  <= (others => '0');
        tdata_int(0) <= lock_stable;
        tvalid_int <= '1';
      elsif tvalid_int = '1' and m_axis_tready = '1' then
        tvalid_int <= '0';
      end if;
    end if;
  end process;

  m_axis_tvalid <= tvalid_int;
  m_axis_tdata  <= tdata_int;

end Behavioral;

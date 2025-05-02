library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LockDetect_AXI_Stream_Trigger is
  port (
    aclk              : in  std_logic;
    aresetn           : in  std_logic;

    -- Signal from LO
    muxout_lo         : in  std_logic;

    -- Trigger from software (pulse)
    trigger           : in  std_logic;

    -- AXIS Master Output
    m_axis_tvalid     : out std_logic;
    m_axis_tdata      : out std_logic_vector(31 downto 0);
    m_axis_tready     : in  std_logic
  );
end LockDetect_AXI_Stream_Trigger;

architecture Behavioral of LockDetect_AXI_Stream_Trigger is
  type state_type is (IDLE, SEND);
  signal state         : state_type := IDLE;

  signal data_latched  : std_logic_vector(31 downto 0);
begin

  process(aclk)
  begin
    if rising_edge(aclk) then
      if aresetn = '0' then
        state         <= IDLE;
        m_axis_tvalid <= '0';
        m_axis_tdata  <= (others => '0');
      else
        case state is
          when IDLE =>
            m_axis_tvalid <= '0';
            if trigger = '1' then
              data_latched <= (31 downto 1 => '0') & muxout_lo;
              state <= SEND;
            end if;

          when SEND =>
            m_axis_tvalid <= '1';
            m_axis_tdata  <= data_latched;
            if m_axis_tready = '1' then
              m_axis_tvalid <= '0';
              state <= IDLE;
            end if;
        end case;
      end if;
    end if;
  end process;

end Behavioral;

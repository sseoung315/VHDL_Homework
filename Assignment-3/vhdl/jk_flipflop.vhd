library ieee;
use ieee.std_logic_1164.all;

-- Direct JK characteristic function, edge-triggered.
-- INIT_CLR is an additional asynchronous CLEAR for explicit power-up initialization
-- of the gate-level feedback circuit in Logisim; inactive ('0') in normal JK operation.
entity jk_flipflop is
  port (
    j        : in  std_logic;
    k        : in  std_logic;
    clk      : in  std_logic;
    init_clr : in  std_logic;
    q        : out std_logic;
    qb       : out std_logic
  );
end entity;

architecture rtl of jk_flipflop is
  signal q_i : std_logic := 'U';
begin
  process(clk, init_clr)
  begin
    if init_clr = '1' then
      q_i <= '0';
    elsif rising_edge(clk) then
      if j='0' and k='0' then
        null;                 -- hold
      elsif j='0' and k='1' then
        q_i <= '0';          -- reset
      elsif j='1' and k='0' then
        q_i <= '1';          -- set
      elsif j='1' and k='1' then
        q_i <= not q_i;      -- toggle once per rising edge
      end if;
    end if;
  end process;
  q  <= q_i;
  qb <= not q_i;
end architecture;

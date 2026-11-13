library ieee;
use ieee.std_logic_1164.all;

entity async_d_flipflop is
  port (d : in std_logic; clk : in std_logic;
        set : in std_logic; clr : in std_logic;
        q : out std_logic; qb : out std_logic);
end entity;

architecture rtl of async_d_flipflop is
  signal q_i : std_logic := 'U';
begin
  process(clk, set, clr)
  begin
    if clr = '1' then
      q_i <= '0';             -- asynchronous clear: highest priority
    elsif set = '1' then
      q_i <= '1';             -- asynchronous set
    elsif rising_edge(clk) then
      q_i <= d;
    end if;
  end process;
  q <= q_i;
  qb <= not q_i;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop is
  port (d : in std_logic; clk : in std_logic;
        q : out std_logic; qb : out std_logic);
end entity;

architecture rtl of d_flipflop is
  signal q_i : std_logic := 'U';
begin
  process(clk)
  begin
    if rising_edge(clk) then
      q_i <= d;
    end if;
  end process;
  q <= q_i;
  qb <= not q_i;
end architecture;

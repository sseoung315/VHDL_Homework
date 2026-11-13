library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
  port (d : in std_logic; en : in std_logic;
        q : out std_logic; qb : out std_logic);
end entity;

architecture rtl of d_latch is
  signal q_i : std_logic := 'U';
begin
  process(d, en)
  begin
    if en = '1' then
      q_i <= d; -- transparent when enabled; inferred latch otherwise
    end if;
  end process;
  q <= q_i;
  qb <= not q_i;
end architecture;

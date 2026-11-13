library ieee;
use ieee.std_logic_1164.all;

-- Active-high cross-coupled NOR RS latch.
-- R S: 00=hold, 01=set, 10=reset, 11=forbidden (Q=QB=0).
-- Simultaneously releasing forbidden inputs is not deterministic in real gates.
entity rs_latch is
  port (s : in std_logic; r : in std_logic;
        q : out std_logic; qb : out std_logic);
end entity;

architecture rtl of rs_latch is
  signal q_i  : std_logic := 'U';
  signal qb_i : std_logic := 'U';
begin
  process(s, r)
  begin
    if s = '1' and r = '0' then
      q_i <= '1'; qb_i <= '0';
    elsif s = '0' and r = '1' then
      q_i <= '0'; qb_i <= '1';
    elsif s = '1' and r = '1' then
      q_i <= '0'; qb_i <= '0';
    end if; -- s=r=0 holds both prior values
  end process;
  q <= q_i;
  qb <= qb_i;
end architecture;

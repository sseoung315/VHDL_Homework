library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vote25 is
 port (vt : in std_logic_vector(24 downto 0); count : out std_logic_vector(4 downto 0); result : out std_logic);
end entity;
architecture rtl of vote25 is

begin
 process(all)
  variable n : natural range 0 to 25;
 begin
  n := 0;
  for i in vt'range loop
   if vt(i) = '1' then n := n+1; end if;
  end loop;
  count <= std_logic_vector(to_unsigned(n,5));
  if n >= 13 then result <= '1'; else result <= '0'; end if;
 end process;
end architecture;

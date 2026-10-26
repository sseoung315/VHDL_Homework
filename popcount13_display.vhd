library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity popcount13_display is
 port (vt : in std_logic_vector(12 downto 0); en : in std_logic; count : out std_logic_vector(3 downto 0); seg : out std_logic_vector(6 downto 0));
end entity;
architecture rtl of popcount13_display is
 signal cnt : std_logic_vector(3 downto 0);
 signal decoded : std_logic_vector(6 downto 0);
begin
 process(all)
  variable n : natural range 0 to 13;
 begin
  n := 0;
  for i in vt'range loop
   if vt(i) = '1' then n := n+1; end if;
  end loop;
  cnt <= std_logic_vector(to_unsigned(n,4));
 end process;
 count <= cnt;
 decoder: entity work.hex7 port map(value => cnt, seg => decoded);
 seg <= decoded when en = '1' else (others => '0');
end architecture;

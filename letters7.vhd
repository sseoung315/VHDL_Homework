library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity letters7 is
 port (code : in std_logic_vector(2 downto 0); seg : out std_logic_vector(6 downto 0));
end entity;
architecture rtl of letters7 is

begin
 -- seg(6 downto 0) = a,b,c,d,e,f,g; active high.
 process(all) begin
  case code is
   when "000" => seg <= "1111101";
   when "001" => seg <= "0011111";
   when "010" => seg <= "0001101";
   when "011" => seg <= "0111101";
   when "100" => seg <= "1000111";
   when "101" => seg <= "1111011";
   when "110" => seg <= "0000000";
   when "111" => seg <= "0000000";
   when others => seg <= (others => '0');
  end case;
 end process;
end architecture;

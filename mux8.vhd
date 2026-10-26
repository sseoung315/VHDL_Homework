library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux8 is
 port (din : in std_logic_vector(7 downto 0); sel : in std_logic_vector(2 downto 0); y : out std_logic);
end entity;
architecture rtl of mux8 is

begin
 process(all) begin
  case sel is
   when "000" => y <= din(0);
   when "001" => y <= din(1);
   when "010" => y <= din(2);
   when "011" => y <= din(3);
   when "100" => y <= din(4);
   when "101" => y <= din(5);
   when "110" => y <= din(6);
   when "111" => y <= din(7);
   when others => y <= '0';
  end case;
 end process;
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use std.env.all;
entity tb_d_latch is end;
architecture test of tb_d_latch is
  signal d : std_logic := '0';
  signal en : std_logic := '0';
  signal q, qb : std_logic;
begin
  dut: entity work.d_latch port map (d => d, en => en, q => q, qb => qb);
  stimulus: process
  begin
    d <= '0';
    en <= '1';
    wait for 20 ns;
    assert q='0' and qb='1' report "FAIL: Enabled zero" severity failure;
    report "PASS: Enabled zero";
    d <= '1';
    en <= '1';
    wait for 20 ns;
    assert q='1' and qb='0' report "FAIL: Enabled one" severity failure;
    report "PASS: Enabled one";
    d <= '0';
    en <= '0';
    wait for 20 ns;
    assert q='1' and qb='0' report "FAIL: Hold one" severity failure;
    report "PASS: Hold one";
    d <= '0';
    en <= '1';
    wait for 20 ns;
    assert q='0' and qb='1' report "FAIL: Enabled zero again" severity failure;
    report "PASS: Enabled zero again";
    d <= '1';
    en <= '0';
    wait for 20 ns;
    assert q='0' and qb='1' report "FAIL: Hold zero" severity failure;
    report "PASS: Hold zero";
    report "ALL CASES PASS: d_latch";
    finish;
    wait;
  end process;
end;

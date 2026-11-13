library ieee;
use ieee.std_logic_1164.all;
use std.env.all;
entity tb_rs_latch is end;
architecture test of tb_rs_latch is
  signal s : std_logic := '0';
  signal r : std_logic := '0';
  signal q, qb : std_logic;
begin
  dut: entity work.rs_latch port map (s => s, r => r, q => q, qb => qb);
  stimulus: process
  begin
    s <= '1';
    r <= '0';
    wait for 20 ns;
    assert q='1' and qb='0' report "FAIL: Set" severity failure;
    report "PASS: Set";
    s <= '0';
    r <= '0';
    wait for 20 ns;
    assert q='1' and qb='0' report "FAIL: Hold after set" severity failure;
    report "PASS: Hold after set";
    s <= '0';
    r <= '1';
    wait for 20 ns;
    assert q='0' and qb='1' report "FAIL: Reset" severity failure;
    report "PASS: Reset";
    s <= '0';
    r <= '0';
    wait for 20 ns;
    assert q='0' and qb='1' report "FAIL: Hold after reset" severity failure;
    report "PASS: Hold after reset";
    s <= '1';
    r <= '1';
    wait for 20 ns;
    assert q='0' and qb='0' report "FAIL: Forbidden" severity failure;
    report "PASS: Forbidden";
    report "ALL CASES PASS: rs_latch";
    finish;
    wait;
  end process;
end;

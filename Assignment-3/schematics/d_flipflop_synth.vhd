library ieee;
use ieee.std_logic_1164.all;
entity d_flipflop is
  port (
    d: in std_logic;
    clk: in std_logic;
    q: out std_logic;
    qb: out std_logic
  );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of d_flipflop is
  signal wrap_d: std_logic;
  signal wrap_clk: std_logic;
  signal wrap_q: std_logic;
  signal wrap_qb: std_logic;
  signal q_i : std_logic;
  signal n8 : std_logic;
  signal n9 : std_logic;
begin
  wrap_d <= d;
  wrap_clk <= clk;
  q <= wrap_q;
  qb <= wrap_qb;
  wrap_q <= q_i;
  wrap_qb <= n8;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/d_flipflop.vhd:10:10
  q_i <= n9; -- (isignal)
  -- /workspace/work/submission-repo/Assignment-3/vhdl/d_flipflop.vhd:19:9
  n8 <= not q_i;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/d_flipflop.vhd:14:5
  process (wrap_clk)
  begin
    if rising_edge (wrap_clk) then
      n9 <= wrap_d;
    end if;
  end process;
end rtl;

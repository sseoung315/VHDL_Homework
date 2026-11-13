library ieee;
use ieee.std_logic_1164.all;
entity async_d_flipflop is
  port (
    d: in std_logic;
    clk: in std_logic;
    set: in std_logic;
    clr: in std_logic;
    q: out std_logic;
    qb: out std_logic
  );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of async_d_flipflop is
  signal wrap_d: std_logic;
  signal wrap_clk: std_logic;
  signal wrap_set: std_logic;
  signal wrap_clr: std_logic;
  signal wrap_q: std_logic;
  signal wrap_qb: std_logic;
  signal q_i : std_logic;
  signal n8 : std_logic;
  signal n12 : std_logic;
  signal n13 : std_logic;
  signal n14 : std_logic := 'X';
begin
  wrap_d <= d;
  wrap_clk <= clk;
  wrap_set <= set;
  wrap_clr <= clr;
  q <= wrap_q;
  qb <= wrap_qb;
  wrap_q <= q_i;
  wrap_qb <= n12;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/async_d_flipflop.vhd:11:10
  q_i <= n14; -- (isignal)
  -- /workspace/work/submission-repo/Assignment-3/vhdl/async_d_flipflop.vhd:17:5
  n8 <= '1' when wrap_clr = '0' else '0';
  -- /workspace/work/submission-repo/Assignment-3/vhdl/async_d_flipflop.vhd:24:9
  n12 <= not q_i;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/async_d_flipflop.vhd:4:8
  n13 <= wrap_clr or wrap_set;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/async_d_flipflop.vhd:19:5
  process (wrap_clk, n13, n8)
  begin
    if n13 = '1' then
      n14 <= n8;
    elsif rising_edge (wrap_clk) then
      n14 <= wrap_d;
    end if;
  end process;
end rtl;

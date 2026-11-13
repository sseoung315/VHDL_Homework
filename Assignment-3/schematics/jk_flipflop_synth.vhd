library ieee;
use ieee.std_logic_1164.all;
entity jk_flipflop is
  port (
    j: in std_logic;
    k: in std_logic;
    clk: in std_logic;
    init_clr: in std_logic;
    q: out std_logic;
    qb: out std_logic
  );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of jk_flipflop is
  signal wrap_j: std_logic;
  signal wrap_k: std_logic;
  signal wrap_clk: std_logic;
  signal wrap_init_clr: std_logic;
  signal wrap_q: std_logic;
  signal wrap_qb: std_logic;
  signal q_i : std_logic;
  signal n6 : std_logic;
  signal n7 : std_logic;
  signal n8 : std_logic;
  signal n9 : std_logic;
  signal n10 : std_logic;
  signal n11 : std_logic;
  signal n12 : std_logic;
  signal n13 : std_logic;
  signal n14 : std_logic;
  signal n15 : std_logic;
  signal n17 : std_logic;
  signal n19 : std_logic;
  signal n20 : std_logic;
  signal n25 : std_logic;
  signal n26 : std_logic := 'X';
begin
  wrap_j <= j;
  wrap_k <= k;
  wrap_clk <= clk;
  wrap_init_clr <= init_clr;
  q <= wrap_q;
  qb <= wrap_qb;
  wrap_q <= q_i;
  wrap_qb <= n25;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:19:10
  q_i <= n26; -- (isignal)
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:26:11
  n6 <= not wrap_j;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:26:21
  n7 <= not wrap_k;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:26:16
  n8 <= n7 and n6;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:28:14
  n9 <= not wrap_j;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:28:19
  n10 <= wrap_k and n9;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:30:24
  n11 <= not wrap_k;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:30:19
  n12 <= n11 and wrap_j;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:32:19
  n13 <= wrap_k and wrap_j;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:33:16
  n14 <= not q_i;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:32:7
  n15 <= q_i when n13 = '0' else n14;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:30:7
  n17 <= n15 when n12 = '0' else '1';
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:28:7
  n19 <= n17 when n10 = '0' else '0';
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:26:7
  n20 <= n19 when n8 = '0' else q_i;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:38:9
  n25 <= not q_i;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/jk_flipflop.vhd:25:5
  process (wrap_clk, wrap_init_clr)
  begin
    if wrap_init_clr = '1' then
      n26 <= '0';
    elsif rising_edge (wrap_clk) then
      n26 <= n20;
    end if;
  end process;
end rtl;

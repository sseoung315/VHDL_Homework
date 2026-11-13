library ieee;
use ieee.std_logic_1164.all;
entity rs_latch is
  port (
    s: in std_logic;
    r: in std_logic;
    q: out std_logic;
    qb: out std_logic
  );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of rs_latch is
  signal wrap_s: std_logic;
  signal wrap_r: std_logic;
  signal wrap_q: std_logic;
  signal wrap_qb: std_logic;
  signal q_i : std_logic;
  signal qb_i : std_logic;
  signal n6 : std_logic;
  signal n7 : std_logic;
  signal n8 : std_logic;
  signal n9 : std_logic;
  signal n10 : std_logic;
  signal n16 : std_logic;
  signal n18 : std_logic;
  signal n20 : std_logic;
  signal n22 : std_logic;
  signal n24 : std_logic;
  signal n25 : std_logic;
  signal n26 : std_logic;
  signal n27 : std_logic;
  signal n28 : std_logic;
  signal n29 : std_logic;
begin
  wrap_s <= s;
  wrap_r <= r;
  q <= wrap_q;
  qb <= wrap_qb;
  wrap_q <= q_i;
  wrap_qb <= qb_i;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:13:10
  q_i <= n26; -- (isignal)
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:14:10
  qb_i <= n29; -- (isignal)
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:18:22
  n6 <= not wrap_r;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:18:16
  n7 <= n6 and wrap_s;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:20:13
  n8 <= not wrap_s;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:20:19
  n9 <= wrap_r and n8;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:22:19
  n10 <= wrap_r and wrap_s;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:20:5
  n16 <= '0' when n9 = '0' else '0';
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:20:5
  n18 <= '0' when n9 = '0' else '1';
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:18:5
  n20 <= n16 when n7 = '0' else '1';
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:18:5
  n22 <= n18 when n7 = '0' else '0';
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:13:10
  n24 <= n10 or n9;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:13:10
  n25 <= n24 or n7;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:13:10
  n26 <= n20 when n25 = '1' else n26;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:14:10
  n27 <= n10 or n9;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:14:10
  n28 <= n27 or n7;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/rs_latch.vhd:14:10
  n29 <= n22 when n28 = '1' else n29;
end rtl;

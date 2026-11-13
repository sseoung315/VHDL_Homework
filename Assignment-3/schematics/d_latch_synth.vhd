library ieee;
use ieee.std_logic_1164.all;
entity d_latch is
  port (
    d: in std_logic;
    en: in std_logic;
    q: out std_logic;
    qb: out std_logic
  );
end entity;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of d_latch is
  signal wrap_d: std_logic;
  signal wrap_en: std_logic;
  signal wrap_q: std_logic;
  signal wrap_qb: std_logic;
  signal q_i : std_logic;
  signal n7 : std_logic;
  signal n8 : std_logic;
begin
  wrap_d <= d;
  wrap_en <= en;
  q <= wrap_q;
  qb <= wrap_qb;
  wrap_q <= q_i;
  wrap_qb <= n7;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/d_latch.vhd:10:10
  q_i <= n8; -- (isignal)
  -- /workspace/work/submission-repo/Assignment-3/vhdl/d_latch.vhd:19:9
  n7 <= not q_i;
  -- /workspace/work/submission-repo/Assignment-3/vhdl/d_latch.vhd:10:10
  n8 <= wrap_d when wrap_en = '1' else n8;
end rtl;

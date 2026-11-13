#!/usr/bin/env python3
"""Re-run RTL and synthesized-netlist checks. Requires GHDL 6.0.0+."""
from pathlib import Path
import subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1]
version=subprocess.run(['ghdl','--version'],text=True,capture_output=True,check=True).stdout
print(version)
for source in sorted((ROOT/'vhdl').glob('*.vhd')):
 name=source.stem
 with tempfile.TemporaryDirectory() as wd:
  def run(args):
   p=subprocess.run(['ghdl',*args],cwd=wd,text=True,capture_output=True)
   if p.returncode:raise RuntimeError(p.stdout+p.stderr)
   print(p.stdout+p.stderr,end='');return p.stdout
  run(['-a','--std=08',str(source)])
  run(['-a','--std=08',str(ROOT/'testbench'/f'tb_{name}.vhd')])
  run(['-r','--std=08',f'tb_{name}','--assert-level=error'])
  netlist=run(['--synth','--std=08','--latches',name])
 with tempfile.TemporaryDirectory() as wd:
  net=Path(wd)/f'{name}.vhd';net.write_text(netlist)
  run(['-a','--std=08',str(net)])
  run(['-a','--std=08',str(ROOT/'testbench'/f'tb_{name}.vhd')])
  run(['-r','--std=08',f'tb_{name}','--assert-level=error'])
 print(name+': RTL + synthesis + netlist simulation PASS')

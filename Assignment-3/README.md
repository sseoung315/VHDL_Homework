# (VHDL) Assignment-3 — Sequential Logic

## Reports

- [Main report — original eight-page format](report/Assignment_Sequential_Logic_FINAL.pdf)
- [Verification evidence — generated synthesis schematics, recorded waveforms and observed Logisim results](report/Verification_Evidence.pdf)
- [Editable Word report](report/Assignment_Sequential_Logic_FINAL.docx)

## Implementations

| Exercise | VHDL | Logisim checks |
| --- | --- | ---: |
| RS Latch | [rs_latch.vhd](vhdl/rs_latch.vhd) | 5 |
| D Latch | [d_latch.vhd](vhdl/d_latch.vhd) | 5 |
| Positive-edge D Flip-Flop | [d_flipflop.vhd](vhdl/d_flipflop.vhd) | 7 |
| JK Flip-Flop | [jk_flipflop.vhd](vhdl/jk_flipflop.vhd) | 14 |
| D Flip-Flop with asynchronous Set/Clear | [async_d_flipflop.vhd](vhdl/async_d_flipflop.vhd) | 10 |

[Open the five gate-level circuits](logisim/ALL_5_FULLY_WIRED.circ) in Logisim-evolution. These use individual gates and direct feedback wiring; no prebuilt latch, flip-flop or Tunnel components are used.

## Recorded verification

GHDL **6.0.0** passed analysis, elaboration, RTL simulation, synthesis, and simulation of each generated netlist. Logisim-evolution **3.9.0** passed **41/41 defined-state checks**, using the same input sequences and expected values as the VHDL testbenches. See [CSV observations](results/logisim_results.csv), [native execution log](results/gate-test.log), [simulation and synthesis logs](results/), [VCD recordings](results/) and [generated synthesis netlists / DOT schematics](schematics/).

The initial state is unspecified. For the ordinary D flip-flop, the startup row is a setup step, not a pass/fail assertion: Logisim may display E before the first valid edge, while RTL reports U. The JK implementation has an auxiliary active-high `INIT_CLR` input in **both** implementations, used to initialize the feedback state and released for ordinary Hold/Set/Reset/Toggle operation. Asynchronous Clear has priority over Set.

Input-wire ends in the supplied circuit were aligned to the actual Logisim gate pins. The gate types, positions and intended connections were preserved. [Endpoint changes](results/wiring_repairs.json) record the repair. The five VHDL sources match the code in the report.

## Reproduce

Install GHDL 6.0.0 or newer and run:

```sh
python3 scripts/run_vhdl_checks.py
```

With Java 21+ and the official Logisim-evolution 3.9.0 all-in-one JAR:

```sh
java -Djava.awt.headless=true --class-path /path/to/logisim-evolution-3.9.0-all.jar scripts/VerifyGates.java logisim/ALL_5_FULLY_WIRED.circ scripts/logisim-cases.tsv results
```

The report images use native Logisim rendering of the tested circuit state. Synthesis images come from GHDL's DOT export rendered by Graphviz. Timing plots are generated from the recorded VCD files. These tests cover the listed settled-state cases, not physical gate-delay timing or all possible inputs.

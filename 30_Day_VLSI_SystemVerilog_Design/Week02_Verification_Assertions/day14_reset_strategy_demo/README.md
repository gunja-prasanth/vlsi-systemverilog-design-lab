# Day 14 – Reset Strategy Demo (Async vs Sync)

## Objective
Demonstrate and compare asynchronous and synchronous reset strategies
using SystemVerilog and Vivado simulation.

---

## Reset Types

### Asynchronous Reset
- Reset included in sensitivity list
- Immediate response to reset signal
- Useful for quick hardware reset
- Needs proper synchronization in large designs

### Synchronous Reset
- Reset checked only at clock edge
- Predictable timing behavior
- Preferred in ASIC flows

---

## Behavioral Difference

| Feature | Async Reset | Sync Reset |
|----------|-------------|-------------|
| Reset response | Immediate | At next clock edge |
| Sensitivity list | Yes | No |
| Timing safety | Needs care | Safer |

---

## Simulation Observation
When reset is asserted mid-clock cycle:
- Async FF resets immediately.
- Sync FF waits until next rising clock edge.

---

## Key Learning
Reset strategy directly affects timing behavior,
STA closure, and metastability risk.

Choosing reset style depends on target technology
(FPGA vs ASIC) and system requirements.

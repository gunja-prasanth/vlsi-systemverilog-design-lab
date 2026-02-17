# Day 13 – Glitch-Free MUX

## Objective
Demonstrate glitch behavior in a combinational multiplexer and implement a safer design.

## Unsafe Design
Expression-based implementation:
Y = (~sel & a) | (sel & b)

Problem:
When select changes, unequal gate delays can create temporary output glitches.

## Safe Design
Case-based combinational logic using always_comb.

Benefits:
- Single decision path
- Cleaner synthesis mapping
- Reduced static hazard risk
---

## Key Learning
Understanding hazards and glitch behavior is critical in
low-power and timing-sensitive digital designs.

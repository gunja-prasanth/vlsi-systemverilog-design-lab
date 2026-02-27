# Day 23 – Gray Code Counter for CDC FIFO

## Objective
Design a parameterized Gray code counter and understand its
importance in asynchronous FIFO pointer synchronization.

---

## Binary vs Gray Code

Binary counting may change multiple bits during a single increment.

Example:
0011 → 0100 (3 bits change)

Gray code ensures only one bit changes per transition.

This property is critical for safe clock domain crossing (CDC).

---

## Why Gray Code in Async FIFO?

In asynchronous FIFO:
- Write pointer and Read pointer operate in different clock domains.
- Pointer values are synchronized across domains using flip-flop synchronizers.

If binary is used:
Multiple bit transitions may cause metastability and incorrect pointer sampling.

If Gray is used:
Only one bit changes → reduces sampling ambiguity → safer synchronization.

---

## Conversion Formula

Gray = Binary ^ (Binary >> 1)

---

## Applications

- Asynchronous FIFO
- CDC pointer synchronization
- High-speed SoC interfaces
- Network routers and memory controllers

---

## Verification

- Behavioral simulation in Vivado
- Confirmed single-bit transition property
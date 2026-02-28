# Day 24 – Mini Asynchronous FIFO

## Objective
Design a simplified asynchronous FIFO using separate write and read clocks,
Gray-coded pointers, and safe clock domain crossing techniques.

---

## Architecture Overview

- Depth: 8 entries
- Separate write and read clock domains
- Binary pointers for local addressing
- Gray pointers for CDC transfer
- 2-flop synchronizers for metastability mitigation

---

## Why Gray Code?

In asynchronous FIFO, write and read pointers cross clock domains.

Binary transitions may change multiple bits simultaneously,
causing incorrect sampling.

Gray code changes only one bit per increment,
reducing CDC ambiguity.

---

## Full Detection

FIFO is full when:
- Write pointer equals read pointer
- AND MSBs differ (wrap condition)

---

## Empty Detection

FIFO is empty when:
- Synchronized write pointer equals read pointer

---

## Key Concepts Demonstrated

- Clock Domain Crossing (CDC)
- 2-flop synchronizer
- Gray code pointer conversion
- Full/Empty detection logic

---

## Industry Relevance

Asynchronous FIFOs are used in:
- SoC interconnects
- Memory controllers
- High-speed communication interfaces
- Multi-clock systems
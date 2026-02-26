# Day 22 – Parameterized LFSR (Linear Feedback Shift Register)

## Objective
Design and verify a parameterized LFSR capable of generating pseudo-random
bit sequences. This forms the foundation for Built-In Self-Test (BIST)
and hardware test pattern generation.

---

## What is an LFSR?

An LFSR is a shift register whose input bit is a linear function (XOR)
of selected previous register bits (called taps).

It generates deterministic pseudo-random sequences.

---

## Mathematical Foundation

Sequence length for maximal LFSR:

Length = 2^N − 1

Where:
- N = number of flip-flops
- All-zero state is invalid

---

## Polynomial Selection

The feedback taps correspond to a characteristic polynomial.

Example used:
x^4 + x + 1

Binary tap mask:
1001

Choosing a primitive polynomial ensures maximal-length sequence.

Non-primitive polynomials produce shorter repeating cycles.

---

## Applications

- Built-In Self-Test (BIST)
- On-chip pattern generation
- CRC generation
- Signature analysis
- Scramblers

---

## Verification

- Behavioral simulation in Vivado
- Confirmed non-zero seed
- Verified 15-cycle maximal sequence for N=4
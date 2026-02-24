# Day 20 – Interrupt Controller

## Objective
Design and verify a parameterized interrupt controller
with priority selection and masking support.

## Features
- Parameterized number of interrupt inputs
- Fixed priority logic (highest index wins)
- Interrupt masking capability
- irq_valid and irq_id outputs

## Design Concept
Active interrupts are determined using:

active = irq & ~mask

A priority encoder selects the highest active interrupt.

## Verification
- Self-checking testbench
- Multiple directed test cases
- Mask and priority corner cases covered
- Vivado behavioral simulation

## Key Learning
- Priority encoder design
- Masking logic integration
- Parameterized hardware modules
- SoC-level interrupt management concept
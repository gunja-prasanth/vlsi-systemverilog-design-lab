# Day 04 – Priority Encoder & Decoder

## Objective
Design and verify a parameterized priority encoder and decoder using
SystemVerilog, focusing on correct priority resolution and one-hot decoding.

## Modules Implemented
- Priority Encoder (N-bit input → binary output + valid)
- Decoder (binary input → one-hot output)

## Design Highlights
- Parameterized width
- Highest-bit priority resolution
- Valid flag handling for no-request condition
- Pure combinational RTL

## Verification
- Self-checking testbench
- One-hot input validation
- Multiple active input (priority) testing
- Edge case: no request asserted

## Real-Chip Usage
- Interrupt controllers
- Bus arbitration logic
- DMA request handling
- Resource scheduling hardware

## Tools
- SystemVerilog
- Vivado Simulator

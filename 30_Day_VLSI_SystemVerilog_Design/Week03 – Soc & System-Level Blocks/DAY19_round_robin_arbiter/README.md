# Day 19 – Round Robin Arbiter

## Objective
Design and verify a parameterized Round Robin Arbiter
to ensure fair access among multiple requesters.

## Design Features
- Parameterized number of request lines (N)
- Rotating priority pointer
- Fair cyclic arbitration
- No starvation

## Architecture
1. Rotate request vector based on pointer
2. Apply priority encoder
3. Rotate grant back to original position
4. Update pointer after successful grant

## Verification
- Tested all-request-active scenario
- Tested single-request scenario
- Fairness validated via waveform rotation

## Applications
Round Robin arbitration is widely used in:
- Bus arbiters
- Network-on-Chip routers
- Shared memory systems
- SoC interconnects
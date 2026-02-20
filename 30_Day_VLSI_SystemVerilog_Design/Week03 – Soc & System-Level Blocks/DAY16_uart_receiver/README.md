# Day 16 – UART Receiver (SystemVerilog)

## Objective
Design and verify a UART Receiver supporting:
- Start bit detection
- Mid-bit sampling
- 8-bit serial data reception
- Stop bit verification
- Framing error detection

## Design Highlights
- FSM-based architecture
- Parameterized clock frequency and baud rate
- Half-bit sampling for robust reception
- Shift register for serial-to-parallel conversion

## Error Handling
- Framing error asserted if stop bit is invalid

## Verification
- Behavioral simulation in Vivado
- Serial stimulus applied via testbench
- Data valid signal confirms correct reception

## Repository Structure
rtl/  → UART RX RTL  
tb/   → Testbench  
sim/  → Waveform captures  
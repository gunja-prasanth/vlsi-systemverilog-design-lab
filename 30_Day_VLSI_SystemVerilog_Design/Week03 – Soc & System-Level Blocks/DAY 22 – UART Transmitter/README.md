# Day 15 – UART Transmitter (FSM Based)

## Objective
Design and simulate a UART Transmitter using a finite state machine
with an integrated baud rate generator.

## Features
- 8N1 Frame Format
- FSM-based control (IDLE, START, DATA, STOP)
- Baud rate generator
- LSB-first transmission
- Busy signal indication

## Frame Format
Idle (1) → Start (0) → 8 Data Bits → Stop (1)

## Verification
- Behavioral simulation in Vivado
- Transmission of 0xA5 tested
- Waveform verified for correct bit timing

## Repository Structure
rtl/
  - baud_gen.sv
  - uart_tx.sv
tb/
  - uart_tx_tb.sv
sim/
  - waveform.png

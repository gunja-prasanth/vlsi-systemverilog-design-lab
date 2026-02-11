# Day 06 – Clock Divider & Pulse Generator

## Objective
Design and verify a parameterized clock divider and a single-cycle pulse
generator using SystemVerilog.

## Clock Divider
- Parameterized divide factor
- Approximately 50% duty cycle
- Reset-safe sequential logic

## Pulse Generator
- Generates exactly one clock-wide pulse
- Triggered on rising edge of enable
- Glitch-free and synchronous

## Verification
- Behavioral simulation in Vivado
- Duty-cycle verification for divided clock
- Pulse width and the reset behavior validated

## Repository Structure
Day06_Clock_Divider_Pulse_Generator/
- rtl/ : Clock divider and pulse generator
- tb/  : Self-checking testbench
- sim/ : Waveform screenshots

----

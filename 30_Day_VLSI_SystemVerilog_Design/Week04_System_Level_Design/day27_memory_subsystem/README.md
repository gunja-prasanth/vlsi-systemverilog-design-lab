# 🟦 Day 27 – Memory Access Subsystem

## Objective
Design and verify a simple memory access architecture using SystemVerilog.

## Architecture Components
- RAM module
- Address generator
- Data processor

## Functional Flow
1. Address of generator produces sequential memory addresses.
2. RAM stores and the retrieves data.
3. Data processor modifies the retrieved memory data.
4. Processed data is written back to memory.

## Design Features
✔ Modular architecture  
✔ Parameterized memory size  
✔ Simple data processing stage  
✔ System-level module integration  

## Verification
A system-level testbench verifies:
- Address generation
- Memory read/write
- Data processing pipeline

Simulation performed using Vivado simulator.

## Repository Files
- `ram.sv`
- `address_generator.sv`
- `data_processor.sv`
- `memory_top.sv`
- `tb_memory_top.sv`

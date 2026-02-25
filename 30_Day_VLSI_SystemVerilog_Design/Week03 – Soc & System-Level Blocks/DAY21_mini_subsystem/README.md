# Day 21 – Mini Subsystem Integration

## Objective
Integrate multiple RTL modules into a small functional subsystem
demonstrating datapath and control interaction.

## Integrated Modules
- Parameterized ALU
- Multi-Mode Counter
- Synchronous FIFO

## Architecture
Counter → ALU → FIFO

## Design Highlights
- Modular reuse
- Clean top-level hierarchy
- Signal interconnection clarity
- System-level simulation

## Verification
- Behavioral simulation in Vivado
- Clock/reset validation
- Data flow observation through FIFO

## Key Learning
- Hierarchical RTL design
- Subsystem-level thinking
- Clean module interfacing
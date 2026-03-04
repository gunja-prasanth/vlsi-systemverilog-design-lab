# Day 25 – ALU Processing Subsystem

## Objective
Design a small arithmetic processing subsystem consisting of an ALU,
a register file, and a controller FSM.

## Architecture
The subsystem follows a basic datapath + control architecture:

Controller FSM → selects ALU operations
Register File → stores operands and results
ALU → performs arithmetic and logical operations

## Modules
- alu.sv : Arithmetic Logic Unit
- register_file.sv : 4x8 register storage
- controller.sv : FSM control logic
- top_subsystem.sv : Integration module
- tb_top.sv : System-level testbench

## Verification
Simulation performed in Vivado using a system-level testbench.
Controller triggers ALU operations and writes results to registers.

## Key Learning
- Datapath and control separation
- Register file design
- System-level module integration
- FSM-driven operation sequencing
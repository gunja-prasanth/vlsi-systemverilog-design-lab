# Day 26 – FIFO Communication System

## Objective
Design a simple data communication pipeline using a Producer,
FIFO buffer, and Consumer modules.

## Architecture
Producer → FIFO → Consumer

Producer continuously generates data.
FIFO temporarily stores data to handle rate mismatch.
Consumer reads data from the FIFO.

## Modules
producer.sv : Data generator module
fifo.sv : 8x8 synchronous FIFO buffer
consumer.sv : Data receiver module
top_pipeline.sv : System integration
tb_pipeline.sv : System-level testbench

## Verification
Continuous data transactions simulated in Vivado.
FIFO full and empty conditions verified.

## Key Concepts
- FIFO-based communication
- Producer–consumer architecture
- Flow control using full/empty signals
- System-level RTL integration
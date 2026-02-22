# Day 18 – Simple APB-Like Bus Protocol

## 📌 Objective
Design and verify a simplified APB-like master–slave communication system using SystemVerilog.  
The goal of this task is to understand bus protocol timing, handshake mechanisms, and master-slave transaction flow.

---

## 🏗 System Architecture

This implementation consists of:

- APB Master (FSM-based controller)
- APB Slave (Memory-mapped peripheral)
- Single clock domain (PCLK)
- Active-low reset (PRESETn)

The master initiates read and write transactions, while the slave responds using the PREADY handshake mechanism.

---

## ⚙️ Master Design

The APB master is implemented using a 3-state FSM:

| State   | Description |
|----------|------------|
| IDLE     | Waits for transaction request |
| SETUP    | Asserts PSEL and prepares address/data |
| ACCESS   | Asserts PENABLE and waits for PREADY |

### Master Responsibilities
- Generate PSEL and PENABLE correctly
- Drive address and write data
- Capture read data
- Assert `done` when transaction completes

---

## 💾 Slave Design

The APB slave contains:

- 256-entry memory array
- Synchronous write logic
- Read data return logic
- PREADY generation during ACCESS phase

### Slave Behavior
- Write occurs when PWRITE = 1
- Read occurs when PWRITE = 0
- PREADY asserted during valid transfer

---

## 🔁 APB Signal Flow

Key signals used:

- PSEL
- PENABLE
- PWRITE
- PADDR
- PWDATA
- PRDATA
- PREADY

Transaction follows standard APB timing:

1. SETUP phase → PSEL asserted
2. ACCESS phase → PENABLE asserted
3. Completion when PREADY = 1

---

## 🧪 Verification Strategy

Testbench performs:

- One WRITE transaction
- One READ transaction
- Data comparison check
- `$fatal` on mismatch

### Verified Conditions

✔ Correct IDLE → SETUP → ACCESS sequence  
✔ Proper PSEL and PENABLE timing  
✔ Successful write to slave memory  
✔ Correct readback of stored data  
✔ Functional handshake using PREADY  

Simulation performed in Vivado (Behavioral Simulation).

---

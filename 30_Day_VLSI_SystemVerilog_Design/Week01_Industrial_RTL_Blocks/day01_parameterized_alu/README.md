# 🟦 Day 01 – Parameterized N-bit ALU (SystemVerilog)

## 🎯 Objective
Design and verify a reusable, parameterized N-bit Arithmetic Logic Unit (ALU)
using **SystemVerilog** with correct flag generation and self-checking
verification in Vivado.

---

## ⚙️ ALU Operations
The ALU supports the following operations selected using a control signal:

| ALU_SEL | Operation |
|--------|-----------|
| 000 | ADD |
| 001 | SUB |
| 010 | AND |
| 011 | OR |
| 100 | XOR |

🧠 The data width of the ALU is parameterized, enabling scalability and reuse.

---

## 🧩 Design Highlights
✔ Parameterized data width (`N`)  
✔ Pure combinational design  
✔ Uses `always_comb` for synthesis-safe logic  
✔ Extended arithmetic for carry detection  
✔ Clean and modular RTL structure  

---

## 🚩 Flag Description

- **Z – Zero Flag**  
  ✔ Set when the output result equals zero  

- **C – Carry Flag**  
  ✔ Indicates carry-out from the MSB during addition or subtraction  

- **V – Overflow Flag**  
  ✔ Detects signed overflow during arithmetic operations  

---

## 🧪 Verification Strategy
✔ Self-checking SystemVerilog testbench  
✔ Directed test cases for each ALU operation  
✔ Automatic **PASS / FAIL** reporting  
✔ No manual waveform dependency  

---

## 📊 Simulation
🛠 Tool Used: **Vivado Simulator**

✔ Behavioral simulation performed  
✔ Waveforms observed for:
- ADD and SUB operations  
- Logical operations  
- Zero and carry conditions  

---

## 📁 Repository Structure
Day01_Parameterized_ALU/
├── rtl/ ▶ ALU RTL (SystemVerilog)
├── tb/ ▶ Self-checking testbench
├── sim/ ▶ Simulation waveforms/screenshots
└── README.md
---

## 🧠 Key Takeaways
✔ Importance of parameterized RTL design  
✔ Correct handling of arithmetic flags  
✔ Value of self-checking testbenches  

----
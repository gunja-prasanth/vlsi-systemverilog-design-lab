# 🟦 Day 09 – FIFO Verification

## 🎯 Objective
Verify the correctness of the synchronous FIFO design by testing
overflow and underflow conditions using directed test cases and assertions.

---

## 🧪 Test Cases Performed

### 1️⃣ Overflow Test
- FIFO filled to maximum capacity
- Additional write attempted
- Verified that:
  - `full` signal asserted
  - Write pointer did not increment
  - No data corruption occurred

### 2️⃣ Underflow Test
- FIFO emptied completely
- Additional read attempted
- Verified that:
  - `empty` signal asserted
  - Read pointer did not increment
  - Output remained stable

---

## 🛡 Assertions Added
- Overflow detection assertion
- Underflow detection assertion
- Simulation stops if protocol violation occurs

---

## 📊 Simulation Tool
- Vivado Simulator
- Behavioral simulation with waveform proof

---

## 🧠 Key Learning
- Importance of boundary condition testing
- How to detect protocol violations
- Role of assertions in RTL verification

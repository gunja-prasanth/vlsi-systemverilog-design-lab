## 🟦 DAY 2 – Multi-Mode Counter  
### 🔍 Result Verification & Analysis

## ✅ Overall Status  
✔ Design is correct  
✔ Simulation is correct  
✔ Testbench is correct  
✔ Day-2 task successfully completed  

---

## 🧩 Elaborated Design Check (RTL View)

✔ Adder block (+1) present  
✔ Subtractor block (−1) present  
✔ MUX controlled by `up_down`  
✔ MUX controlled by `load`  
✔ Register with:
- 🔸 Clock enable (`en`)
- 🔸 Asynchronous active-low reset (`reset_n`)

👉 Hardware structure exactly matches RTL intent  

---

## 📊 Simulation Waveform Analysis

### 🔹 Reset Phase
- `reset_n = 0`
- `count = 00`

✔ Counter resets correctly  

---

### 🔹 Load Operation
- `en = 1`
- `load = 1`
- `load_val = 0A`

⏱ On next clock edge:
- `count = 0A`

✔ Load operation has highest priority  

---

### 🔹 Count Up Mode
- `load = 0`
- `up_down = 1`

Clock transitions:
0A → 0B → 0C
✔ Counter increments correctly  

---

### 🔹 Count Down Mode
- `up_down = 0`

Clock transitions:
0C → 0B → 0A
✔ Counter decrements correctly  

---

### 🔹 Clock Enable Test
- `en = 0`
- Clock continues toggling

Result:
count remains at 0A
✔ Clock enable correctly freezes the counter  

---

## 🧠 Signal Behavior Summary

| Signal | Expected Behavior | Observed |
|--------|------------------|----------|
| `reset_n` | Clears counter | ✔ |
| `en` | Freezes state | ✔ |
| `load` | Overrides count | ✔ |
| `up_down` | Direction control | ✔ |
| `count` | Matches TB | ✔ |

---

## 🎯 Final Verdict

✔ RTL logic is clean  
✔ Testbench is synchronized  
✔ No race conditions  
✔ No glitches  
✔ Fully functional design  

----
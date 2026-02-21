# 🟦 Day 17 – UART Verification (Loopback Test)

## 🎯 Objective
Verify proper integration of UART Transmitter and UART Receiver  
using a loopback configuration in simulation.

The goal is to confirm that transmitted data is correctly received
without corruption under synchronized baud timing.

---

## 🔄 Verification Method – Loopback Configuration

The UART TX output is directly connected to the UART RX input.

This setup validates:
- End-to-end serial communication
- Correct start bit detection
- Proper data bit sampling
- Correct stop bit handling

---

## ⚙️ Design Components

### Transmitter (UART_TX)
- Sends 8-bit data frame
- Generates:
  - Start bit
  - 8 data bits (LSB first)
  - Stop bit
- Uses baud_tick for timing control

### Receiver (UART_RX)
- Detects start bit
- Samples data bits
- Validates stop bit
- Outputs:
  - `data_out`
  - `done`
  - `error`

---

## 🧪 Testbench Strategy

✔ Generated system clock  
✔ Created baud_tick generator  
✔ Applied reset sequence  
✔ Sent test byte (`8'hA5`)  
✔ Waited for `rx_done`  
✔ Compared transmitted and received data  

Simulation prints:

if verification succeeds.

---

## 📊 Simulation

Tool Used: **Vivado Simulator**

Waveforms Observed:
- `tx_line`
- `rx_data`
- `rx_done`
- `baud_tick`
- Start and Stop bit timing

---

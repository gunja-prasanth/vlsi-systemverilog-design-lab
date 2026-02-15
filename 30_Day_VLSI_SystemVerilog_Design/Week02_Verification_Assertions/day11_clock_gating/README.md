# 🟦 Day 11 – Clock Gating (RTL Level)

## 🎯 Objective
Implement clock gating concepts at RTL level using
a safe enable-based approach to reduce unnecessary switching activity.

---

## ❌ Unsafe Direct Gating

Direct AND-based clock gating:

assign gated_clk = clk & enable;

Problems:
- Glitches
- Timing violations
- Metastability risks

---

## ✅ Safe RTL Approach

Instead of modifying clock signal,
use clock enable logic inside sequential block:

- Flip-flop updates only when enable = 1
- Clock path remains untouched
- Synthesis tools can infer clock gating cells

---

## 🧪 Verification

- Counter increments only when enable is high
- Counter holds when enable is low
- Simulated using Vivado

---

## 🔋 Power Relevance

Clock toggling consumes dynamic power.

Enable-based gating:
- Reduces switching activity
- Improves power efficiency
- Common in low-power SoC design

---

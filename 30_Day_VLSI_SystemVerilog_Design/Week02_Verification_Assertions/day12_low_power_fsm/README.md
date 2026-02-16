# Day 12 – Low-Power FSM

## Objective
Implement FSMs using different state encoding techniques and
analyze switching activity for low-power design consideration.

## Encodings Implemented
- Binary Encoding
- One-Hot Encoding

## Comparison

Binary:
- Fewer flip-flops
- Higher switching per transition

One-Hot:
- More flip-flops
- Lower switching activity
- Often better for small FSMs

## Power Consideration
Dynamic Power ∝ Switching Activity

One-hot encoding can reduce switching factor (α),
thus improving power efficiency in small designs.

## Tool Used
Vivado Simulator

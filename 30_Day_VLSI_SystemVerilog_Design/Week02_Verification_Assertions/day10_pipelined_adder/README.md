# Day 10 – Pipelined Adder

## Objective
To compare combinational and pipelined adder architectures
and analyze latency and throughput trade-offs.

---

## Implementations

### Combinational Adder
- Single-cycle output
- Long critical path
- Limited clock frequency

### 2-Stage Pipelined Adder
- Logic split across two stages
- Registers reduce critical path
- Higher operating frequency
- Increased latency

---

## Latency vs Throughput

| Design | Latency | Throughput |
|--------|----------|-------------|
| Combinational | 1 cycle | 1 result per slow cycle |
| Pipelined | 2 cycles | 1 result per clock (after fill) |

---

## Key Learning

- Pipelining improves throughput by reducing critical path.
- Latency increases but frequency improves.
- Widely used in CPUs and high-speed arithmetic blocks.

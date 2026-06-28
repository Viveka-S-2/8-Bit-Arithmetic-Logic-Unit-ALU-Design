# 8-Bit-Arithmetic-Logic-Unit-ALU-Design

This project implements an **8-bit Arithmetic Logic Unit (ALU)** using **Verilog HDL** with a modular Register Transfer Level (RTL) design approach. The ALU supports arithmetic, logical, shift, and multiplication operations. Each hardware module was designed independently, verified using dedicated testbenches, and then integrated into a top-level ALU.

The design was developed and functionally verified using **Xilinx Vivado 2025.2**.

---

## Features

* 8-bit Ripple Carry Adder (RCA)
* Logic Unit

  * AND
  * OR
  * XOR
  * XNOR
  * NOT
* Universal Shift Register (USR)

  * Hold
  * Shift Left
  * Shift Right
  * Parallel Load
* Hierarchical 8×8 Vedic Multiplier
* 4-to-1 Multiplexer
* Top-Level 8-bit ALU Integration
* Individual testbenches for each module
* Functional simulation and verification using Xilinx Vivado

---

## Project Structure

```text
Design_sources/
├── alu_8bit.v
├── full_adder.v
├── ripple_carry_adder_8bit.v
├── logic_unit.v
├── universal_shift_register.v
├── mux.v
├── vedic_2x2_multiplier.v
├── vedic_4x4_multiplier.v
└── vedic_8x8_multiplier.v

Testbench_sources/
├── alu_8bit_tb.v
├── full_adder_tb.v
├── rcadder_8bit_tb.v
├── logic_unit_tb.v
├── usregister_tb.v
├── mux_tb.v
├── vm_2x2_tb.v
├── vm_4x4_tb.v
└── vm_8x8_tb.v

Images/
├── rtl_schematic.png
└── alu_waveform.png
```

---

## ALU Operations

### MUX Selection

| `mux_sel` | Operation                           |
| --------- | ----------------------------------- |
| `00`      | Ripple Carry Adder                  |
| `01`      | Logic Unit                          |
| `10`      | Universal Shift Register            |
| `11`      | 8×8 Vedic Multiplier (Lower 8 bits) |

### Logic Unit Operations

| Opcode | Operation |
| ------ | --------- |
| `001`  | AND       |
| `010`  | OR        |
| `011`  | XOR       |
| `100`  | XNOR      |
| `101`  | NOT       |

---

## Module Hierarchy

```text
alu_8bit
├── ripple_carry_adder_8bit
├── logic_unit
├── universal_shift_register
├── vedic_8x8_multiplier
│   ├── vedic_4x4_multiplier
│   │   └── vedic_2x2_multiplier
└── mux
```

---

## Simulation Results

The complete ALU was functionally verified using Verilog testbenches in **Xilinx Vivado 2025.2**.

The simulation validates:

* Arithmetic addition
* Logical operations
* Shift register operations
* Hierarchical Vedic multiplication
* Top-level ALU functionality

### RTL Schematic

> Add the RTL schematic image here (`Images/rtl_schematic.png`).

### Simulation Waveform

> Add the final ALU waveform here (`Images/final_Wave_form.png`).

---

## Tools Used

* Verilog HDL
* Xilinx Vivado 2025.2

---

## Author

**Viveka S**

B.Tech, Electrical Engineering

Indian Institute of Technology Jodhpur

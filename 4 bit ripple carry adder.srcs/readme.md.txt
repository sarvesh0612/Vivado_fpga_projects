# 4-Bit Ripple Carry Adder – Verilog

This project implements a **4-bit Ripple Carry Adder (RCA)** using Verilog HDL.  
The design adds two 4-bit binary numbers and produces a 4-bit sum along with a carry-out.

## Description
The Ripple Carry Adder is constructed by cascading **four 1-bit full adders**.  
Each full adder generates a carry that “ripples” to the next stage, making the design simple but with increasing delay for higher bit widths.

## Features
- 4-bit binary addition
- Carry-in and carry-out support
- Modular full-adder based design
- Fully synthesizable RTL code

## Design Architecture
- Four 1-bit full adders connected in series
- Carry propagates from LSB to MSB
- Combinational logic implementation

## Files
- `fa.v` – 1-bit full adder module  
- `ripple4bit.v` – Top-level 4-bit RCA module  
- `ripple_4bit_tb.v` – Testbench for functional verification (optional)

## Tools Used
- Verilog HDL
- Xilinx Vivado

## Applications
- Arithmetic Logic Units (ALUs)
- Processor datapaths
- Digital system fundamentals
- VLSI and FPGA learning projects

## Notes
Although simple and area-efficient, the ripple carry adder suffers from **carry propagation delay**, which motivates faster adders such as **Carry Lookahead** and **Carry Select** adders.

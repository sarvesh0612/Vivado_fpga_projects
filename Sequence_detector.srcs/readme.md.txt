# Sequence Detector – FSM Based Design (Verilog)

This project implements a **sequence detector** using both a Mealy and Moore **Finite State Machine (FSM)** in Verilog HDL.

## Description
The circuit detects a predefined binary input sequence and asserts an output when the sequence is successfully detected.  
Both **overlapping and non-overlapping** detection techniques can be implemented using FSM transitions.
Here we have taken overlapping.

## Features
- FSM-based design approach
- Synchronous operation
- Reset support
- Overlapping sequence detection (configurable)

## FSM Components
- Defined states representing partial sequence matches
- State transition logic
- Output logic (Moore/Mealy based)

## Tools Used
- Verilog HDL
- Xilinx Vivado

## Applications
- Digital communication systems
- Pattern recognition
- Control logic design
- FSM interview problems

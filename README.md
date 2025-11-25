# Carry Look-Ahead Adder (CLA) – Verilog Implementation

This repository contains a **16-bit Carry Look-Ahead Adder (CLA)** implemented in Verilog, along with a testbench and instructions for simulation using **Icarus Verilog** and waveform viewing with **GTKWave**.

---

## Features
- Fast carry computation using Generate (G) and Propagate (P) logic  
- Fully combinational 16-bit CLA  
- Includes testbench (`CLA_tb.v`)  
- Compatible with Icarus Verilog + GTKWave workflow  
- Synthesizable design  

---

## File Structure
```
CLA.v              # CLA module  
CLA_tb.v           # Testbench for simulation  
run_verilog.ps1    # (Optional) Windows automation script  
run_verilog.sh     # (Optional) Linux automation script  
```

Both scripts are included in this repository.  
Users may **optionally** use them to automate compile → simulate → waveform steps.

---

## Running the Simulation (Manual Method)

Place `CLA.v` and `CLA_tb.v` in the same directory.

### 1. Compile the Design
```bash
iverilog -o cla_sim CLA.v CLA_tb.v
```

### 2. Run the Simulation
```bash
vvp cla_sim
```

This generates:
```
CLA_tb.vcd
```

### 3. View the Waveform
```bash
gtkwave CLA_tb.vcd
```

---

## Optional Automation Scripts

This repository includes:

- `run_verilog.ps1` for **Windows (PowerShell)**  
- `run_verilog.sh` for **Linux / WSL**

These scripts automatically:

1. Compile the testbench  
2. Run the simulation  
3. Open the generated VCD waveform in GTKWave  

Users may run them if they prefer an automated workflow.

---

## Tools Used
- **Icarus Verilog** for compilation and simulation  
- **GTKWave** for waveform visualization  

---

## Author
Rohit Mishra

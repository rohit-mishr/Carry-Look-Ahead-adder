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
CLA.v        # CLA module
CLA_tb.v     # Testbench for simulation
run_verilog.ps1  # (Optional) Windows auto-run script
run_verilog.sh   # (Optional) Linux auto-run script
```

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

## Windows PowerShell Script (Automated)

Save as **run_verilog.ps1**:

```powershell
# Prompt user for the filename (without extension)
$filename = Read-Host -Prompt "Enter the filename (without extension)"

if (-not [string]::IsNullOrWhiteSpace($filename)) {

    Write-Host "Executing: iverilog -o ${filename}_tb.vvp ${filename}_tb.v"
    iverilog -o "${filename}_tb.vvp" "${filename}_tb.v"

    if (Test-Path "${filename}_tb.vvp") {

        Write-Host "Executing: vvp ${filename}_tb.vvp"
        vvp "${filename}_tb.vvp"

        $vcdFile = "${filename}_tb.vcd"

        if (Test-Path $vcdFile) {
            Write-Host "Executing: gtkwave $vcdFile"
            gtkwave $vcdFile
        } else {
            Write-Host "Simulation completed, but $vcdFile was not created."
        }

    } else {
        Write-Host "Compilation failed."
    }

} else {
    Write-Host "Filename cannot be empty."
}
```

---

## Linux Script (Automated)

Save as **run_verilog.sh** and make executable (`chmod +x run_verilog.sh`):

```bash
#!/bin/bash

read -p "Enter the filename (without extension): " filename

if [[ -n "$filename" ]]; then
    echo "Executing: iverilog -o ${filename}_tb.vvp ${filename}_tb.v"
    iverilog -o "${filename}_tb.vvp" "${filename}_tb.v"

    if [[ -f "${filename}_tb.vvp" ]]; then
        echo "Executing: vvp ${filename}_tb.vvp"
        vvp "${filename}_tb.vvp"

        if [[ -f "${filename}_tb.vcd" ]]; then
            echo "Opening GTKWave..."
            gtkwave "${filename}_tb.vcd"
        else
            echo "Simulation completed but VCD file not found."
        fi
    else
        echo "Compilation failed."
    fi
else
    echo "Filename cannot be empty."
fi
```

---

## Tools Used
- **Icarus Verilog** for compilation + simulation  
- **GTKWave** for waveform visualization  

---

## Author
Rohit Mishra


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

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

# Folder where this script is located
$Folder = $PSScriptRoot

# UTF-8 WITH BOM encoder
$utf8Bom = New-Object System.Text.UTF8Encoding($true)

function Test-HasUtf8Bom {
    param([byte[]]$Bytes)
    return ($Bytes.Length -ge 3 -and
            $Bytes[0] -eq 0xEF -and
            $Bytes[1] -eq 0xBB -and
            $Bytes[2] -eq 0xBF)
}

function Test-HasCrlf {
    param([string]$Text)
    return $Text.Contains("`r`n")
}

Get-ChildItem -Path $Folder -Recurse -File -Include *.yml, *.yaml | ForEach-Object {
    $path = $_.FullName

    try {
        # Read raw bytes
        $bytes = [System.IO.File]::ReadAllBytes($path)

        # Detect BOM
        $hasBom = Test-HasUtf8Bom $bytes

        # Read as UTF-8
        $text = [System.Text.Encoding]::UTF8.GetString($bytes)

        # Detect CRLF
        $hasCrlf = Test-HasCrlf $text

        # Normalize line endings only if needed
        if (-not $hasCrlf) {
            $text = $text -replace "`r?`n", "`r`n"
        }

        # Split into lines
        $lines = $text -split "`r`n"
        $out = New-Object System.Collections.Generic.List[string]

        for ($i = 0; $i -lt $lines.Count; $i++) {
            $line = $lines[$i]

            # First line stays untouched
            if ($i -eq 0) {
                $out.Add($line)
                continue
            }

            # Remove whitespace from empty lines
            if ($line.Trim() -eq "") {
                $out.Add("")
                continue
            }

            # Comment lines stay untouched
            if ($line.TrimStart().StartsWith("#")) {
                $out.Add($line)
                continue
            }

            # All other lines must start with exactly one space
            $out.Add(" " + $line.TrimStart())
        }

        # Join with CRLF
        $final = [string]::Join("`r`n", $out)

        # Write back using UTF-8 WITH BOM (only adds BOM if missing)
        [System.IO.File]::WriteAllText($path, $final, $utf8Bom)

        Write-Host "Normalized YAML: $path"
    }
    catch {
        Write-Host "Skipped (error): $path - $($_.Exception.Message)"
    }
}

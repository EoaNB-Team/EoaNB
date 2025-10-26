Param(
    [switch]$Apply,
    [int]$Limit = 0
)

$WriteHostMessage = "move_equipment_blocks.ps1 - starting (Apply = $Apply)"
Write-Host $WriteHostMessage

# Exclude reference files so they remain unchanged for comparison
$excludeFiles = @()
$countryFiles = Get-ChildItem -Path ".\history\countries\[A-P]*.txt" -File | Where-Object { $excludeFiles -notcontains $_.Name } | Sort-Object Name
Write-Host "Excluding files: $($excludeFiles -join ', ')"
if ($Limit -gt 0) { 
    Write-Host "Limiting processing to first $Limit files for testing." 
    $countryFiles = $countryFiles | Select-Object -First $Limit
}
if ($countryFiles.Count -eq 0) {
    Write-Host "No country files found under .\history\countries\ matching [A-P]*.txt"
    return
}

foreach ($file in $countryFiles) {
    Write-Host "Processing $($file.Name)..."

    # No backups will be created (user requested no .bak files)

    $content = Get-Content -Path $file.FullName -Raw

    # Remove any previously inserted Equipment Setup blocks (conservative removal)
    $content = [regex]::Replace($content, '(?ms)^[ \t]*###\s*Equipment\s+Setup\s*###\s*(?:\r?\n[ \t]*(?:add_equipment_to_stockpile\s*=\s*(?:\{[^}]*\}|[^\r\n]+)\s*))*', '')

    # Split into date sections (keep leading non-date header in sections[0])
    $sections = [regex]::Split($content, '(?=(?m)^\d{4}\.\d{1,2}\.\d{1,2}\s*=\s*\{)')
    $newContent = $sections[0]

    for ($i = 1; $i -lt $sections.Count; $i++) {
        $section = $sections[$i]
        if ([string]::IsNullOrWhiteSpace($section)) {
            $newContent += $section
            continue
        }

        # Match equipment blocks (single-line or brace block)
        $equipmentPattern = '(?ms)add_equipment_to_stockpile\s*=\s*(\{[^}]*\}|[^\r\n]+)'
        $matches = [regex]::Matches($section, $equipmentPattern)
        if ($matches.Count -eq 0) {
            $newContent += $section
            continue
        }

        # Collect original equipment blocks (preserve exact inner text)
        $blocks = @()
        foreach ($m in $matches) { $blocks += $m.Value.Trim() }

        # Remove equipment blocks from the section
        #$newSection = [regex]::Replace($section, "^\s*($equipmentPattern)\s*$`r?`n?", ' ', 'Multiline')
        $newSection = ($section -split "`r?`n" | Where-Object { -not ($_ -match $equipmentPattern) }) -join "`n"

        # Determine indentation for insertion (prefer indentation of set_technology)
        $techIndentMatch = [regex]::Match($newSection, '(?m)^(?<indent>[ \t]*)set_technology\s*=\s*\{')
        if ($techIndentMatch.Success) { $indent = $techIndentMatch.Groups['indent'].Value } else { $indent = "`t" }

        # Build insertion string with header + indented blocks
        $lines = @()
        $lines += "$indent "
        $lines += "$indent### Equipment Setup ###"
        foreach ($b in $blocks) {
            $trim = $b.Trim()
            if ($trim.StartsWith('{')) {
                # Re-indent multiline brace blocks for readability
                $parts = $trim -split '\r?\n'
                foreach ($p in $parts) { $lines += ($indent + "`t" + $p.Trim()) }
            } else {
                $lines += ("`t" + $trim)
            }
        }
        $insertString = "`r`n" + ($lines -join "`r`n") + "`r`n"

        # Try to insert after the set_technology block (after its closing brace)
        $techBlockMatch = [regex]::Match($newSection, '(?ms)(^\s*set_technology\s*=\s*\{.*?\})(\s*)')
        if ($techBlockMatch.Success) {
            $techBlock = $techBlockMatch.Groups[1].Value
            # Replace only the first occurrence of the tech block by inserting after it
            $pos = $newSection.IndexOf($techBlock)
            if ($pos -ge 0) {
                $before = $newSection.Substring(0, $pos + $techBlock.Length)
                $after = $newSection.Substring($pos + $techBlock.Length)
                $newSection = $before + $insertString + $after
            }
        } else {
            # No technology block found — append the equipment block near the end of the date section
            $newSection = $newSection.TrimEnd() + $insertString + "`r`n"
        }

        $newContent += $newSection
    }

    $final = $newContent.TrimEnd() + "`r`n"

    if ($Apply) {
        Set-Content -Path $file.FullName -Value $final -NoNewline
        Write-Host "Applied changes to $($file.Name)"
    } else {
        Write-Host "Dry-run: would modify $($file.Name)"
    }
}

Write-Host "Done. Re-run with -Apply to write changes to files."

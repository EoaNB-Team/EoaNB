# Folder where this script is located
$Folder = $PSScriptRoot

# Keywords to match
$keywords = 'allowed','available','visible','activation'

function Get-EncodingForFile {
    param([string]$Path)

    $bytes = [System.IO.File]::ReadAllBytes($Path)

    # UTF-8 BOM
    if ($bytes.Length -ge 3 -and
        $bytes[0] -eq 0xEF -and
        $bytes[1] -eq 0xBB -and
        $bytes[2] -eq 0xBF) {
        return New-Object System.Text.UTF8Encoding($true)
    }

    # UTF-16 LE BOM
    if ($bytes.Length -ge 2 -and
        $bytes[0] -eq 0xFF -and
        $bytes[1] -eq 0xFE) {
        return [System.Text.Encoding]::Unicode
    }

    # UTF-16 BE BOM
    if ($bytes.Length -ge 2 -and
        $bytes[0] -eq 0xFE -and
        $bytes[1] -eq 0xFF) {
        return [System.Text.Encoding]::BigEndianUnicode
    }

    # No BOM → assume system ANSI (Windows-1252 on your machine)
    return [System.Text.Encoding]::Default
}

Get-ChildItem -Path $Folder -Recurse -File -Include *.txt | ForEach-Object {
    $path = $_.FullName
    try {
        # Detect encoding
        $encoding = Get-EncodingForFile $path

        # Read using detected encoding
        $lines = [System.IO.File]::ReadAllLines($path, $encoding)
        if (-not $lines -or $lines.Count -lt 3) { return }

        $changed = $false
        $out = New-Object System.Collections.Generic.List[string]

        $i = 0
        while ($i -lt $lines.Count) {

            $line = $lines[$i]

            $m = [regex]::Match($line, '^(?<indent>\s*)(?<key>allowed|available|visible|activation)\s*=\s*\{\s*$')

            if ($m.Success) {
                if ($i + 2 -lt $lines.Count) {
                    $middle  = $lines[$i + 1]
                    $closing = $lines[$i + 2]

                    if ($closing -match '^\s*\}\s*$') {

                        $indent  = $m.Groups['indent'].Value
                        $key     = $m.Groups['key'].Value
                        $content = $middle.Trim()

                        # Skip if middle line contains a comment
                        if ($middle -match '#') {
                            $out.Add($line)
                            $i++
                            continue
                        }

                        if ($content -ne '') {
                            $out.Add("$indent$key = { $content }")
                            $changed = $true
                            $i += 3
                            continue
                        }
                    }
                }
            }

            $out.Add($line)
            $i++
        }

        if ($changed) {
            # Write using the SAME encoding we detected
            [System.IO.File]::WriteAllLines($path, $out, $encoding)
            Write-Host "Compressed: $path"
        }
    }
    catch {
        Write-Host "Skipped (error): $path - $($_.Exception.Message)"
    }
}
# Folder where this script is located
$Folder = $PSScriptRoot

# Keywords to match
$keywords = 'allowed','available','visible','activation'

function Test-IsUtf8NoBom {
    param([byte[]]$Bytes)
    try {
        $utf8 = New-Object System.Text.UTF8Encoding($false, $true)
        $null = $utf8.GetString($Bytes)
        return $true
    }
    catch { return $false }
}

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

    # Ignore UTF-16 entirely
    if ($bytes.Length -ge 2 -and
        (($bytes[0] -eq 0xFF -and $bytes[1] -eq 0xFE) -or
         ($bytes[0] -eq 0xFE -and $bytes[1] -eq 0xFF))) {
        return $null
    }

    # UTF-8 without BOM
    if (Test-IsUtf8NoBom -Bytes $bytes) {
        return New-Object System.Text.UTF8Encoding($false)
    }

    # Otherwise ANSI / Windows-1252
    return [System.Text.Encoding]::Default
}

Get-ChildItem -Path $Folder -Recurse -File -Include *.txt | ForEach-Object {
    $path = $_.FullName
    try {
        $encoding = Get-EncodingForFile $path
        if ($encoding -eq $null) {
            Write-Host "Skipped UTF-16: $path"
            return
        }

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
            [System.IO.File]::WriteAllLines($path, $out, $encoding)
            Write-Host "Compressed: $path"
        }
    }
    catch {
        Write-Host "Skipped (error): $path - $($_.Exception.Message)"
    }
}

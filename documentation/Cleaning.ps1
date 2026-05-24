# Folder where this script is located
$Folder = $PSScriptRoot

# Folder where this script is located
$Folder = $PSScriptRoot

# Keywords to match
$keywords = 'allowed','available','visible','activation'

# Use system default encoding (typically Windows-1252 on Windows)
$encoding = [System.Text.Encoding]::Default

Get-ChildItem -Path $Folder -Recurse -File -Include *.txt | ForEach-Object {
    $path = $_.FullName
    try {
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

                        # Skip if middle line has a comment
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

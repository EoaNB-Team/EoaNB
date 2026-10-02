# Lists date conditions between 1850 and 1869 found in common/ and events/, to review what an
# 1854 start changes (a "date < X" gate that was closed after the 1857 start is now open).
# Output: docs/generated_date_gates.csv   Usage (repo root):  pwsh tools/scan_date_gates.ps1
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$re = [regex]'(?i)\b(date|has_start_date)\s*(<=|>=|<|>|=)\s*"?(18[56]\d)\.(\d+)\.(\d+)'
$rows = foreach ($f in Get-ChildItem common, events -Recurse -File -Include *.txt) {
    $n = 0
    foreach ($l in [IO.File]::ReadLines($f.FullName)) {
        $n++
        if ($l.TrimStart().StartsWith('#')) { continue }
        $m = $re.Match($l)
        if ($m.Success) {
            [pscustomobject]@{
                file = $f.FullName.Substring((Get-Location).Path.Length + 1).Replace('\', '/')
                line = $n
                trigger = $m.Groups[1].Value
                op = $m.Groups[2].Value
                date = ('{0}.{1}.{2}' -f $m.Groups[3].Value, $m.Groups[4].Value, $m.Groups[5].Value)
                text = $l.Trim()
            }
        }
    }
}
$rows | Export-Csv docs/generated_date_gates.csv -NoTypeInformation -Encoding utf8
"{0} date gates written to docs/generated_date_gates.csv" -f @($rows).Count
$rows | Group-Object { $_.file -replace '^(common/[^/]+|events).*$', '$1' } | Sort-Object Count -Descending | Select-Object -First 12 | ForEach-Object { "{0,5}  {1}" -f $_.Count, $_.Name }

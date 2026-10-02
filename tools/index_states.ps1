# Builds docs/generated_state_index.csv from history/states, localisation and map/strategicregions.
# Usage (from repo root):  pwsh tools/index_states.ps1
# Limitations: regex based, not a real Clausewitz parser. Owner/cores are taken from the base
# history block; dated blocks are reported separately in owner_changes as "date:owner".

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

# province -> strategic region
$provRegion = @{}
foreach ($f in Get-ChildItem map/strategicregions -File) {
    $t = [IO.File]::ReadAllText($f.FullName)
    $name = ($f.BaseName -replace '^\d+-', '')
    if ($t -match '(?s)provinces\s*=\s*\{([^}]*)\}') {
        foreach ($p in ($Matches[1] -split '\s+' | Where-Object { $_ -match '^\d+$' })) { $provRegion[$p] = $name }
    }
}

# state id -> localised name
$locName = @{}
foreach ($f in Get-ChildItem localisation/english -File -Filter '*.yml') {
    foreach ($l in [IO.File]::ReadLines($f.FullName)) {
        if ($l -match '^\s*STATE_(\d+):\d*\s*"([^"]*)"') { $locName[$Matches[1]] = $Matches[2] }
    }
}

$dateRe = [regex]::new('\G\d{4}\.\d+\.\d+\s*=\s*\{')
$rows = foreach ($f in Get-ChildItem history/states -File) {
    $t = [IO.File]::ReadAllText($f.FullName)
    if ($t -notmatch '(?m)^\s*id\s*=\s*(\d+)') { continue }
    $id = $Matches[1]
    $nameKey = if ($t -match 'name\s*=\s*"([^"]+)"') { $Matches[1] } else { '' }
    $provs = @(if ($t -match '(?s)provinces\s*=\s*\{([^}]*)\}') { $Matches[1] -split '\s+' | Where-Object { $_ -match '^\d+$' } })
    $region = ''
    if ($provs.Count -gt 0 -and $provRegion.ContainsKey([string]$provs[0])) { $region = $provRegion[[string]$provs[0]] }

    # split dated blocks (e.g. 1870.5.19 = { ... }) from the base history block by brace depth
    $owner = ''; $changes = @(); $baseSb = New-Object Text.StringBuilder
    $hs = $t.IndexOf('history')
    $hist = if ($hs -ge 0) { $t.Substring($hs) } else { $t }
    $i = 0; $depth = 0
    while ($i -lt $hist.Length) {
        $m = $null
        if ($depth -eq 1 -and [char]::IsDigit($hist[$i])) { $m = $dateRe.Match($hist, $i) }
        if ($m -and $m.Success) {
            $date = ($m.Value -replace '\s*=\s*\{', '')
            $j = $i + $m.Length; $d = 1
            while ($j -lt $hist.Length -and $d -gt 0) { if ($hist[$j] -eq '{') { $d++ } elseif ($hist[$j] -eq '}') { $d-- }; $j++ }
            $inner = $hist.Substring($i + $m.Length, $j - $i - $m.Length)
            if ($inner -match '(?m)^\s*owner\s*=\s*(\w+)') { $changes += ($date + ':' + $Matches[1]) }
            $i = $j; continue
        }
        $c = $hist[$i]
        if ($c -eq '{') { $depth++ } elseif ($c -eq '}') { $depth-- }
        [void]$baseSb.Append($c); $i++
    }
    $base = $baseSb.ToString()
    if ($base -match '(?m)^\s*owner\s*=\s*(\w+)') { $owner = $Matches[1] }
    $cores = @([regex]::Matches($base, 'add_core_of\s*=\s*(\w+)') | ForEach-Object { $_.Groups[1].Value })
    $vps = @([regex]::Matches($base, 'victory_points\s*=\s*\{\s*(\d+)\s+(\d+)\s*\}') | ForEach-Object { $_.Groups[1].Value + '=' + $_.Groups[2].Value })
    [pscustomobject]@{
        state_id        = [int]$id
        loc_key         = $nameKey
        name            = $locName[$id]
        owner_base      = $owner
        owner_changes   = ($changes -join ' ')
        cores           = ($cores -join ' ')
        victory_points  = ($vps -join ' ')
        strategic_region= $region
        province_count  = $provs.Count
        file            = $f.Name
    }
}

New-Item -ItemType Directory docs -Force | Out-Null
$rows | Sort-Object state_id | Export-Csv docs/generated_state_index.csv -NoTypeInformation -Encoding utf8
"Indexed $(@($rows).Count) states -> docs/generated_state_index.csv"

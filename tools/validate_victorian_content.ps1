# Lightweight static checks for the Victorian 1854-1900 content. Usage (repo root):
#   pwsh tools/validate_victorian_content.ps1
#
# CHECKS (all regex based):
#   1. unbalanced braces in project files (files named v54_* and the 1854 bookmark)
#   2. duplicate scripted effect / scripted trigger IDs (whole repository)
#   3. duplicate event IDs and focus IDs (whole repository)
#   4. v54_ scripted effects/triggers referenced but not defined
#   5. missing localisation keys: bookmark keys, and name/desc/title/text keys used by project files
#   6. event ids referenced by v54 files that do not exist
#   7. focus prerequisite / mutually_exclusive ids that do not exist (project focus files)
#
# LIMITATIONS: this is NOT the HOI4 parser. It cannot know scopes, valid effect/trigger names, GFX
# availability or runtime errors. Strings inside comments are ignored but multi-line constructs and
# macros ($VAR$) are only roughly handled. Always confirm with the game's error.log (docs/TESTING.md).

$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$errors = New-Object System.Collections.Generic.List[string]
$warns  = New-Object System.Collections.Generic.List[string]
function Err($m)  { $script:errors.Add($m) }
function Warn($m) { $script:warns.Add($m) }

function Strip-Comments([string]$text) {
    # remove # comments that are not inside double quotes
    $sb = New-Object Text.StringBuilder
    foreach ($line in ($text -split "`r?`n")) {
        $inq = $false; $cut = $line.Length
        for ($i = 0; $i -lt $line.Length; $i++) {
            $c = $line[$i]
            if ($c -eq '"') { $inq = -not $inq }
            elseif ($c -eq '#' -and -not $inq) { $cut = $i; break }
        }
        [void]$sb.AppendLine($line.Substring(0, $cut))
    }
    $sb.ToString()
}

$projectFiles = @(Get-ChildItem -Recurse -File -Include 'v54_*.txt' common, events, localisation, history -ErrorAction SilentlyContinue) +
                @(Get-Item common/bookmarks/1854-1-1.txt -ErrorAction SilentlyContinue)
$projectFiles = @($projectFiles | Where-Object { $_ })

# 1. braces
foreach ($f in $projectFiles) {
    $t = Strip-Comments ([IO.File]::ReadAllText($f.FullName))
    $t = [regex]::Replace($t, '"[^"]*"', '""')
    $o = ([regex]::Matches($t, '\{')).Count; $c = ([regex]::Matches($t, '\}')).Count
    if ($o -ne $c) { Err "BRACES   $($f.Name): $o '{' vs $c '}'" }
}

# 2. duplicate scripted effect / trigger ids (top-level keys)
foreach ($dir in 'common/scripted_effects', 'common/scripted_triggers') {
    $seen = [System.Collections.Hashtable]::new()
    foreach ($f in Get-ChildItem $dir -File -Filter *.txt) {
        $t = Strip-Comments ([IO.File]::ReadAllText($f.FullName))
        $depth = 0
        foreach ($line in ($t -split "`r?`n")) {
            if ($depth -eq 0 -and $line -match '^\s*([A-Za-z_][\w\.]*)\s*=\s*\{') {
                $id = $Matches[1]
                if ($seen.ContainsKey($id)) { Err "DUP-ID   $($dir.Split('/')[1]) '$id' in $($f.Name) and $($seen[$id])" } else { $seen[$id] = $f.Name }
            }
            $depth += ([regex]::Matches($line, '\{')).Count - ([regex]::Matches($line, '\}')).Count
        }
    }
    if ($dir -match 'effects') { $script:definedEffects = $seen } else { $script:definedTriggers = $seen }
}

# 3. duplicate event ids / focus ids
$eventIds = [System.Collections.Hashtable]::new()
$evOpen = [regex]'^\s*(country_event|news_event|state_event|unit_leader_event|operative_leader_event)\s*=\s*\{'
foreach ($f in Get-ChildItem events -Recurse -File -Filter *.txt) {
    $t = Strip-Comments ([IO.File]::ReadAllText($f.FullName))
    $depth = 0; $inEvent = $false; $evDepth = 0
    foreach ($line in ($t -split "`r?`n")) {
        if ($depth -eq 0 -and $evOpen.IsMatch($line)) { $inEvent = $true }
        if ($inEvent -and $depth -eq 1 -and $line -match '^\s*id\s*=\s*([\w\.]+)') {
            $id = $Matches[1]
            if ($eventIds.ContainsKey($id)) { Err "DUP-ID   event '$id' in $($f.Name) and $($eventIds[$id])" } else { $eventIds[$id] = $f.Name }
            $inEvent = $false
        }
        $depth += ([regex]::Matches($line, '\{')).Count - ([regex]::Matches($line, '\}')).Count
        if ($depth -eq 0) { $inEvent = $false }
    }
}$focusIds = [System.Collections.Hashtable]::new()
foreach ($f in Get-ChildItem common/national_focus -File -Filter *.txt) {
    $t = Strip-Comments ([IO.File]::ReadAllText($f.FullName))
    foreach ($m in [regex]::Matches($t, '(?m)^\s{1,2}focus\s*=\s*\{\s*(?:\r?\n\s*)?id\s*=\s*([\w\.]+)')) {
        $id = $m.Groups[1].Value
        if ($focusIds.ContainsKey($id)) { Err "DUP-ID   focus '$id' in $($f.Name) and $($focusIds[$id])" } else { $focusIds[$id] = $f.Name }
    }
}

# 4. referenced v54_ scripted effects/triggers that are not defined
$localKeys = [System.Collections.Hashtable]::new()
foreach ($f in Get-ChildItem localisation/english -File -Filter *.yml) {
    foreach ($l in [IO.File]::ReadLines($f.FullName)) { if ($l -match '^\s*([A-Za-z0-9_\.\-]+):\d*\s') { $localKeys[$Matches[1]] = $true } }
}
foreach ($f in $projectFiles | Where-Object { $_.Extension -eq '.txt' }) {
    $t = Strip-Comments ([IO.File]::ReadAllText($f.FullName))
    foreach ($m in [regex]::Matches($t, '\b(v54_\w+)\s*=\s*yes')) {
        $id = $m.Groups[1].Value
        if (-not $definedEffects.ContainsKey($id) -and -not $definedTriggers.ContainsKey($id)) { Err "MISSING  $($f.Name): '$id = yes' is not a defined scripted effect/trigger" }
    }
    # 5. localisation keys used by project files
    foreach ($m in [regex]::Matches($t, '\b(?:name|desc|title|text|history|custom_effect_tooltip|tooltip|custom_trigger_tooltip)\s*=\s*"?([A-Z][A-Z0-9_]{5,})"?')) {
        $k = $m.Groups[1].Value
        if ($k.StartsWith('V54_') -and -not $localKeys.ContainsKey($k)) { Err "LOC      $($f.Name): missing localisation key '$k'" }
    }
    # 6. event references
    foreach ($m in [regex]::Matches($t, '\b(?:country_event|news_event)\s*=\s*(?:\{[^}]*\bid\s*=\s*)?(v54_\w+\.\d+)')) {
        if (-not $eventIds.ContainsKey($m.Groups[1].Value)) { Err "MISSING  $($f.Name): event '$($m.Groups[1].Value)' not found" }
    }
    # 7. focus prerequisites inside project focus files
    if ($f.FullName -match 'national_focus') {
        foreach ($m in [regex]::Matches($t, '(?:prerequisite|mutually_exclusive)\s*=\s*\{[^}]*?focus\s*=\s*([\w\.]+)')) {
            if (-not $focusIds.ContainsKey($m.Groups[1].Value)) { Err "MISSING  $($f.Name): focus reference '$($m.Groups[1].Value)'" }
        }
    }
}

# bookmark keys and references (always checked)
$bm = 'common/bookmarks/1854-1-1.txt'
if (Test-Path $bm) {
    $bt = [IO.File]::ReadAllText($bm)
    foreach ($m in [regex]::Matches($bt, '(?:name|desc|history)\s*=\s*"(V54_\w+)"')) {
        if (-not $localKeys.ContainsKey($m.Groups[1].Value)) { Err "LOC      bookmark 1854: missing key '$($m.Groups[1].Value)'" }
    }
    $ideas = [System.Collections.Hashtable]::new()
    foreach ($f in Get-ChildItem common/ideas -Recurse -File -Filter *.txt) {
        foreach ($m in [regex]::Matches([IO.File]::ReadAllText($f.FullName), '(?m)^\s*([A-Za-z0-9_]+)\s*=\s*\{')) { $ideas[$m.Groups[1].Value] = $true }
    }
    $ownBlocks = foreach ($tag in 'AUS','PRS','FRA','ENG','RUS','PIE','OTO','DEN') { $m0 = [regex]::Match($bt, '(?s)"' + $tag + '"\s*=\s*\{.*?\n\t\t\}'); if ($m0.Success) { $m0.Value } }
foreach ($blk in $ownBlocks) { foreach ($b in [regex]::Matches($blk, '(?s)ideas\s*=\s*\{([^}]*)\}')) {
        foreach ($i in ($b.Groups[1].Value -split '\s+' | Where-Object { $_ -and -not $_.StartsWith('#') })) { if (-not $ideas.ContainsKey($i)) { Warn "bookmark 1854 uses idea '$i' not found in common/ideas (check manually)" } }
    } }
    foreach ($blk in $ownBlocks) { foreach ($b in [regex]::Matches($blk, '(?s)focuses\s*=\s*\{([^}]*)\}')) {
        foreach ($i in ($b.Groups[1].Value -split '\s+' | Where-Object { $_ -and -not $_.StartsWith('#') })) { if (-not $focusIds.ContainsKey($i)) { Warn "bookmark 1854 uses focus '$i' not found in common/national_focus (check manually)" } }
    } }
}

"Project files checked : $(@($projectFiles).Count)"
"Scripted effects/triggers known: $($definedEffects.Count) / $($definedTriggers.Count);  events: $($eventIds.Count);  focuses: $($focusIds.Count)"
foreach ($w in $warns)  { "WARN  $w" }
foreach ($e in $errors) { "ERROR $e" }
"Result: $($errors.Count) error(s), $($warns.Count) warning(s)"
if ($errors.Count -gt 0) { exit 1 }

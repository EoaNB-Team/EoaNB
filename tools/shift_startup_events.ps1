# Re-times the events that EoaNB schedules relative to its 1857.5.11 start so that they fire on the same
# absolute dates when the game starts on 1854.1.1 (offset = days between the two dates).
#
# Only event calls are touched:  country_event / news_event / state_event = { ... days = N ... }
# Other uses of "days" (truces, timed ideas, missions) are durations and stay unchanged.
# Scope: the block guarded by "has_start_date < 1858.1.1" (the 1857 start) in the listed on_actions files,
# the cochinchina line that precedes it, and scheduled events in country history files.
# The tool refuses to run twice on a file (marker comment).
# Usage (repo root):  pwsh tools/shift_startup_events.ps1   [-DryRun]
param([switch]$DryRun)
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$Offset = ([datetime]'1857-05-11' - [datetime]'1854-01-01').Days   # 1226
$Marker = "# [v54] event delays in this file were shifted by +$Offset days (1857.5.11 start -> 1854.1.1 start)"
$callRe = [regex]'(?s)((?:country_event|news_event|state_event)\s*=\s*\{[^{}]*?\bdays\s*=\s*)(\d+)'

function Read-Raw($p) {
    $b = [IO.File]::ReadAllBytes($p); $bom = ($b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF)
    $t = [Text.Encoding]::UTF8.GetString($b); if ($bom) { $t = $t.Substring(1) }
    @{ Text = $t; Bom = $bom }
}
function Shift-Text([string]$text, [ref]$count) {
    $n = 0
    $r = $callRe.Replace($text, { param($m) $script:n++; $m.Groups[1].Value + ([int]$m.Groups[2].Value + $Offset) })
    $count.Value = $script:n; $script:n = 0
    $r
}
# index of the matching closing brace for the opening brace at $open
function Match-Brace([string]$t, [int]$open) { $d = 0; for ($i = $open; $i -lt $t.Length; $i++) { if ($t[$i] -eq '{') { $d++ } elseif ($t[$i] -eq '}') { $d--; if ($d -eq 0) { return $i } } }; -1 }

$script:n = 0
$report = New-Object System.Collections.Generic.List[string]

# --- on_actions: shift inside the 1857 guard block (and, for _on_startup_events, the preceding cochinchina line)
foreach ($spec in @(
    @{ File = 'common/on_actions/_on_startup_events.txt'; Guard = 'has_start_date < 1858.1.1'; Extra = $true },
    @{ File = 'common/on_actions/mantle_of_the_states_actions.txt'; Guard = 'has_start_date < 1858.1.1'; Extra = $false },
    @{ File = 'common/on_actions/south_america_on_actions.txt'; Guard = 'has_start_date < 1858.1.1'; Extra = $false })) {
    $f = Read-Raw $spec.File; $t = $f.Text
    if ($t.Contains($Marker)) { $report.Add("skip (already shifted): $($spec.File)"); continue }
    $g = $t.IndexOf($spec.Guard); if ($g -lt 0) { throw "guard not found in $($spec.File)" }
    $ifOpen = $t.IndexOf('{', $t.LastIndexOf('if', $g))
    $ifClose = Match-Brace $t $ifOpen
    $block = $t.Substring($ifOpen, $ifClose - $ifOpen + 1)
    $c = 0; $block2 = Shift-Text $block ([ref]$c)
    $t2 = $t.Substring(0, $ifOpen) + $block2 + $t.Substring($ifClose + 1)
    if ($spec.Extra) {
        $m = [regex]::Match($t2, '(?m)^.*cochinchina_expedition\.1 days = 390.*$')
        if ($m.Success) { $line2 = $callRe.Replace($m.Value, { param($x) $x.Groups[1].Value + ([int]$x.Groups[2].Value + $Offset) }); $t2 = $t2.Substring(0, $m.Index) + $line2 + $t2.Substring($m.Index + $m.Length); $c++ }
    }
    $report.Add(("{0}: {1} scheduled events shifted" -f $spec.File, $c))
    if (-not $DryRun) { [IO.File]::WriteAllText($spec.File, $Marker + "`n" + $t2, (New-Object Text.UTF8Encoding($f.Bom))) }
}

# --- country history files: scheduled events anywhere in the 1854.1.1 block
foreach ($p in Get-ChildItem history/countries -File -Filter *.txt) {
    $f = Read-Raw $p.FullName; $t = $f.Text
    if ($t.Contains($Marker)) { continue }
    $c = 0
    $head = $t; $tail = ''
    # only the 1854.1.1 block (before any later dated block) is a start-date block
    $later = [regex]::Matches($t, '(?m)^(﻿)?\s*(\d{4}\.\d+\.\d+)\s*=\s*\{') | Where-Object { $_.Groups[2].Value -ne '1854.1.1' } | Select-Object -First 1
    if ($later) { $head = $t.Substring(0, $later.Index); $tail = $t.Substring($later.Index) }
    $head2 = Shift-Text $head ([ref]$c)
    if ($c -gt 0) {
        $report.Add(("{0}: {1} scheduled events shifted" -f $p.Name, $c))
        if (-not $DryRun) { [IO.File]::WriteAllText($p.FullName, $Marker + "`n" + $head2 + $tail, (New-Object Text.UTF8Encoding($f.Bom))); }
    }
}
$report
if ($DryRun) { "(dry run, nothing written)" }

# Inserts extra trigger lines into the `available` block of an existing (upstream) focus; creates the block if missing.
# Handles focuses at any indentation (the id line's indentation defines the property level).
# Usage: . tools/lib_patch_focus.ps1 ; Add-FocusAvailable -Path file -FocusId ID -Lines "date > 1857.2.1" -Note "reason"
function Add-FocusAvailable {
    param([string]$Path, [string]$FocusId, [string]$Lines, [string]$Note)
    $bytes = [IO.File]::ReadAllBytes($Path)
    $bom = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
    $t = [Text.Encoding]::UTF8.GetString($bytes); if ($bom) { $t = $t.Substring(1) }
    $nl = if ($t.Contains("`r`n")) { "`r`n" } else { "`n" }
    $m = [regex]::Match($t, '(?m)^(\t+)id\s*=\s*' + [regex]::Escape($FocusId) + '\s*\r?$')
    if (-not $m.Success) { throw "focus not found: $FocusId" }
    $ind = $m.Groups[1].Value
    $focusInd = $ind.Substring(0, $ind.Length - 1)
    $next = [regex]::Match($t.Substring($m.Index + $m.Length), '(?m)^' + [regex]::Escape($focusInd) + '(shared_)?focus\s*=\s*\{')
    $endIdx = if ($next.Success) { $m.Index + $m.Length + $next.Index } else { $t.Length }
    $seg = $t.Substring($m.Index, $endIdx - $m.Index)
    if ($seg -match 'v54\] ' + [regex]::Escape($Note)) { return "already patched: $FocusId" }
    $lineBlock = (($Lines -split "`r?`n") | ForEach-Object { "$ind`t$_" }) -join $nl
    $a = [regex]::Match($seg, '(?m)^' + [regex]::Escape($ind) + 'available\s*=\s*\{')
    if ($a.Success) {
        $ins = $a.Index + $a.Length
        $seg2 = $seg.Substring(0, $ins) + $nl + "$ind`t# [v54] $Note" + $nl + $lineBlock + $seg.Substring($ins)
    } else {
        $ai = [regex]::Match($seg, '(?m)^' + [regex]::Escape($ind) + 'ai_will_do')
        if (-not $ai.Success) { $ai = [regex]::Match($seg, '(?m)^' + [regex]::Escape($ind) + 'prerequisite') }
        if (-not $ai.Success) { throw "no anchor in $FocusId" }
        $blk = "$ind# [v54] $Note" + $nl + "${ind}available = {" + $nl + $lineBlock + $nl + "$ind}" + $nl
        $seg2 = $seg.Substring(0, $ai.Index) + $blk + $seg.Substring($ai.Index)
    }
    $t2 = $t.Substring(0, $m.Index) + $seg2 + $t.Substring($endIdx)
    [IO.File]::WriteAllText($Path, $t2, (New-Object Text.UTF8Encoding($bom)))
    "patched: $FocusId"
}
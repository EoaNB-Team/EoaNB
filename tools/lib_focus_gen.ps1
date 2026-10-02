# Shared helpers to generate shared_focus blocks and their English localisation.
# Dot-source it from a country script:  . "$PSScriptRoot/lib_focus_gen.ps1"
# Output goes to common/national_focus/v54_<country>_1854_shared.txt and localisation/english/v54_<country>_focus_l_english.yml.

$script:Focuses = New-Object System.Collections.Generic.List[object]

function Reset-Focuses { $script:Focuses = New-Object System.Collections.Generic.List[object] }

# -Pre: array; each element is one prerequisite block; use "A|B" for an OR inside the block.
# -Mutex: array of focus ids. -Available/-Reward: raw script (tabs are added automatically).
function New-Focus {
    param(
        [Parameter(Mandatory)][string]$Id,
        [Parameter(Mandatory)][string]$Icon,
        [Parameter(Mandatory)][int]$X,
        [Parameter(Mandatory)][int]$Y,
        [int]$Cost = 10,
        [string[]]$Filters = @('FOCUS_FILTER_POLITICAL'),
        [string[]]$Pre = @(),
        [string[]]$Mutex = @(),
        [string]$Available = '',
        [string]$Reward = '',
        [int]$Ai = 30,
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)][string]$Desc,
        [switch]$Hist
    )
    $script:Focuses.Add([pscustomobject]@{ Id=$Id; Icon=$Icon; X=$X; Y=$Y; Cost=$Cost; Filters=$Filters; Pre=$Pre; Mutex=$Mutex; Available=$Available; Reward=$Reward; Ai=$Ai; Name=$Name; Desc=$Desc; Hist=[bool]$Hist })
}

function Indent([string]$text, [int]$tabs) {
    if (-not $text) { return '' }
    $pad = "`t" * $tabs
    (($text -replace "`r`n", "`n").Trim("`n") -split "`n" | ForEach-Object { if ($_.Trim() -eq '') { '' } else { $pad + $_ } }) -join "`n"
}

function Render-Focuses([string]$header) {
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine($header)
    foreach ($f in $script:Focuses) {
        $filters = $f.Filters + $(if ($f.Hist -and ($f.Filters -notcontains 'FOCUS_FILTER_HISTORICAL')) { @('FOCUS_FILTER_HISTORICAL') } else { @() })
        [void]$sb.AppendLine("")
        [void]$sb.AppendLine("`tshared_focus = {")
        [void]$sb.AppendLine("`t`tid = $($f.Id)")
        [void]$sb.AppendLine("`t`ticon = $($f.Icon)")
        [void]$sb.AppendLine("`t`tx = $($f.X)")
        [void]$sb.AppendLine("`t`ty = $($f.Y)")
        [void]$sb.AppendLine("`t`tcost = $($f.Cost)")
        [void]$sb.AppendLine("`t`tsearch_filters = { $($filters -join ' ') }")
        if ($f.Available) {
            [void]$sb.AppendLine("`t`tavailable = {")
            [void]$sb.AppendLine((Indent $f.Available 3))
            [void]$sb.AppendLine("`t`t}")
        }
        foreach ($p in $f.Pre) {
            $alts = $p -split '\|'
            [void]$sb.AppendLine("`t`tprerequisite = { " + (($alts | ForEach-Object { "focus = $_" }) -join ' ') + " }")
        }
        if ($f.Mutex.Count -gt 0) { [void]$sb.AppendLine("`t`tmutually_exclusive = { " + (($f.Mutex | ForEach-Object { "focus = $_" }) -join ' ') + " }") }
        [void]$sb.AppendLine("`t`tai_will_do = { base = $($f.Ai) }")
        if ($f.Reward) {
            [void]$sb.AppendLine("`t`tcompletion_reward = {")
            [void]$sb.AppendLine((Indent $f.Reward 3))
            [void]$sb.AppendLine("`t`t}")
        }
        [void]$sb.AppendLine("`t}")
    }
    $sb.ToString()
}

function Render-FocusLoc([string]$section) {
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine(" ## $section")
    foreach ($f in $script:Focuses) {
        $d = $f.Desc
        if ($f.Hist) { $d = $d + '\n\n$V54_HISTORICAL_PATH$' }
        [void]$sb.AppendLine(" $($f.Id): `"$($f.Name)`"")
        [void]$sb.AppendLine(" $($f.Id)_desc: `"$($d -replace '"', '\"')`"")
    }
    $sb.ToString()
}

# Writes the shared focus file and returns the id list (for the tree include block).
function Write-FocusFiles([string]$country, [string]$header, [string]$locSection) {
    $txt = Render-Focuses $header
    [IO.File]::WriteAllText("common/national_focus/v54_${country}_1854_shared.txt", ($txt -replace "`r`n", "`n"), (New-Object Text.UTF8Encoding $false))
    $loc = "l_english:`n" + (Render-FocusLoc $locSection)
    $bytes = (New-Object Text.UTF8Encoding $true).GetPreamble() + [Text.Encoding]::UTF8.GetBytes($loc)
    [IO.File]::WriteAllBytes("localisation/english/v54_${country}_focus_l_english.yml", $bytes)
    ($script:Focuses | ForEach-Object { $_.Id })
}

# Idempotently inserts "shared_focus = ID" lines between markers in an upstream tree file, right after the "default = no" line.
function Patch-TreeInclude([string]$treePath, [string[]]$ids, [string]$marker) {
    $bytes = [IO.File]::ReadAllBytes($treePath)
    $bom = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
    $t = [Text.Encoding]::UTF8.GetString($bytes); if ($bom) { $t = $t.Substring(1) }
    $nl = if ($t.Contains("`r`n")) { "`r`n" } else { "`n" }
    $begin = "`t# [v54] BEGIN $marker"; $end = "`t# [v54] END $marker"
    $block = $begin + $nl + (($ids | ForEach-Object { "`tshared_focus = $_" }) -join $nl) + $nl + $end
    $bi = $t.IndexOf($begin)
    if ($bi -ge 0) {
        $ei = $t.IndexOf($end, $bi); if ($ei -lt 0) { throw "end marker missing in $treePath" }
        $t = $t.Substring(0, $bi) + $block + $t.Substring($ei + $end.Length)
    } else {
        $m = [regex]::Match($t, '(?m)^\s*default\s*=\s*(no|yes)\s*$')
        if (-not $m.Success) { throw "no 'default =' line in $treePath" }
        $pos = $m.Index + $m.Length
        $t = $t.Substring(0, $pos) + $nl + $block + $t.Substring($pos)
    }
    [IO.File]::WriteAllText($treePath, $t, (New-Object Text.UTF8Encoding($bom)))
}

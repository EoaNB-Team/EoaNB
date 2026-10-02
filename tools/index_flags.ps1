# Builds docs/generated_flag_index.csv: every v54_ flag/variable set or read in the project's own files.
# Columns: name, kind (country_flag|global_flag|variable), set_in, read_in.
# Usage (repo root):  pwsh tools/index_flags.ps1
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)

$files = Get-ChildItem -Recurse -File -Include *.txt common, events, history | Where-Object {
    $_.Name -like 'v54_*' -or $_.FullName -match 'national_focus\\(austrian_empire|prussia|france|britain_1857)_focus\.txt$' -or $_.FullName -match 'history\\countries\\'
}
$setRe = [regex]'(?<kind>set_country_flag|set_global_flag|clr_country_flag|clr_global_flag|modify_country_flag|set_variable|add_to_variable|subtract_from_variable)\s*=\s*\{?\s*(?:flag\s*=\s*|var\s*=\s*)?(?<name>v54_[A-Za-z0-9_]+)'
$readRe = [regex]'(?<kind>has_country_flag|has_global_flag|check_variable|has_variable)\s*=\s*\{?\s*(?:var\s*=\s*)?(?<name>v54_[A-Za-z0-9_]+)'
$idx = @{}
function Touch($name, $kind, $role, $file) {
    if (-not $idx.ContainsKey($name)) { $idx[$name] = @{ Kind = $kind; Set = New-Object System.Collections.Generic.HashSet[string]; Read = New-Object System.Collections.Generic.HashSet[string] } }
    [void]$idx[$name][$role].Add($file)
    if ($kind -ne '') { $idx[$name].Kind = $kind }
}
foreach ($f in $files) {
    $t = [IO.File]::ReadAllText($f.FullName)
    $short = $f.FullName.Substring((Get-Location).Path.Length + 1).Replace('\', '/')
    foreach ($m in $setRe.Matches($t)) {
        $k = switch -Regex ($m.Groups['kind'].Value) { 'global' { 'global_flag' } 'variable' { 'variable' } default { 'country_flag' } }
        Touch $m.Groups['name'].Value $k 'Set' $short
    }
    foreach ($m in $readRe.Matches($t)) {
        $k = switch -Regex ($m.Groups['kind'].Value) { 'global' { 'global_flag' } 'variable' { 'variable' } default { 'country_flag' } }
        Touch $m.Groups['name'].Value $k 'Read' $short
    }
}
$rows = $idx.Keys | Sort-Object | ForEach-Object {
    [pscustomobject]@{ name = $_; kind = $idx[$_].Kind; set_in = (($idx[$_].Set | Sort-Object) -join ' | '); read_in = (($idx[$_].Read | Sort-Object) -join ' | ') }
}
$rows | Export-Csv -Path docs/generated_flag_index.csv -NoTypeInformation -Encoding UTF8
$orphanRead = $rows | Where-Object { $_.read_in -and -not $_.set_in }
"{0} names indexed; {1} never set in the project's own files" -f $rows.Count, @($orphanRead).Count
$orphanRead | ForEach-Object { "  read-only: " + $_.name + "  <- " + $_.read_in }

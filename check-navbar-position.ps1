$css = Get-Content 'd:\workspace\hoccos\mossano atelier\assets\css\style.css' -Raw
$rules = $css -split '(?<=})'
foreach ($r in $rules) {
    if ($r -match 'kmb-horizontal-menu-navbar-collapse.*top:|top:.*var\(--header-overlap-height|top:.*var\(--header-height|position:fixed|bottom:0') {
        Write-Output $r.Trim()
        Write-Output "---"
    }
}

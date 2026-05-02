$css = Get-Content 'd:\workspace\hoccos\mossano atelier\assets\css\style.css' -Raw
$rules = $css -split '(?<=})'
foreach ($r in $rules) {
    if ($r -match 'kmb-horizontal-menu-navbar-collapse[^}]*}') {
        Write-Output $r.Trim()
        Write-Output "---"
    }
}

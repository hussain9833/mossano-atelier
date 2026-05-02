$css = Get-Content 'd:\workspace\hoccos\mossano atelier\assets\css\style.css' -Raw
$rules = $css -split '(?<=})'
foreach ($r in $rules) {
    if ($r -match 'kmb-navbar-toggles|kmb-horizontal-menu-navbar-collapse|@media.*max-width.*767|@media.*max-width.*991') {
        Write-Output $r.Trim()
        Write-Output "---"
    }
}

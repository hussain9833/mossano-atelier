$css = Get-Content 'd:\workspace\hoccos\mossano atelier\assets\css\style.css' -Raw
$css = $css -replace '}', "}`n"
$lines = $css -split "`n"
foreach ($line in $lines) {
    if ($line -match 'kmb-sub-menu|kmb-menu-item-has-children|kmb-menu-item-more|kmb-menu-item-open-sub-menu') {
        Write-Output $line.Trim()
        Write-Output '---'
    }
}

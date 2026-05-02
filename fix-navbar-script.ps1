$files = Get-ChildItem 'd:\workspace\hoccos\mossano atelier\*.html'
$script = '<script>(function(){var btn=document.querySelector(".kmb-navbar-toggles");var header=document.querySelector(".kmb-site-header");if(btn&&header){btn.addEventListener("click",function(){header.classList.toggle("kmb-visible-menu");});header.querySelectorAll(".kmb-menu-item-link").forEach(function(link){link.addEventListener("click",function(){header.classList.remove("kmb-visible-menu");});});}})();</script>'

foreach ($file in $files) {
    if ($file.Name -eq 'index.html') { continue }
    $content = Get-Content $file.FullName -Raw
    if ($content -match 'kmb-visible-menu') {
        Write-Output "Skipped (already has script): $($file.Name)"
        continue
    }
    $content = $content -replace '</body>\s*</html>', ($script + '</body></html>')
    Set-Content $file.FullName $content -NoNewline
    Write-Output "Updated: $($file.Name)"
}

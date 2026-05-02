$script = @"
<script>
(function(){
    var btn=document.querySelector('.kmb-navbar-toggles');
    var header=document.querySelector('.kmb-site-header');
    if(btn&&header){
        btn.addEventListener('click',function(){
            header.classList.toggle('kmb-visible-menu');
        });
        header.querySelectorAll('.kmb-menu-item-link').forEach(function(link){
            link.addEventListener('click',function(){
                header.classList.remove('kmb-visible-menu');
            });
        });
    }
})();
</script>
"@

Get-ChildItem 'd:\workspace\hoccos\mossano atelier\*.html' | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    if ($_.Name -ne 'index.html' -and $content -notmatch 'kmb-visible-menu') {
        $content = $content -replace '</body>', $script + '</body>'
        Set-Content $_.FullName $content -NoNewline
        Write-Output "Updated: $($_.Name)"
    } else {
        Write-Output "Skipped: $($_.Name)"
    }
}

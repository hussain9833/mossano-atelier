$script = @'
<script>
(function(){
    var moreItems = document.querySelectorAll('.kmb-menu-item-has-children .kmb-menu-item-more, .kmb-menu-item-has-children .kmb-menu-item-sub-menu-arrow');
    moreItems.forEach(function(item){
        item.addEventListener('click', function(e){
            e.preventDefault();
            e.stopPropagation();
            var parentLi = this.closest('.kmb-menu-item-has-children');
            if(parentLi){
                parentLi.classList.toggle('kmb-menu-item-open-sub-menu');
            }
        });
    });
    document.addEventListener('click', function(e){
        document.querySelectorAll('.kmb-menu-item-open-sub-menu').forEach(function(item){
            if(!item.contains(e.target)){
                item.classList.remove('kmb-menu-item-open-sub-menu');
            }
        });
    });
})();
</script>
'@

Get-ChildItem 'd:\workspace\hoccos\mossano atelier\*.html' | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    if ($content -match 'kmb-menu-item-open-sub-menu') {
        Write-Output "Skipped (already has dropdown script): $($_.Name)"
        continue
    }
    $content = $content -replace '</body>', $script + '</body>'
    Set-Content $_.FullName $content -NoNewline
    Write-Output "Updated: $($_.Name)"
}

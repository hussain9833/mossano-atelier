$navbarScript = '<script>(function(){var btn=document.querySelector(".kmb-navbar-toggles");var header=document.querySelector(".kmb-site-header");if(btn&&header){btn.addEventListener("click",function(){header.classList.toggle("kmb-visible-menu");});header.querySelectorAll(".kmb-menu-item-link").forEach(function(link){link.addEventListener("click",function(){header.classList.remove("kmb-visible-menu");});});}})();</script>'

$dropdownScript = '<script>(function(){var moreItems=document.querySelectorAll(".kmb-menu-item-has-children .kmb-menu-item-more,.kmb-menu-item-has-children .kmb-menu-item-sub-menu-arrow");moreItems.forEach(function(item){item.addEventListener("click",function(e){e.preventDefault();e.stopPropagation();var parentLi=this.closest(".kmb-menu-item-has-children");if(parentLi){parentLi.classList.toggle("kmb-menu-item-open-sub-menu");}});});document.addEventListener("click",function(e){document.querySelectorAll(".kmb-menu-item-open-sub-menu").forEach(function(item){if(!item.contains(e.target)){item.classList.remove("kmb-menu-item-open-sub-menu");}});});})();</script>'

Get-ChildItem 'd:\workspace\hoccos\mossano atelier\*.html' | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    
    # Add navbar toggle script if missing
    if ($content -notmatch 'kmb-visible-menu') {
        $content = $content -replace '</body>', $navbarScript + '</body>'
    }
    
    # Add dropdown script if missing
    if ($content -notmatch 'kmb-menu-item-open-sub-menu') {
        $content = $content -replace '</body>', $dropdownScript + '</body>'
    }
    
    Set-Content $_.FullName $content -NoNewline
    Write-Output "Updated: $($_.Name)"
}

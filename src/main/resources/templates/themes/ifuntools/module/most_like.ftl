<#--文章页 聚合文章-->
<div id="recommended_posts-7" class="widget Recommended_Posts">
    <div class="widget-title">聚合文章</div>
    <div class="list-grid list-grid-padding my-n2">
        <@postTag method="mostLike" top="5">
            <#list posts as item>
                <div class="list-item py-2">
                    <div class="media media-3x2 col-5 mr-3">
                        <a href="${item.fullPath!}" target="_blank" title="${item.title}" class="media-content" style="background-image: url('${(item.thumbnail == '') ?string(settings.default_posts_img,item.thumbnail)}');" data-bg="url('${(item.thumbnail == '') ?string(settings.default_posts_img,item.thumbnail)}')" data-nclazyload="true" data-was-processed="true"></a>
                    </div>
                    <div class="list-content p-0">
                        <div class="list-body">
                            <a href="${item.fullPath!}" title="${item.title}" target="_blank" class="list-title text-sm h-2x">${item.title}</a></div>
                        <div class="list-footer text-muted text-xs m-0">
                            <div>${item.createTime?string("yyyy-MM-dd")}</div></div>
                    </div>
                </div>
            </#list>
        </@postTag>
    </div>
</div>
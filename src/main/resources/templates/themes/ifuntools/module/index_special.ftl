<#--首页专题-->
<div class="list-pushes list-scroll-4x mb-3 mb-md-4 mb-xl-4">
    <div class="row row-sm my-md-n2">
        <@specialTag method="list">
            <#list specials as special>
                <div class="col-4 col-md-2 py-md-2 ">
                    <div class="list-item list-overlay block custom-hover">
                        <div class="media media-3x2">
                            <a class="media-content" style="background-image: url('${(special.thumbnail == '') ?string(settings.default_posts_img,special.thumbnail)}');" data-bg=" url('${(special.thumbnail == '') ?string(settings.default_posts_img,special.thumbnail)}')" data-nclazyload="true" data-was-processed="true">
                                <div class="overlay-1"></div>
                            </a>
                        </div>
                        <a href="${context!}/specials/${special.slug!}" class="list-content p-1 p-md-2" target="_blank">
                            <div class="list-body align-items-center justify-content-center">
                                <div class="list-title h-1x text-sm">${special.name}</div></div>
                        </a>
                    </div>
                </div>
            </#list>
        </@specialTag>
    </div>
</div>
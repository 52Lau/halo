<div class="list-index-md py-3 py-md-4 py-xl-5 bg-light">
    <div class="container">
        <div class="list-index-header mb-2 mb-md-3">
            <@categoryTag method="info" categorySlug="mac">
                <div class="h4"><a href="https://www.iplayapple.com/special/macos-games" target="_blank"><span class="px-3">${categoryInfo.name}</span></a></div>
                <div class="text-sm text-muted mt-1 mt-md-0">${categoryInfo.description}</div>
            </@categoryTag>
        </div>
        <div class="row row-sm list-grouped list-bordered-padding my-n2">
            <@postTag method="listByCategorySlug" categorySlug="mac" dataCollectionAlias="macCategoryPosts" top="8">
                <#list macCategoryPosts as item>
                    <div class="col-6 col-md-3 d-flex py-2">
                        <div class="list-item block overlay-hover custom-hover">
                            <div class="media media-16x9">
                                <a class="media-content" href="${item.fullPath!}" target="_blank" title="${item.title}" style="background-image: url('${(item.thumbnail == '') ?string(settings.default_posts_img,item.thumbnail)}');" data-bg=" url('${(item.thumbnail == '') ?string(settings.default_posts_img,item.thumbnail)})" data-nclazyload="true" data-was-processed="true"><div class="overlay"></div></a>
                            </div>
                            <div class="list-content">
                                <div class="list-body ">
                                    <a href="https://www.iplayapple.com/deep-sky-derelicts-mac.html" target="_blank" class="list-title text-md h-2x">${item.title}</a>
                                </div>
                                <div class="list-footer d-flex align-items-center text-muted mt-1 mt-md-2">
                                    <div class="text-xs">${item.createTime?string("yyyy-MM-dd")}</div>
                                    <div class="flex-fill"></div>
                                    <div class="text-nowrap text-xs">
                                        <span class="d-inline-block d-md-inline-block  mr-1 mr-md-2">
                                            <i class="text-md iconfont icon-view"></i>
                                            <span class="d-inline-block align-middle">${item.visits}</span>
                                        </span>
                                        <span class="d-none d-md-none  mr-1 mr-md-2">
                                            <i class="text-md iconfont icon-Chat"></i>
                                            <span class="d-inline-block align-middle">0</span>
                                        </span>
                                        <span class="d-none d-md-inline-block  mr-1 mr-md-2">
                                             <i class="text-md iconfont icon-like-line"></i>
                                            <span class="d-inline-block align-middle">${item.likes}</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </@postTag>


        </div>
    </div>
</div>
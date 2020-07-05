<#--一行四个文章风格-->
<#if posts??>
    <#list posts.content as post>
        <div class="col-6 col-md-3 d-flex py-2">
            <div class="list-item custom-hover">
                <div class="media media-16x9">
                    <a class="media-content" href="${post.fullPath!}" title="${post.title}" target="_blank"
                       style="background-image: url('${(post.thumbnail == '') ?string(settings.default_posts_img,post.thumbnail)}');"
                       data-bg=" url('${(post.thumbnail == '') ?string(settings.default_posts_img,post.thumbnail)}?imageView2/1/w/450/h/300/sharpen/1/interlace/1')"
                       data-nclazyload="true" data-was-processed="true">
                        <span class="overlay"></span>
                    </a>
                </div>
                <div class="list-content">
                    <div class="list-body">
                        <div class="d-none d-lg-block text-xs mb-1 list-cat-style list-cat-dot-circle ">
                            <#if post.categories?? && post.categories?size gt 0>
                                <i class="cat-dot " style="border-color: #179b92"></i>
                                <a href="${post.categories[0].fullPath}" class="text-muted"
                                   target="_blank">${post.categories[0].name}</a>
                            <#else>
                                <i class="cat-dot " style="border-color: #179b92"></i>
                                <a href="#" class="text-muted" target="_blank">未分类</a>
                            </#if>

                        </div>
                        <a href="${post.fullPath!}" title="${post.title}" class="list-title text-md h-2x"
                           target="_blank">${post.title}</a></div>
                    <div class="list-footer d-flex align-items-center text-muted mt-1 mt-lg-2">
                        <div class="text-xs">${post.createTime?string("yyyy-MM-dd")}</div>
                        <div class="flex-fill"></div>
                        <div class="text-xs text-nowrap">
                <span class="d-none d-md-inline-block   mr-1 mr-md-2">
                  <i class="text-md iconfont icon-view"></i>
                  <span class="d-inline-block align-middle">${post.visits!}</span></span>
                            <span class="d-none d-md-inline-block ">
                  <i class="text-md iconfont icon-like-line"></i>
                  <span class="d-inline-block align-middle">${post.likes!}</span></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#list>
</#if>

<#--单行文章风格-->
<#if posts??>
    <#list posts.content as post>
        <div class="list-item custom-hover py-3 py-lg-5">
            <div class="media media-16x9 col-5 col-md-4 col-lg-5">
                <a class="media-content" href="${post.fullPath!}" target="_blank"
                   title="c"
                   style="background-image: url('${(post.thumbnail == '') ?string(settings.default_posts_img,post.thumbnail)}');"
                   data-bg=" url('${(post.thumbnail == '') ?string(settings.default_posts_img,post.thumbnail)}?imageView2/1/w/450/h/300/sharpen/1/interlace/1')"
                   data-nclazyload="true" data-was-processed="true">
                    <span class="overlay"></span>
                </a>
            </div>
            <div class="list-content py-md-2 py-lg-3">
                <div class="list-body">
                    <a href="${post.fullPath!}" title="${post.title!}"
                       class="list-title h5 h-2x">${post.title!}</a>
                    <div class="list-subtitle text-secondary d-none d-lg-block mt-lg-3">
                        <span class="h-2x">${post.summary!} ...</span>
                    </div>
                </div>
                <div class="list-footer d-flex align-items-center text-sm text-muted m-0">
                    <div>${post.createTime?string("yyyy-MM-dd")}</div>
                    <div>&nbsp;</div>
                    <#-- 文章标签开始-->
                    <#--<div>
                        <#if post.tags?? && post.tags?size gt 0>
                            <#list post.tags?sort_by('id') as tag>
                                #<a href="${tag.fullPath!}" rel="tag" target="_self">${tag.name}</a>#
                            </#list>
                        </#if>
                    </div>-->
                    <#-- 文章标签结束-->
                    <div class="flex-fill"></div>
                    <div class="text-nowrap ">
                      <span class="d-none d-md-inline-block   mr-1 mr-md-3">
                        <i class="text-lg iconfont icon-view"></i>
                        <span class="d-inline-block align-middle">${post.visits!}</span></span>
                        <span class="d-none d-md-inline-block  mr-1 mr-md-3">
                        <i class="text-lg iconfont icon-Chat"></i>
                        <span class="d-inline-block align-middle">${post.commentCount!}</span></span>
                        <span class="d-none d-md-inline-block ">
                        <i class="text-lg iconfont icon-like-line"></i>
                        <span class="d-inline-block align-middle">${post.likes!}</span></span>
                    </div>
                </div>
            </div>
        </div>
    </#list>
</#if>
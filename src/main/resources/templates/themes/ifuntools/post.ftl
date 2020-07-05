<#include "module/macro_1.ftl">

<@head title=""/>
<#--<#include "module/page_top.ftl">-->

<main class="py-3 py-md-4 py-lg-5" style="transform: none;">
    <div class="container dtop" style="transform: none;">
        <div class="d-none d-md-block breadcrumbs mb-2 mb-md-3">
            <span itemprop="itemListElement">
            <a href="${blog_url!}" itemprop="item" class="home">
              <span itemprop="name" class="text-muted">首页</span>
            </a>
          </span>
                <span class="sep text-muted">›</span>
                <span itemprop="itemListElement">
                    <#if categories?? && categories?size gt 0>
                        <#list categories as cate>
                            <#--<span itemprop="name" class="text-muted">${cate.name!''}</span>-->
                            <a href="${cate.fullPath}" itemprop="item">
                                <span itemprop="name" class="text-muted">${cate.name!''}</span>
                            </a>
                        </#list>
                    <#else>
                        <a href="" itemprop="item">
                                <span itemprop="name" class="text-muted">默认分类</span>
                        </a>
                    </#if>
                </span>
            <span class="sep text-muted">›</span>
            <span class="current">${post.title}</span>
        </div>
        <div class="row" style="transform: none;">
            <div class="col-12 col-lg-9">
                <div class="post">
                    <h1 class="post-title h3">${post.title}</h1>
                    <div class="post-meta d-flex align-items-center flex-row text-muted mt-3 mt-md-3 mb-3 mb-lg-4">
                        <div class="d-flex flex-fill align-items-center">
                            <div class="author-popup  flex-avatar w-40">
                                <img alt="ifuntools" src="https://img.ifuntools.cn/wp-content/uploads/2019/08/ifuntools-logo-40x40.png" class="avatar avatar-40 photo loaded" height="40" width="40" data-src="https://img.ifuntools.cn/wp-content/uploads/2019/08/ifuntools-logo-40x40.png" data-nclazyload="true" data-was-processed="true"></div>
                            <div class="author-name d-flex flex-wrap flex-column mx-2 mx-md-3">
                                <div class="text-md">
                                    <a href="javascript:" class="author-popup" target="_blank">ifuntools</a></div>
                                <div class="text-xs text-muted">
                                    <time class="date mr-1">${post.createTime?string("yyyy-MM-dd")}</time>
                                    <#if categories?? && categories?size gt 0>
                                        <i class="d-none d-md-inline-block">发布在</i>
                                        <#list categories as cate>
                                            <a class="text-secondary" href="#" rel="category tag" target="_blank">${cate.name!''}</a>
                                        </#list>
                                    </#if>
                                    <#-- <a class="post-edit-link" href="https://www.ifuntools.com/wp-admin/post.php?post=2749&amp;action=edit" target="_blank">[编辑]</a>-->
                                </div>
                            </div>
                        </div>
                        <div class="post-data d-none d-md-flex text-nowrap text-md ">
                          <span class="mx-1 mx-md-2">
                            <i class="text-lg iconfont icon-view"></i>
                            <small class="text-font">${post.visits}</small></span>
                                        <span class="mx-1 mx-md-2">
                            <a class="current btn-action-like" href="javascript:;" data-action="unlike" data-id="2749" target="_blank">
                              <i class="text-lg iconfont icon-like-line"></i>
                              <small class="like-count text-font">${post.likes}</small></a>
                          </span>
                        </div>
                    </div>
                    <div class="border-top py-2 py-md-2"></div>
                    <div class="post-content" data-spy="scroll" data-target="#list-example" data-offset="0">
                        ${post.formatContent!}
                    </div>
                    <#-- 文章标签开始-->
                    <div class="post-tags mt-3 mt-md-4 mx-n1">
                        <#if tags?? && tags?size gt 0>
                            <#list tags?sort_by('id') as tag>
                                <span class="d-inline-block p-1">
                                    <span class="btn btn-light btn-sm">#
                                        <a href="${tag.fullPath!}" rel="tag" target="_self">${tag.name}</a>#
                                    </span>
                                </span>
                            </#list>
                        </#if>
                    </div>
                    <#-- 文章标签结束-->
                    <#-- 文章分享（微博 微信 QQ） 开始-->
                    <div id="post-action" class="post-action mt-3 mt-lg-5">
                        <div class="hr-short"></div>
                        <div class="d-flex flex-fill align-items-center">
                            <#--文章like数量 开始-->
                            <div class="d-none d-md-block">
                                <a href="javascript:" data-action="unlike" data-id="2749" class="d-inline-block btn-action-like current mr-2 mr-md-3 mr-lg-4" target="_blank">
                                    <i class="text-xl iconfont icon-like"></i>
                                    <span class="like-count text-font align-middle">${post.likes}</span>
                                </a>
                            </div>
                            <#--文章like数量 结束-->
                            <div class="flex-md-fill"></div>
                            <div id="scrollshare" class="post-social">
                                <a href="//service.weibo.com/share/share.php?url=https%3A%2F%2Fwww.ifuntools.com%2Fphotoscape-x-pro-402-zh%2F&amp;type=button&amp;language=zh_cn&amp;title=%E3%80%90PhotoScape+X+Pro+4.0.2+%26%238211%3B+%E7%85%A7%E7%89%87%E4%BF%AE%E5%A4%8D%E5%92%8C%E5%A2%9E%E5%BC%BA%E7%9A%84%E7%AE%80%E6%98%93%E7%BC%96%E8%BE%91%E5%99%A8%E3%80%91PhotoScape%C2%A0X%E6%98%AFMac%E4%B8%8B%E4%B8%80%E6%AC%BE%E7%AE%80%E6%98%93%E7%9A%84%E7%85%A7%E7%89%87%E4%BF%AE%E5%A4%8D%E5%92%8C%E5%A2%9E%E5%BC%BA%E5%B7%A5%E5%85%B7%E5%AE%83%E5%85%B7%E6%9C%89%E5%BE%88%E5%A4%9A%E5%9F%BA%E6%9C%AC%E5%8A%9F%E8%83%BD%EF%BC%9A%E7%85%A7%E7%89%87%E7%BC%96%E8%BE%91%E5%99%A8%EF%BC%8C%E6%89%B9%E5%A4%84%E7%90%86%E7%BC%96%E8%BE%91%E5%99%A8%EF%BC%8C%E7%85%A7%E7%89%87%E6%9F%A5%E7%9C%8B%E5%99%A8%EF%BC%8C%E5%89%AA%E5%88%87%EF%BC%8C%E6%8B%BC%E8%B4%B4%E5%88%B6%E4%BD%9C%EF%BC%8C%E5%8A%A8%E7%94%BBGIF%E5%88%9B%E5%BB%BA%E5%99%A8%EF%BC%8C%E7%BB%84%E5%90%88%EF%BC%8C%E6%89%93%E5%8D%B0%EF%BC%8C%E5%B1%8F%E5%B9%95%E6%8D%95%E8%8E%B7%EF%BC%8C%E6%8B%BE%E8%89%B2%E5%99%A8%EF%BC%8CRAW%E5%9B%BE%E5%83%8F%E7%AD%89%E3%80%82%0A...&amp;searchPic=true" target="_blank" class="btn btn-light btn-icon btn-weibo btn-rounded btn-md m-1">
                                  <span>
                                    <i class="iconfont icon-weibo"></i>
                                  </span>
                                </a>
                                <a href="javascript:" class="btn btn-light btn-icon btn-weixin single-popup btn-rounded btn-md m-1" data-img="https://www.ifuntools.com/wp-content/themes/Cosy3.2.1/modules/qrcode.php?data=https%3A%2F%2Fwww.ifuntools.com%2Fphotoscape-x-pro-402-zh%2F" data-title="微信扫一扫 分享朋友圈" data-desc="在微信内长按二维码" target="_blank">
                                  <span>
                                    <i class="iconfont icon-weixin1"></i>
                                  </span>
                                </a>
                                <a href="https://connect.qq.com/widget/shareqq/index.html?url=https%3A%2F%2Fwww.ifuntools.com%2Fphotoscape-x-pro-402-zh%2F&amp;title=PhotoScape+X+Pro+4.0.2+%26%238211%3B+%E7%85%A7%E7%89%87%E4%BF%AE%E5%A4%8D%E5%92%8C%E5%A2%9E%E5%BC%BA%E7%9A%84%E7%AE%80%E6%98%93%E7%BC%96%E8%BE%91%E5%99%A8&amp;summary=PhotoScape%C2%A0X%E6%98%AFMac%E4%B8%8B%E4%B8%80%E6%AC%BE%E7%AE%80%E6%98%93%E7%9A%84%E7%85%A7%E7%89%87%E4%BF%AE%E5%A4%8D%E5%92%8C%E5%A2%9E%E5%BC%BA%E5%B7%A5%E5%85%B7%E5%AE%83%E5%85%B7%E6%9C%89%E5%BE%88%E5%A4%9A%E5%9F%BA%E6%9C%AC%E5%8A%9F%E8%83%BD%EF%BC%9A%E7%85%A7%E7%89%87%E7%BC%96%E8%BE%91%E5%99%A8%EF%BC%8C%E6%89%B9%E5%A4%84%E7%90%86%E7%BC%96%E8%BE%91%E5%99%A8%EF%BC%8C%E7%85%A7%E7%89%87%E6%9F%A5%E7%9C%8B%E5%99%A8%EF%BC%8C%E5%89%AA%E5%88%87%EF%BC%8C%E6%8B%BC%E8%B4%B4%E5%88%B6%E4%BD%9C%EF%BC%8C%E5%8A%A8%E7%94%BBGIF%E5%88%9B%E5%BB%BA%E5%99%A8%EF%BC%8C%E7%BB%84%E5%90%88%EF%BC%8C%E6%89%93%E5%8D%B0%EF%BC%8C%E5%B1%8F%E5%B9%95%E6%8D%95%E8%8E%B7%EF%BC%8C%E6%8B%BE%E8%89%B2%E5%99%A8%EF%BC%8CRAW%E5%9B%BE%E5%83%8F%E7%AD%89%E3%80%82%0A..." target="_blank" class="btn btn-light btn-icon btn-qq btn-rounded btn-md m-1">
                                  <span>
                                    <i class="iconfont icon-qq"></i>
                                  </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <#-- 文章分享（微博 微信 QQ） 结束-->
                    <#-- 文章 上一篇下一篇 开始-->
                    <div class="post-next-prev list-grouped row-sm my-n1 pt-5">
                        <#if prevPost??>
                            <div class="col-12 col-md-6 py-1">
                                <div class="list-item list-overlay block custom-hover overlay-hover">
                                    <div class="media media-3x1">
                                        <div class="media-content" style="background-image:url('${(prevPost.thumbnail == '') ?string(settings.default_posts_img,prevPost.thumbnail)}')" data-bg="url('${(prevPost.thumbnail == '') ?string(settings.default_posts_img,prevPost.thumbnail)}')" data-nclazyload="true">
                                            <div class="overlay-1"></div>
                                        </div>
                                    </div>
                                    <a href="${prevPost.fullPath!}" class="list-content p-3" title="${prevPost.title!}" target="_blank">
                                        <div class="list-body ">
                                            <div class="list-title">
                                                <div class="h-2x h6 text-white">${prevPost.title!}</div></div>
                                        </div>
                                        <div class="list-footer">
                                            <div class="d-flex align-items-center flex-fill">
                                                <div class="text-xs text-muted">上一篇</div>
                                                <div class="flex-fill"></div>
                                                <i class="text-md iconfont icon-xianghou"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </#if>
                        <#if nextPost??>
                            <div class="col-12 col-md-6 py-1">
                                <div class="list-item list-overlay block custom-hover overlay-hover">
                                    <div class="media media-3x1">
                                        <div class="media-content" style="background-image:url('${(nextPost.thumbnail == '') ?string(settings.default_posts_img,nextPost.thumbnail)}')" data-bg=" url('${(nextPost.thumbnail == '') ?string(settings.default_posts_img,nextPost.thumbnail)}')" data-nclazyload="true">
                                            <div class="overlay-1"></div>
                                        </div>
                                    </div>
                                    <a href="${nextPost.fullPath!}" class="list-content p-3" title="${nextPost.title!}" target="_blank">
                                        <div class="list-body ">
                                            <div class="list-title">
                                                <div class="h-2x h6 text-white">${nextPost.title}</div></div>
                                        </div>
                                        <div class="list-footer">
                                            <div class="d-flex align-items-center flex-fill">
                                                <div class="text-xs text-muted">下一篇</div>
                                                <div class="flex-fill"></div>
                                                <i class="text-md iconfont icon-xianghou"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </#if>
                    </div>
                    <#-- 文章 上一篇下一篇 结束-->
                </div>
            </div>
            <#--侧边 开始-->
            <div class="sidebar col-lg-3 d-none d-lg-block" style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">
                <!-- #secondary -->
                <div class="theiaStickySidebar" style="padding-top: 0px; padding-bottom: 1px; position: static; transform: none;">
                    <aside id="secondary" class="widget-area pt-5 pt-lg-0">
                        <#--热门文章开始-->
                        <#include "module/most_visit.ftl">
                        <#--热门文章结束-->
                        <#--聚合文章开始-->
                        <#include "module/most_like.ftl">
                        <#--聚合文章结束-->
                    </aside>
                    <#--好像是用于重置网页大小 滚动的时候 cosy主题的内容-->
                    <div class="resize-sensor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; z-index: -1; visibility: hidden;">
                        <div class="resize-sensor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
                            <div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 295px; height: 1986px;"></div>
                        </div>
                        <div class="resize-sensor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
                            <div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
                        </div>
                    </div>
                </div>
            </div>
            <#--侧边 结束-->
        </div>
    </div>
</main>
<#--引入文章页 右边的浮动图标-->
<#--<#include "module/post_right.ftl">-->
<@footer></@footer>

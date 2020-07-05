<#--首页轮播 风格3-->
<div class="list-banner-style03 banner-has-nav banner-has-dots pt-3 pt-md-4 pt-lg-5">
    <div class="container dtop">
        <div class="row row-md">
            <div class="col-md-12 col-lg-8">
                <div class="owl-carousel owl-theme owl-loaded owl-drag">
                    <div class="owl-stage-outer">
                        <div class="owl-stage"
                             style="transform: translate3d(-2968px, 0px, 0px); transition: all 0s ease 0s; width: 5936px;">
                            <#--首页轮播最左侧 开始-->
                            <@postTag method="indexCarousel" top="5">
                                <#list indexCarousel as item>
                                    <div class="owl-item cloned" style="width: 732px; margin-right: 10px;">
                                        <div class="item block m-0">
                                            <div class="media media-16x9 ">
                                                <a class="media-content"
                                                   href="${item.fullPath!}" target="_blank"
                                                   style="background-image: url(${(item.thumbnail == '') ?string(settings.default_posts_img,item.thumbnail)});"
                                                   data-bg="url('${(item.thumbnail == '') ?string(settings.default_posts_img,item.thumbnail)}')"
                                                   data-nclazyload="true" data-was-processed="true">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </#list>
                            </@postTag>
                            <#--首页轮播最左侧 结束-->
                        </div>
                    </div>
                    <#--轮播切换按钮 开始-->
                    <div class="owl-nav">
                        <button type="button" role="presentation" class="owl-prev"><i
                                    class="iconfont icon-xiangqian"></i></button>
                        <button type="button" role="presentation" class="owl-next"><i
                                    class="iconfont icon-xianghou"></i></button>
                    </div>
                    <#--轮播切换按钮 结束-->
                    <#--轮播状态小圆点 开始-->
                    <div class="owl-dots">
                        <@postTag method="indexCarousel" top="5">
                            <#list indexCarousel as item>
                                <button role="button" class="owl-dot"></button>
                            </#list>
                        </@postTag>
                    </div>
                    <#--轮播状态小圆点 开始-->
                </div>
            </div>
            <#--首页轮播最右侧 开始-->
            <div class="col-md-12 col-lg-4 d-none d-lg-flex">
                <div class="list-item list-overlay block flex-fill overlay-hover overlay-hover custom-hover">
                    <div class="media d-flex flex-fill">
                        <a href="${settings.index_right_carousel_url!}" target="_blank" class="media-content"
                           style="background-image: url(${settings.index_right_carousel_images!});"
                           data-bg=" url('${settings.index_right_carousel_images!}')"
                           data-nclazyload="true" data-was-processed="true">
                        </a>
                    </div>
                </div>
            </div>
            <#--首页轮播最右侧 结束-->
        </div>
    </div>
</div>
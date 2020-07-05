<#--首页轮播-->
<div class="list-magazine bg-light ">
    <div class="container">
        <div class="row row-sm">
            <#--首页最大的一个展示 开始-->
            <div class="col-12 col-md-6 d-flex">
                <div class="list-item list-nice-overlay block flex-fill custom-hover">
                    <div class="media d-flex flex-fill">
                        <a href="https://www.ifuntools.com/quiver-327-geichengxuyu/" class="media-content" style="background-image: url(&quot;https://www.ifuntools.com/wp-content/uploads/2019/08/1561460526903-e1566028925455.png?imageView2/1/w/450/h/450/sharpen/1/interlace/1&quot;);" data-bg=" url('https://www.ifuntools.com/wp-content/uploads/2019/08/1561460526903-e1566028925455.png?imageView2/1/w/450/h/450/sharpen/1/interlace/1')" data-nclazyload="true" data-was-processed="true">
                            <div class="overlay-grad"></div>
                        </a>
                    </div>
                    <div class="list-content">
                        <div class="list-body">
                            <a href="https://www.ifuntools.com/quiver-327-geichengxuyu/" class="list-title text-lg h-2x" target="_blank">Quiver 3.2.7 – 给程序员准备的笔记本</a></div>
                    </div>
                </div>
            </div>
            <#--首页最大的一个展示 结束-->
            <#--侧边四个开始-->
            <div class="col-12 col-md-6 mt-2 mt-md-0">
                <div class="list-scroll-2x">
                    <div class="row row-sm row-scroll my-n1 my-md-n2">
                        <#--首页展示四个 开始-->
                        <@postTag method="indexTop" top="4">
                            <#list indexPosts as item>
                                <div class="col-6 py-1 py-md-2">
                                    <div class="list-item list-nice-overlay block custom-hover">
                                        <div class="media">
                                            <a href="${item.fullPath!}" class="media-content" style="background-image: url(${(item.thumbnail == '') ?string(settings.default_posts_img,item.thumbnail)});" data-bg=" url('${(item.thumbnail == '') ?string(settings.default_posts_img,item.thumbnail)}')" data-nclazyload="true" data-was-processed="true"></a>
                                        </div>
                                        <div class="list-content">
                                            <div class="list-body">
                                                <div class="mt-auto">
                                                    <a href="${item.fullPath!}" class="list-title text-md h-2x ">${item.title}</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </@postTag>
                        <#--首页展示四个 结束-->
                    </div>
                </div>
            </div>
            <#--侧边四个开始-->
        </div>
    </div>
</div>
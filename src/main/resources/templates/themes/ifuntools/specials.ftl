<#--该模板渲染专题列表页面，用于展示用户在后台添加的所有专题目录。-->
<main class="py-3 py-md-4 py-xl-5"><div class="container">
        <div class="row row-sm my-n2">
            <#--卡片开始-->
            <@specialTag method="list">
                <#list posts as post>
                    <a href="${context}/archives/${post.url!}">${post.title!}</a>
                    <div class="col-6 col-md-3 py-2">
                        <div class="list-item list-overlay block flex-fill overlay-hover custom-hover">
                            <div class="media">
                                <div class="media-content" style="background-image: url('${(post.thumbnail == '') ?string(settings.default_posts_img,post.thumbnail)}');" data-bg=" url('${(post.thumbnail == '') ?string(settings.default_posts_img,post.thumbnail)}')" data-nclazyload="true" data-was-processed="true">
                                    <span class="overlay-1"></span>
                                </div>
                                <div class="media-overlay media-opacity">
                                    <div class="m-auto">
                                        <div class="text-64 text-font">3</div>
                                    </div>
                                </div>
                            </div>
                            <a class="list-content p-2 p-md-3" href="${context}/archives/${post.url!}" title="${post.title!}">
                                <div class="list-body ">
                                    <div class="text-center m-auto">
                                        <div class="h5">${post.title!}</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </#list>
            </@specialTag>
            <#--卡片结束-->
        </div>
    </div>
</main>
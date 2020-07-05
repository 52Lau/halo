<#--分类页面的文章 如果想和首页的文章显示风格一样可以直接引用那边的-->
<main class="py-3 py-md-4 py-xl-5">
    <div class="container">
        <#if posts.content?? && posts.content?size gt 0>
            <div class="row justify-content-md-center my-md-5">
                <div class="col-lg-10">
                    <div class="list-archive list-grid list-grid-padding list-bordered list-bordered-padding my-n3 my-lg-n5">
                        <#--单个文章开始-->
                        <#include "singleline_post.ftl">
                        <#--单个文章结束-->
                    </div>
                    <#--引入分页 开始-->
                    <#include "pagination/category_pagination.ftl">
                    <#--引入分页 结束-->
                </div>
            </div>
        <#else>
            <#include "no_content.ftl">
        </#if>
    </div>
</main>
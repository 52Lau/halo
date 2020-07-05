<#--专题页面-->
<#include "module/macro_1.ftl">


<@head title="分类：${special.name} - ${blog_title!}"/>

<#--分类背景 说明开始-->
<div class="list-default-poster bg-dark ">
    <div class="bg-effect bg-dark bg-color" style="background: linear-gradient(-10deg, rgb(29, 28, 45) 0%, rgb(92, 103, 130) 100%, rgb(135, 97, 116) 100%);"></div>
    <div class="bg-effect bg-poster" data-img="" style="background-image: url('${(special.thumbnail == '') ?string(settings.default_posts_img,special.thumbnail)}');">
        <div class="overlay-1"></div>
    </div>
    <div class="d-flex flex-fill h-v-25 text-white">
        <div class="position-relative w-100 py-5 py-md-5 my-auto">
            <div class="container">
                <div class="h1 text-white text-center">${special.name}</div></div>
        </div>
    </div>
</div>
<#--分类背景 说明 结束-->
<#--分类文章开始-->
<#--<#include "module/category_post.ftl">-->
<main class="py-3 py-md-4 py-xl-5"><div class="container">
        <div class="row row-sm list-archive list-grouped list-bordered-padding">
            <#--引入一行四个文章的风格 开始-->
            <#include "module/post_entry.ftl">
            <#--引入一行四个文章的风格 结束-->
        </div>
        <#--分页开始-->
        <#include "module/pagination/special_pagination.ftl">
        <#--分页结束-->
    </div>
</main>
<#--分类文章结束-->
<@footer></@footer>

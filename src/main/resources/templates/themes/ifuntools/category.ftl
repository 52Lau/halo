<#--分类页面-->
<#include "module/macro_1.ftl">


<@head title="分类：${category.name} - ${blog_title!}"/>

<#--分类背景 说明开始-->
<div class="list-default-poster bg-dark ">
    <div class="bg-effect bg-dark bg-color" style="background: linear-gradient(-10deg, rgb(29, 28, 45) 0%, rgb(92, 103, 130) 100%, rgb(135, 97, 116) 100%);"></div>
    <div class="bg-effect bg-poster" data-img="" style="background-image: url('${(category.thumbnail == '') ?string(settings.default_posts_img,category.thumbnail)}');"><div class="overlay-1"></div></div>
    <div class="d-flex flex-fill h-v-25 text-white">
        <div class="position-relative w-100 py-5 py-md-5 my-auto">
            <div class="container dtop">
                <div class="h1 text-white text-center">${category.name!}</div>
            </div>
        </div>
    </div>
</div>
<#--分类背景 说明 结束-->
<#--分类文章开始-->
<#include "module/category_post.ftl">
<#--分类文章结束-->
<@footer></@footer>

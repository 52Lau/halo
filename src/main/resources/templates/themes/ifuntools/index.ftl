<#--首页模版-->
<#include "module/macro_1.ftl">
<@head title="${blog_title!}"/>
<#--风格三的轮播-->
<#include "module/carousel_3.ftl">
<main class="py-3 py-md-4 py-xl-5">
    <div class="container">
        <#--首页轮播 开始-->
        <#--<#include "module/carousel.ftl">-->
        <#--首页轮播 结束-->
        <#--首页专题 开始-->
        <#include "module/index_special.ftl">
        <#--首页专题 结束-->
        <#--首页table切换 开始-->
        <div class="list-ajax-nav text-md-center mt-1 mt-md-0 mb-3 mb-md-4">
            <ul class="py-xl-1">
                <li class="item-ajax-nav d-inline-block active">
                    <a href="javascript:" class="d-block" data-cid="-2.1">&nbsp;</a></li>
                <li class="item-ajax-nav d-inline-block active">
                    <#--<a href="javascript:" class="d-block " data-cid="-1.0" id="yiyan">

                    </a>-->
                    <p id="yiyan" class="d-block ">
                        <#if settings.hitokoto!false>
                            获取中...
                        <#else >
                            人生可否变作漫长浪漫程序！
                        </#if>
                    </p>
                </li>
                <li class="item-ajax-nav d-inline-block active">
                    <a href="javascript:" class="d-block " data-cid="37">&nbsp;</a></li>
            </ul>
        </div>
        <#--首页table切换 结束-->
        <#--首页文章 开始-->
        <div class="row row-sm list-home list-grouped list-bordered-padding my-n2">
            <#--引入文章-->
            <#include "module/post_entry.ftl">
        </div>
        <#--首页文章 结束-->
        <#--分页开始-->
        <#include "module/pagination/index_pagination.ftl">
        <#--分页结束-->
    </div>
</main>
<#include "module/index_category.ftl">
<#--开启每日一言 开始-->
<#include "module/hitokoto.ftl">
<#--开启每日一言 结束-->
<@footer></@footer>

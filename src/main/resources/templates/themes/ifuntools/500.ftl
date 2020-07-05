
<#include "module/macro_1.ftl">
<@head title="50X - ${blog_title!}"/>
<div class="list-default-poster bg-dark ">
    <div class="bg-effect bg-dark bg-color" style="background: linear-gradient(-10deg, rgb(29, 28, 45) 0%, rgb(92, 103, 130) 100%, rgb(135, 97, 116) 100%);"></div>
    <div class="bg-effect bg-poster" data-img="" style="background-image: url('${settings.default_posts_img}');"><div class="overlay-1"></div></div>
    <div class="d-flex flex-fill h-v-25 text-white">
        <div class="position-relative w-100 py-5 py-md-5 my-auto">
            <div class="container dtop">
                <div class="h1 text-white text-center">
                    <p id="yiyan" class="d-block ">
                        <#if settings.hitokoto!false>
                            获取中...
                        <#else >
                            人生可否变作漫长浪漫程序！
                        </#if>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<main class="py-3 py-md-4 py-xl-5">
    <div class="container">
        <div class="content-error h-v-50">
            <div class="svg-404 mx-auto mb-4">
            </div>
            <h1 class="display-1 text-font">50X</h1>
            <h4 class="py-4">哎呀！ 我不知道发生了啥🤷‍♂️。</h4>
            <p class="text-muted">看起来是我大脑短路了…</p>
        </div>
    </div>
</main>
<#--开启每日一言 开始-->
<#include "module/hitokoto.ftl">
<#--开启每日一言 结束-->
<@footer></@footer>
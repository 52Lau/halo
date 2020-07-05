<#include "module/macro_1.ftl">

<@head title="友情链接 - ${blog_title!}"/>


<main class="py-3 py-md-4 py-lg-5 h-v-75" style="transform: none;"><div class="container" style="transform: none;">
        <div class="row" style="transform: none;">
            <div class="col-lg-12">
                <div class="post mb-4">
                    <h1 class="post-title h2 mb-3 mb-md-4">
                        邻居                        </h1>
                    <div class="post-content">
                        <div class="nc-light-gallery"></div>                        </div>
                </div>
                <div class="item-links mb-3 mb-md-4 mb-lg-5">
                    <div class="list-header h5 mb-3 mb-md-4"><span class="px-3">我的伙伴们</span></div>
                    <div class="links-body row row-sm my-n2">

                        <@linkTag method="list">
                            <#if links?? && links?size gt 0>
                                <#list links as link>
                                    <div class="col-md-6 col-lg-4 d-flex py-2 ">
                                        <div class="d-flex flex-fill align-items-center bg-light rounded p-3">

                                            <div class="flex-avatar w-56 bg-white">
                                                <img src="${link.logo}" alt="${link.description}" data-src="${link.logo}" data-nclazyload="true" class="loaded" data-was-processed="true">
                                            </div>

                                            <div class="flex-fill px-3">
                                                <div class="list-title">${link.name}</div>
                                                <div class="text-muted text-xs mt-1">
                                                    <div class="h-2x">
                                                        <#if link.description!=''>
                                                            – ${link.description}
                                                        </#if>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="${link.url}" target="_blank" class="text-muted px-2"><i class="iconfont icon-xianghou"></i></a>
                                        </div>
                                    </div>
                                </#list>
                            </#if>
                        </@linkTag>

                    </div>
                </div>
            </div>

        </div>
    </div>
</main>
<@footer></@footer>

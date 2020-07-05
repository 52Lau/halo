<#--搜索结果页文章 一行四个的风格-->
<main class="py-3 py-md-4 py-lg-5"><div class="container">
        <div class="list-header p-0 mb-3 mb-md-4">
            <div class="h4">
                搜索：<span>${keyword!}</span>
            </div>
        </div>
        <div class="search-list row row-md list-archive list-grouped list-bordered-padding">
            <#--引入一行四个文章的风格 开始-->
            <#include "post_entry.ftl">
            <#--引入一行四个文章的风格 结束-->
        </div>
        <#--分页开始-->
        <#include "pagination/search_pagination.ftl">
        <#--分页结束-->
    </div>
</main>
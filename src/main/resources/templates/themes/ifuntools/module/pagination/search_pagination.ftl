<#--分页组件-->
<#if posts.totalPages gt 0>
    <@paginationTag method="search" page="${posts.number}" total="${posts.totalPages}" display="3" keyword="${keyword!}">
        <nav class="navigation pagination" role="navigation" aria-label="Posts Navigation"><h2 class="screen-reader-text">Posts Navigation</h2>
            <div class="nav-links">
                <#if pagination.hasPrev>
                    <a class="page-numbers" href="${pagination.prevPageFullPath!}">上一页</a>
                </#if>
                <#--彩虹页码 -暂时不需要-->
                <#list pagination.rainbowPages as number>
                    <#if number.isCurrent>
                        <a class="page-numbers current" href="${number.fullPath!}">${number.page!}</a>
                    <#else>
                        <a class="page-numbers" href="${number.fullPath!}">${number.page!}</a>
                    </#if>
                </#list>
                <#if pagination.hasNext>
                    <a class="page-numbers" href="${pagination.nextPageFullPath!}">下一页</a>
                </#if>
            </div>
        </nav>
    </@paginationTag>
</#if>
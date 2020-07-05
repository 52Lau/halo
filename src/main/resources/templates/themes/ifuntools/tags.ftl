<#--该模板渲染标签列表（标签云）页面，用于展示用户在后台添加的所有标签。-->
<#include "module/macro_1.ftl">

<@head title="所有标签 - ${blog_title!}"/>
<@tagTag method="list">
    <#if tags?? && tags?size gt 0>
        目前共计 ${tags?size} 个标签
    <#else>
        暂无标签
    </#if>
</@tagTag>
<@tagTag method="list">
    <#if tags?? && tags?size gt 0>
        <#list tags as tag>
            <#if (tag.postCount gt 0 && tag.postCount lt 3) || tag.postCount == 0>
                <a href="${tag.fullPath!}" style="font-size: 12px; color: #ccc">${tag.name}</a>
            <#elseif tag.postCount gt 3 && tag.postCount lt 6>
                <a href="${tag.fullPath!}" style="font-size: 13.5px; color: #bcbcbc">${tag.name}</a>
            <#elseif tag.postCount gt 6 && tag.postCount lt 9>
                <a href="${tag.fullPath!}" style="font-size: 18px; color: #8e8e8e">${tag.name}</a>
            <#elseif tag.postCount gt 9 && tag.postCount lt 12>
                <a href="${tag.fullPath!}" style="font-size: 19.5px; color: #7e7e7e">${tag.name}</a>
            <#elseif tag.postCount gt 12 && tag.postCount lt 15>
                <a href="${tag.fullPath!}" style="font-size: 22.5px; color: #5f5f5f">${tag.name}</a>
            <#elseif tag.postCount gt 15 && tag.postCount lt 18>
                <a href="${tag.fullPath!}" style="font-size: 24px; color: #4f4f4f">${tag.name}</a>
            <#elseif tag.postCount gt 18 && tag.postCount lt 21>
                <a href="${tag.fullPath!}" style="font-size: 25.5px; color: #404040">${tag.name}</a>
            <#else>
                <a href="${tag.fullPath!}" style="font-size: 30px; color: #111">${tag.name}</a>
            </#if>
        </#list>
    </#if>
</@tagTag>
<#--首页导航栏-->
<header class="header">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <nav class="navbar navbar-expand-md  ">
        <div class="container">
            <!-- / brand 设置logo cosy可能会有两个版本嗯的logo 后期可以直接写死 -->
            <a href="${blog_url!}" rel="home" class="navbar-brand m-0 order-1">
                <#if blog_logo?? && blog_logo!=''>
                    <img class="logo" src="${blog_logo!}" alt="${blog_title!}" data-src="${blog_logo!}"
                         data-nclazyload="true">
                    <img class="logo-night loaded" src="${blog_logo!}" alt="${blog_title!}" data-src="${blog_logo!}"
                         data-nclazyload="true" data-was-processed="true">
                <#else>
                    ${blog_title!}
                </#if>
            </a>
            <!-- brand 右上角菜单-->
            <ul class="nav main-submenu align-items-center flex-row flex-shrink-0 order-2 order-md-3">
                <li class="nav-item">
                    <a href="javascript:" class="nice-tooltip-hide nav-link search-popup text-lg"
                       data-toggle="nicetooltip" data-placement="bottom" title="" data-original-title="搜索"><i
                                class="d-block iconfont icon-search"></i></a>
                </li>
                <#--<li class="nav-item d-none d-lg-inline-block">
                    <a data-toggle="nicetooltip" data-placement="bottom" title=""
                       href="https://www.ifuntools.com/recent/" class="nav-link text-lg" target="_blank"
                       data-original-title="最近浏览记录">
                        <i class="d-block iconfont icon-time"></i>
                    </a>
                </li>-->
                <#--<li class="nav-item d-none d-lg-inline-block">
                    <a href="javascript:" class="nice-tooltip-hide switch-dark-mode nav-link text-lg" data-toggle="nicetooltip" data-placement="bottom" title="" data-original-title="深色模式">
                        <i class="night iconfont icon-moon_circle"></i>
                        <i class="light text-warning iconfont icon-moon_circle_fill"></i>
                    </a>
                </li>-->
                <li class="nav-item d-lg-none">
                    <a href="javascript:" id="mobile-sidebar-trigger" class="nav-link text-lg">
                        <i class="d-block iconfont icon-menu"></i>
                    </a>
                </li>
                <#--<li class="nav-item d-none d-lg-inline-block">
                    <a href="https://www.ifuntools.com/front-end/" target="_blank" class="nav-link text-lg" data-toggle="nicetooltip" data-placement="bottom" title="" data-original-title="我要投稿">
                        <i class="d-block iconfont icon-bianji"></i>
                    </a>
                </li>-->
            </ul>
            <#--菜单开始-->
            <div class="collapse navbar-collapse show navbar-scroll order-3 order-md-2 mx-md-4">
                <ul class="navbar-nav main-menu d-none d-lg-flex mr-auto px-4">
                    <@menuTag method="list">
                        <#if menus?? && menus?size gt 0>
                            <#list menus?sort_by('priority') as menu>
                                <li id="menu-item-${menu.id}"
                                    class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-${menu.id}"
                                    aria-current="page">
                                    <a title="fa-android" href="${menu.url}" target="${menu.target!}">${menu.name}</a>
                                </li>
                            </#list>
                        </#if>
                    </@menuTag>
                </ul>
            </div>
            <#--菜单结束-->
        </div>
    </nav>
</header>
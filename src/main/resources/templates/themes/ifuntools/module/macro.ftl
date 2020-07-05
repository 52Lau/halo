<#--页头 页尾-->
<#macro head title>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <title>${title!}</title>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="renderer" content="webkit">
    <meta name="theme-color" content="${settings.google_color!'#fff'}">
    <meta name="author" content="${user.nickname!}" />
    <meta name="keywords" content="${meta_keywords!}"/>
    <meta name="description" content="${meta_description!}" />
    <@global.head />
    <#--   PHP主题 cosy-->
    <link rel="dns-prefetch" href="https://s.w.org/">
    <link rel="alternate" type="application/rss+xml" title="${blog_title!} » Feed" href="${rss_url!}">
    <link rel="alternate" type="application/rss+xml" title="${blog_title!} » RSS" href="${sitemap_xml_url!}">
    <#--<script type="text/javascript">
        window._wpemojiSettings = {"baseUrl":"https:\/\/twemoji.maxcdn.com\/2\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/12.0.0-1\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/www.ifuntools.com\/wp-includes\/js\/wp-emoji-release.min.js?ver=5.4"}};
        /*! This file is auto-generated */
        !function(e,a,t){var r,n,o,i,p=a.createElement("canvas"),s=p.getContext&&p.getContext("2d");function c(e,t){var a=String.fromCharCode;s.clearRect(0,0,p.width,p.height),s.fillText(a.apply(this,e),0,0);var r=p.toDataURL();return s.clearRect(0,0,p.width,p.height),s.fillText(a.apply(this,t),0,0),r===p.toDataURL()}function l(e){if(!s||!s.fillText)return!1;switch(s.textBaseline="top",s.font="600 32px Arial",e){case"flag":return!c([127987,65039,8205,9895,65039],[127987,65039,8203,9895,65039])&&(!c([55356,56826,55356,56819],[55356,56826,8203,55356,56819])&&!c([55356,57332,56128,56423,56128,56418,56128,56421,56128,56430,56128,56423,56128,56447],[55356,57332,8203,56128,56423,8203,56128,56418,8203,56128,56421,8203,56128,56430,8203,56128,56423,8203,56128,56447]));case"emoji":return!c([55357,56424,55356,57342,8205,55358,56605,8205,55357,56424,55356,57340],[55357,56424,55356,57342,8203,55358,56605,8203,55357,56424,55356,57340])}return!1}function d(e){var t=a.createElement("script");t.src=e,t.defer=t.type="text/javascript",a.getElementsByTagName("head")[0].appendChild(t)}for(i=Array("flag","emoji"),t.supports={everything:!0,everythingExceptFlag:!0},o=0;o<i.length;o++)t.supports[i[o]]=l(i[o]),t.supports.everything=t.supports.everything&&t.supports[i[o]],"flag"!==i[o]&&(t.supports.everythingExceptFlag=t.supports.everythingExceptFlag&&t.supports[i[o]]);t.supports.everythingExceptFlag=t.supports.everythingExceptFlag&&!t.supports.flag,t.DOMReady=!1,t.readyCallback=function(){t.DOMReady=!0},t.supports.everything||(n=function(){t.readyCallback()},a.addEventListener?(a.addEventListener("DOMContentLoaded",n,!1),e.addEventListener("load",n,!1)):(e.attachEvent("onload",n),a.attachEvent("onreadystatechange",function(){"complete"===a.readyState&&t.readyCallback()})),(r=t.source||{}).concatemoji?d(r.concatemoji):r.wpemoji&&r.twemoji&&(d(r.twemoji),d(r.wpemoji)))}(window,document,window._wpemojiSettings);
    </script>
    <script src="${theme_base!}/source/css/wp-emoji-release.min.js" type="text/javascript" defer=""></script>-->
    <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline !important;
            border: none !important;
            box-shadow: none !important;
            height: 1em !important;
            width: 1em !important;
            margin: 0 .07em !important;
            vertical-align: -0.1em !important;
            background: none !important;
            padding: 0 !important;
        }
    </style>
    <link rel="stylesheet" id="dashicons-css" href="${theme_base!}/source/css/dashicons.min.css" type="text/css" media="all">
    <link rel="stylesheet" id="admin-bar-css" href="${theme_base!}/source/css/admin-bar.min.css" type="text/css" media="all">
    <link rel="stylesheet" id="wp-block-library-css" href="${theme_base!}/source/css/style.min.css" type="text/css" media="all">
    <style id="md-style-inline-css" type="text/css">
        .gfm-task-list { border: 1px solid transparent; list-style-type: none; } .gfm-task-list input { margin-right: 10px !important; } code.kb-btn { display: inline-block; color: #666; font: bold 9pt arial; text-decoration: none; text-align: center; padding: 2px 5px; margin: 0 5px; background: #eff0f2; -moz-border-radius: 4px; border-radius: 4px; border-top: 1px solid #f5f5f5; -webkit-box-shadow: inset 0 0 20px #e8e8e8, 0 1px 0 #c3c3c3, 0 1px 0 #c9c9c9, 0 1px 2px #333; -moz-box-shadow: inset 0 0 20px #e8e8e8, 0 1px 0 #c3c3c3, 0 1px 0 #c9c9c9, 0 1px 2px #333; box-shadow: inset 0 0 20px #e8e8e8, 0 1px 0 #c3c3c3, 0 1px 0 #c9c9c9, 0 1px 2px #333; text-shadow: 0px 1px 0px #f5f5f5; } .copy-button { cursor: pointer; border: 0; font-size: 12px; text-transform: uppercase; font-weight: 500; padding: 3px 6px 3px 6px; background-color: rgba(255, 255, 255, 0.6); position: absolute; overflow: hidden; top: 5px; right: 5px; border-radius: 3px; } .copy-button:before { content: ""; display: inline-block; width: 16px; height: 16px; margin-right: 3px; background-size: contain; background-image: url("data:image/svg+xml,%3Csvg version=\'1.1\' xmlns=\'http://www.w3.org/2000/svg\' xmlns:xlink=\'http://www.w3.org/1999/xlink\' x=\'0px\' y=\'0px\' width=\'16px\' height=\'16px\' viewBox=\'888 888 16 16\' enable-background=\'new 888 888 16 16\' xml:space=\'preserve\'%3E %3Cpath fill=\'%23333333\' d=\'M903.143,891.429c0.238,0,0.44,0.083,0.607,0.25c0.167,0.167,0.25,0.369,0.25,0.607v10.857 c0,0.238-0.083,0.44-0.25,0.607s-0.369,0.25-0.607,0.25h-8.571c-0.238,0-0.44-0.083-0.607-0.25s-0.25-0.369-0.25-0.607v-2.571 h-4.857c-0.238,0-0.44-0.083-0.607-0.25s-0.25-0.369-0.25-0.607v-6c0-0.238,0.06-0.5,0.179-0.786s0.262-0.512,0.428-0.679 l3.643-3.643c0.167-0.167,0.393-0.309,0.679-0.428s0.547-0.179,0.786-0.179h3.714c0.238,0,0.44,0.083,0.607,0.25 c0.166,0.167,0.25,0.369,0.25,0.607v2.929c0.404-0.238,0.785-0.357,1.143-0.357H903.143z M898.286,893.331l-2.67,2.669h2.67V893.331 z M892.571,889.902l-2.669,2.669h2.669V889.902z M894.321,895.679l2.821-2.822v-3.714h-3.428v3.714c0,0.238-0.083,0.441-0.25,0.607 s-0.369,0.25-0.607,0.25h-3.714v5.714h4.571v-2.286c0-0.238,0.06-0.5,0.179-0.786C894.012,896.071,894.155,895.845,894.321,895.679z M902.857,902.857v-10.286h-3.429v3.714c0,0.238-0.083,0.441-0.25,0.607c-0.167,0.167-0.369,0.25-0.607,0.25h-3.714v5.715H902.857z\' /%3E %3C/svg%3E"); background-repeat: no-repeat; position: relative; top: 3px; } pre { position: relative; } pre:hover .copy-button { background-color: rgba(255, 255, 255, 0.9); }
    </style>
    <link rel="stylesheet" id="jimu-css-css" href="${theme_base!}/source/css/jimu.css" type="text/css" media="all">
    <link rel="stylesheet" id="nicetheme-iconfont-css" href="${theme_base!}/source/css/iconfont.css" type="text/css" media="all">
    <link rel="stylesheet" id="nicetheme-nicetheme-css" href="${theme_base!}/source/css/nicetheme.css" type="text/css" media="all">
    <link rel="stylesheet" id="nicetheme-style-css" href="${theme_base!}/source/css/style.css" type="text/css" media="all">
    <#--<script type="text/javascript">
        /* <![CDATA[ */
        var globals = {"ajax_url":"https:\/\/www.ifuntools.com\/wp-admin\/${(item.thumbnail == '') ?string(settings.default_posts_img,item.thumbnail)}","url_theme":"https:\/\/www.ifuntools.com\/wp-content\/themes\/Cosy3.2.1","site_url":"https:\/\/www.ifuntools.com","post_id":"0","comment_ip":"0","allow_switch_darkmode":"device","posts_per_page":"10"};
        var __cosy__ = {"load_more":"\u52a0\u8f7d\u66f4\u591a","reached_the_end":"\u6ca1\u6709\u66f4\u591a\u5185\u5bb9","thank_you":"\u8c22\u8c22\u70b9\u8d5e","success":"\u64cd\u4f5c\u6210\u529f","cancelled":"\u53d6\u6d88\u70b9\u8d5e"};
        var toc = {"tag":"0"};
        var frontend_contribute = {"markdown":"1","image_resize":"1","image_drop":"1","magic_url":"1","parse_video":"0"};
        /* ]]> */
    </script>-->
    <script type="text/javascript" src="${theme_base!}/source/css/jquery.js"></script><script type="text/javascript" src="${theme_base!}/source/css/jquery-migrate.min.js"></script><meta name="baidu-site-verification" content="uJCOTsnpj1">
    <style type="text/css" media="print">#wpadminbar { display:none; }</style>
    <style type="text/css" media="screen">
        html { margin-top: 32px !impomobile-sidebar-triggerrtant; }
        * html body { margin-top: 32px !important; }
        @media screen and ( max-width: 782px ) {
            html { margin-top: 46px !important; }
            * html body { margin-top: 46px !important; }
        }
    </style>
    <link rel="icon" href="https://www.ifuntools.com/wp-content/uploads/2019/04/cropped-ifuntools-32x32.png" sizes="32x32">
    <link rel="icon" href="https://www.ifuntools.com/wp-content/uploads/2019/04/cropped-ifuntools-192x192.png" sizes="192x192">
    <link rel="apple-touch-icon" href="https://www.ifuntools.com/wp-content/uploads/2019/04/cropped-ifuntools-180x180.png">
    <meta name="msapplication-TileImage" content="https://www.ifuntools.com/wp-content/uploads/2019/04/cropped-ifuntools-270x270.png">
    <#--php主题结束-->
</head>
<body class="home blog logged-in admin-bar wp-embed-responsive  nice-style-radius  nice-style-shadow  nice-style-border  nice-style-hover  nice-dark-mode customize-support">
</#macro>

<#macro footer>
<#--cosy主题的页脚 开始-->
<footer class="footer bg-dark">
    <div class="container">
        <div class="row py-3 py-lg-4">
            <#--网站自定义说明开始-->
            <div class="col-lg-6 pr-lg-5 py-3">
                <div class="footer-widget pr-lg-5">
                    <div class="footer-widget-header mb-2 mb-md-3">
                        <span>声明</span></div>
                    <div class="footer-widget-content">
                        <p>本站所有资源，均来自个人使用体验、网上收集整理、网友投稿，不提供下载，如有侵犯您的权益，请发送邮件ifuntools#163.com(#换成@)，我们在收到邮件的8小时内处理并给您回复！</p>
                    </div>
                    <div class="footer-widget-social mx-n2 mt-3"></div>
                </div>
            </div>
            <#--网站自定义说明结束-->
            <#--网站友情链接开始-->
            <div class="col-lg-3 py-3">
                <div class="footer-widget">
                    <div class="footer-widget-header mb-2 mb-md-3">
                        <span>友情链接</span></div>
                    <div class="footer-widget-content">
                        <div class="footer-widget-links">
                            <a href="${context!}/links" target="_blank">我的小伙伴们</a>
                        </div>
                    </div>
                </div>
            </div>
            <#--网站友情链接结束-->
            <#--网站菜单开始-->
            <div class="col-lg-3 py-3">
                <div class="footer-widget">
                    <div class="footer-widget-header mb-2 mb-md-3">
                        <span>目录</span></div>
                    <div class="footer-widget-content">
                        <div class="footer-widget-links">
                            <@menuTag method="list">
                                <#if menus?? && menus?size gt 0>
                                    <#list menus?sort_by('priority') as menu>
                                        <a title="fa-menu-${menu.id}" href="${menu.url}" target="${menu.target!}">${menu.name}</a>
                                    </#list>
                                </#if>
                            </@menuTag>
                    </div>
                </div>
            </div>
            <#--网站菜单结束-->
        </div>
    </div>
    <#--网站备案号开始-->
    <div class="footer-copyright text-xs border-top border-secondary py-3 py-md-4">
        <div class="container">Copyright © 2019-2020
            <a href="https://www.ifuntools.com" title="爱疯兔-优秀软件分享！" rel="home">爱疯兔-优秀软件分享！</a>. Designed by
            <a href="https://www.nicetheme.cn" title="nicetheme奈思主题-资深的原创WordPress主题开发团队" target="_blank">nicetheme</a>. 爱疯兔-优秀软件分享！网站版权归 @
            <a href="http://www.ifuntools.cn/">赤壁鲰生网络工作室</a>版权所有！
            <a href="http://www.beian.miit.gov.cn/" target="_blank" rel="nofollow noopener">鄂ICP备19024935号-2</a>· 托管于 腾讯云
            <br>
        </div>
    </div>
    <#--网站备案号结束-->
</footer>
<#--一些弹出显示的页面-->
<#include "popuppage.ftl">
<@global.statistics />
</body>
</html>
</#macro>

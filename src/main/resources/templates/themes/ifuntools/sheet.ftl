<#--用户自定义页面-->
<#include "module/macro_1.ftl">

<@head title="${sheet.title!} - ${blog_title!}"/>
<main class="py-3 py-md-4 py-lg-5 h-v-75" style="transform: none;"><div class="container" style="transform: none;">
        <div class="row" style="transform: none;">
            <div class="col-lg-9">
                <div class="post">
                    <h1 class="post-title h2 mb-3 mb-md-4">
                        ${sheet.title!}
                    </h1>
                    <div class="post-content">
                        ${sheet.formatContent!}
                    </div>
                </div>
            </div>
            <div class="sidebar col-lg-3 d-none d-lg-block" style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">
                <!-- #secondary -->
                <div class="theiaStickySidebar" style="padding-top: 0px; padding-bottom: 1px; position: relative; transform: none;"><aside id="secondary" class="widget-area pt-5 pt-lg-0"></aside><div class="resize-sensor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; z-index: -1; visibility: hidden;"><div class="resize-sensor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 265px; height: 11px;"></div></div><div class="resize-sensor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div></div></div></div></div>
        </div>
    </div>
</main>
<@footer></@footer>

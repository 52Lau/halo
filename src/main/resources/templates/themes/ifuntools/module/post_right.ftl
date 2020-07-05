<#--文章页 右边的浮动图标-->
<div class="nice-fixed-widget d-none d-md-block">
    <ul>
        <li>
            <a href="javascript:" data-action="like" data-id="953" class=" btn-action-like btn btn-secondary btn-icon btn-lg nice-tooltip-hide mb-1" data-toggle="nicetooltip" data-placement="left" title="" data-original-title="点个赞">
                <small class="text-font icon-status status-right bg-danger like-count">${post.likes}</small>
                <span>
                    <i class="iconfont icon-like"></i>
                </span>
            </a>
        </li>
        <li>
            <a href="javascript:" class="btn-scroll-comment btn btn-secondary btn-icon btn-lg nice-tooltip-hide mb-1" data-toggle="nicetooltip" data-placement="left" title="" data-original-title="发表评论">
                <small class="text-font icon-status status-right bg-danger">${post.commentCount}</small>
                <span>
                    <i class="iconfont icon-chat-alt"></i>
                </span>
            </a>
        </li>

        <li>
            <a id="back-to-top" href="javascript:" class="btn btn-secondary btn-icon btn-lg">
                <span class="icon-stack">
                    <i class="text-sm iconfont icon-caret-up"></i>
                    <small class="back-to-top-text">Top</small>
                </span>
            </a>
        </li>
    </ul>
</div>
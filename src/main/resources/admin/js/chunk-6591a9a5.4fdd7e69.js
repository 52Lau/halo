(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-6591a9a5"],{3164:function(e,t,a){"use strict";var s=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a-tree",{attrs:{checkable:"",treeData:e.specialTree,defaultExpandAll:!0,checkedKeys:e.specialIds},on:{check:e.onCheck}})},o=[],r=a("7e9e"),i={name:"SpecialTree",model:{prop:"specialIds",event:"check"},props:{specialIds:{type:Array,required:!1,default:function(){return[]}},specials:{type:Array,required:!1,default:function(){return[]}}},computed:{specialTree:function(){return r["a"].concreteTree(this.specials)}},methods:{onCheck:function(e,t){this.$log.debug("Chekced keys",e),this.$log.debug("e",t);var a=t.checkedNodes.filter((function(e){return e.data.props.isLeaf})).map((function(e){return e.key}));this.$log.debug("Effectively selected special ids",a),this.$emit("check",a)}}},n=i,c=a("2877"),l=Object(c["a"])(n,s,o,!1,null,null,null);t["a"]=l.exports},"7e9e":function(e,t,a){"use strict";a("7f7f"),a("ac6a");var s=a("9efd"),o="/api/admin/specials",r={};function i(e,t){t.forEach((function(t){e.key===t.parentId&&(e.children||(e.children=[]),e.children.push({key:t.id,title:t.name,isLeaf:!1}))})),e.children?e.children.forEach((function(e){return i(e,t)})):e.isLeaf=!0}r.listAll=function(){var e=arguments.length>0&&void 0!==arguments[0]&&arguments[0];return Object(s["a"])({url:"".concat(o),params:{more:e},method:"get"})},r.listTree=function(){return Object(s["a"])({url:"".concat(o,"/tree_view"),method:"get"})},r.create=function(e){return Object(s["a"])({url:o,data:e,method:"post"})},r.delete=function(e){return Object(s["a"])({url:"".concat(o,"/").concat(e),method:"delete"})},r.get=function(e){return Object(s["a"])({url:"".concat(o,"/").concat(e),method:"get"})},r.update=function(e,t){return Object(s["a"])({url:"".concat(o,"/").concat(e),data:t,method:"put"})},r.concreteTree=function(e){var t={key:0,title:"top",children:[]};return i(t,e),t.children},t["a"]=r},"86db":function(e,t,a){"use strict";var s=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a-drawer",{attrs:{title:"文章设置",width:e.isMobile()?"100%":"480",placement:"right",closable:"",destroyOnClose:"",visible:e.visible},on:{close:e.onClose}},[a("a-skeleton",{attrs:{active:"",loading:e.settingLoading,paragraph:{rows:24}}},[a("div",{staticClass:"post-setting-drawer-content"},[a("div",{style:{marginBottom:"16px"}},[a("h3",{staticClass:"post-setting-drawer-title"},[e._v("基本设置")]),a("div",{staticClass:"post-setting-drawer-item"},[a("a-form",{attrs:{layout:"vertical"}},[e.needTitle?a("a-form-item",{attrs:{label:"文章标题："}},[a("a-input",{model:{value:e.selectedPost.title,callback:function(t){e.$set(e.selectedPost,"title",t)},expression:"selectedPost.title"}})],1):e._e(),a("a-form-item",{attrs:{label:"文章别名："}},[a("template",{slot:"help"},["DEFAULT"===e.options.post_permalink_type?a("span",[e._v(e._s(e.options.blog_url)+"/"+e._s(e.options.archives_prefix)+"/"+e._s(e.selectedPost.slug?e.selectedPost.slug:"${slug}")+e._s(e.options.path_suffix?e.options.path_suffix:""))]):"DATE"===e.options.post_permalink_type?a("span",[e._v(e._s(e.options.blog_url)+e._s(e._f("moment_post_date")(e.selectedPost.createTime?e.selectedPost.createTime:new Date))+e._s(e.selectedPost.slug?e.selectedPost.slug:"${slug}")+e._s(e.options.path_suffix?e.options.path_suffix:""))]):"DAY"===e.options.post_permalink_type?a("span",[e._v(e._s(e.options.blog_url)+e._s(e._f("moment_post_day")(e.selectedPost.createTime?e.selectedPost.createTime:new Date))+e._s(e.selectedPost.slug?e.selectedPost.slug:"${slug}")+e._s(e.options.path_suffix?e.options.path_suffix:""))]):"ID"===e.options.post_permalink_type?a("span",[e._v(e._s(e.options.blog_url)+"/?p="+e._s(e.selectedPost.id?e.selectedPost.id:"${id}"))]):e._e()]),a("a-input",{model:{value:e.selectedPost.slug,callback:function(t){e.$set(e.selectedPost,"slug",t)},expression:"selectedPost.slug"}})],2),a("a-form-item",{attrs:{label:"发表时间："}},[a("a-date-picker",{attrs:{showTime:"",defaultValue:e.pickerDefaultValue,format:"YYYY-MM-DD HH:mm:ss",placeholder:"选择文章发表时间"},on:{change:e.onPostDateChange,ok:e.onPostDateOk}})],1),a("a-form-item",{attrs:{label:"开启评论："}},[a("a-radio-group",{attrs:{defaultValue:!1},model:{value:e.selectedPost.disallowComment,callback:function(t){e.$set(e.selectedPost,"disallowComment",t)},expression:"selectedPost.disallowComment"}},[a("a-radio",{attrs:{value:!1}},[e._v("开启")]),a("a-radio",{attrs:{value:!0}},[e._v("关闭")])],1)],1),a("a-form-item",{attrs:{label:"是否置顶："}},[a("a-radio-group",{attrs:{defaultValue:0},model:{value:e.selectedPost.topPriority,callback:function(t){e.$set(e.selectedPost,"topPriority",t)},expression:"selectedPost.topPriority"}},[a("a-radio",{attrs:{value:1}},[e._v("是")]),a("a-radio",{attrs:{value:0}},[e._v("否")])],1)],1),a("a-form-item",{attrs:{label:"是否首页轮播："}},[a("a-radio-group",{attrs:{defaultValue:0},model:{value:e.selectedPost.indexPriority,callback:function(t){e.$set(e.selectedPost,"indexPriority",t)},expression:"selectedPost.indexPriority"}},[a("a-radio",{attrs:{value:1}},[e._v("是")]),a("a-radio",{attrs:{value:0}},[e._v("否")])],1)],1),e.customTpls.length>0?a("a-form-item",{attrs:{label:"自定义模板："}},[a("a-select",{model:{value:e.selectedPost.template,callback:function(t){e.$set(e.selectedPost,"template",t)},expression:"selectedPost.template"}},[a("a-select-option",{key:"",attrs:{value:""}},[e._v("无")]),e._l(e.customTpls,(function(t){return a("a-select-option",{key:t,attrs:{value:t}},[e._v(e._s(t))])}))],2)],1):e._e()],1)],1)]),a("a-divider"),a("div",{style:{marginBottom:"16px"}},[a("h3",{staticClass:"post-setting-drawer-title"},[e._v("分类目录")]),a("div",{staticClass:"post-setting-drawer-item"},[a("a-form",{attrs:{layout:"vertical"}},[a("a-form-item",[a("category-tree",{attrs:{categories:e.categories},model:{value:e.selectedCategoryIds,callback:function(t){e.selectedCategoryIds=t},expression:"selectedCategoryIds"}})],1),e.categoryFormVisible?a("a-form-item",[a("category-select-tree",{attrs:{categories:e.categories},model:{value:e.categoryToCreate.parentId,callback:function(t){e.$set(e.categoryToCreate,"parentId",t)},expression:"categoryToCreate.parentId"}})],1):e._e(),e.categoryFormVisible?a("a-form-item",[a("a-input",{attrs:{placeholder:"分类名称"},model:{value:e.categoryToCreate.name,callback:function(t){e.$set(e.categoryToCreate,"name",t)},expression:"categoryToCreate.name"}})],1):e._e(),e.categoryFormVisible?a("a-form-item",[a("a-input",{attrs:{placeholder:"分类路径"},model:{value:e.categoryToCreate.slug,callback:function(t){e.$set(e.categoryToCreate,"slug",t)},expression:"categoryToCreate.slug"}})],1):e._e(),a("a-form-item",[e.categoryFormVisible?a("a-button",{staticStyle:{marginRight:"8px"},attrs:{type:"primary"},on:{click:e.handlerCreateCategory}},[e._v("保存")]):e._e(),e.categoryFormVisible?e._e():a("a-button",{staticStyle:{marginRight:"8px"},attrs:{type:"dashed"},on:{click:e.toggleCategoryForm}},[e._v("新增")]),e.categoryFormVisible?a("a-button",{on:{click:e.toggleCategoryForm}},[e._v("取消")]):e._e()],1)],1)],1)]),a("a-divider"),a("div",{style:{marginBottom:"16px"}},[a("h3",{staticClass:"post-setting-drawer-title"},[e._v("专题")]),a("div",{staticClass:"post-setting-drawer-item"},[a("a-form",{attrs:{layout:"vertical"}},[a("a-form-item",[a("special-tree",{attrs:{specials:e.specials},model:{value:e.selectedSpecialIds,callback:function(t){e.selectedSpecialIds=t},expression:"selectedSpecialIds"}})],1),e.specialFormVisible?a("a-form-item",[a("special-select-tree",{attrs:{specials:e.specials},model:{value:e.specialToCreate.parentId,callback:function(t){e.$set(e.specialToCreate,"parentId",t)},expression:"specialToCreate.parentId"}})],1):e._e(),e.specialFormVisible?a("a-form-item",[a("a-input",{attrs:{placeholder:"专题名称"},model:{value:e.specialToCreate.name,callback:function(t){e.$set(e.specialToCreate,"name",t)},expression:"specialToCreate.name"}})],1):e._e(),e.specialFormVisible?a("a-form-item",[a("a-input",{attrs:{placeholder:"专题路径"},model:{value:e.specialToCreate.slug,callback:function(t){e.$set(e.specialToCreate,"slug",t)},expression:"specialToCreate.slug"}})],1):e._e(),a("a-form-item",[e.specialFormVisible?a("a-button",{staticStyle:{marginRight:"8px"},attrs:{type:"primary"},on:{click:e.handlerCreateSpecial}},[e._v("保存")]):e._e(),e.specialFormVisible?e._e():a("a-button",{staticStyle:{marginRight:"8px"},attrs:{type:"dashed"},on:{click:e.toggleSpecialForm}},[e._v("新增")]),e.specialFormVisible?a("a-button",{on:{click:e.toggleSpecialForm}},[e._v("取消")]):e._e()],1)],1)],1)]),a("a-divider"),a("div",{style:{marginBottom:"16px"}},[a("h3",{staticClass:"post-setting-drawer-title"},[e._v("标签")]),a("div",{staticClass:"post-setting-drawer-item"},[a("a-form",{attrs:{layout:"vertical"}},[a("a-form-item",[a("TagSelect",{model:{value:e.selectedTagIds,callback:function(t){e.selectedTagIds=t},expression:"selectedTagIds"}})],1)],1)],1)]),a("a-divider"),a("div",{style:{marginBottom:"16px"}},[a("h3",{staticClass:"post-setting-drawer-title"},[e._v("摘要")]),a("div",{staticClass:"post-setting-drawer-item"},[a("a-form",{attrs:{layout:"vertical"}},[a("a-form-item",[a("a-input",{attrs:{type:"textarea",autoSize:{minRows:5},placeholder:"如不填写，会从文章中自动截取"},model:{value:e.selectedPost.summary,callback:function(t){e.$set(e.selectedPost,"summary",t)},expression:"selectedPost.summary"}})],1)],1)],1)]),a("a-divider"),a("div",{style:{marginBottom:"16px"}},[a("h3",{staticClass:"post-setting-drawer-title"},[e._v("封面图")]),a("div",{staticClass:"post-setting-drawer-item"},[a("div",{staticClass:"post-thumb"},[a("img",{staticClass:"img",attrs:{src:e.selectedPost.thumbnail||"/images/placeholder.jpg"},on:{click:function(t){e.thumbDrawerVisible=!0}}}),a("a-form",{attrs:{layout:"vertial"}},[a("a-form-item",[a("a-input",{attrs:{placeholder:"点击封面图选择图片，或者输入外部链接"},model:{value:e.selectedPost.thumbnail,callback:function(t){e.$set(e.selectedPost,"thumbnail",t)},expression:"selectedPost.thumbnail"}})],1)],1),a("a-button",{staticClass:"post-thumb-remove",attrs:{type:"dashed"},on:{click:e.handleRemoveThumb}},[e._v("移除")])],1)])]),a("a-divider",{staticClass:"divider-transparent"})],1)]),a("AttachmentSelectDrawer",{attrs:{drawerWidth:480},on:{listenToSelect:e.handleSelectPostThumb},model:{value:e.thumbDrawerVisible,callback:function(t){e.thumbDrawerVisible=t},expression:"thumbDrawerVisible"}}),a("a-drawer",{attrs:{title:"高级设置",width:e.isMobile()?"100%":"480",placement:"right",closable:"",destroyOnClose:"",visible:e.advancedVisible},on:{close:e.onAdvancedClose}},[a("div",{staticClass:"post-setting-drawer-content"},[a("div",{style:{marginBottom:"16px"}},[a("h3",{staticClass:"post-setting-drawer-title"},[e._v("加密设置")]),a("div",{staticClass:"post-setting-drawer-item"},[a("a-form",{attrs:{layout:"vertical"}},[a("a-form-item",{attrs:{label:"访问密码："}},[a("a-input-password",{attrs:{autocomplete:"new-password"},model:{value:e.selectedPost.password,callback:function(t){e.$set(e.selectedPost,"password",t)},expression:"selectedPost.password"}})],1)],1)],1)]),a("a-divider"),a("div",{style:{marginBottom:"16px"}},[a("h3",{staticClass:"post-setting-drawer-title"},[e._v("SEO 设置")]),a("div",{staticClass:"post-setting-drawer-item"},[a("a-form",{attrs:{layout:"vertical"}},[a("a-form-item",{attrs:{label:"自定义关键词："}},[a("a-input",{attrs:{placeholder:"多个关键词以英文逗号隔开，如不填写，将自动使用标签作为关键词"},model:{value:e.selectedPost.metaKeywords,callback:function(t){e.$set(e.selectedPost,"metaKeywords",t)},expression:"selectedPost.metaKeywords"}})],1),a("a-form-item",{attrs:{label:"自定义描述："}},[a("a-input",{attrs:{type:"textarea",autoSize:{minRows:5},placeholder:"如不填写，会从文章中自动截取"},model:{value:e.selectedPost.metaDescription,callback:function(t){e.$set(e.selectedPost,"metaDescription",t)},expression:"selectedPost.metaDescription"}})],1)],1)],1)]),a("a-divider"),a("div",{style:{marginBottom:"16px"}},[a("h3",{staticClass:"post-setting-drawer-title"},[e._v("元数据")]),a("a-form",{attrs:{layout:"vertical"}},[e._l(e.selectedMetas,(function(t,s){return a("a-form-item",{key:s,attrs:{prop:"metas."+s+".value"}},[a("a-row",{attrs:{gutter:5}},[a("a-col",{attrs:{span:12}},[a("a-input",{model:{value:t.key,callback:function(a){e.$set(t,"key",a)},expression:"meta.key"}},[a("i",{attrs:{slot:"addonBefore"},slot:"addonBefore"},[e._v("K")])])],1),a("a-col",{attrs:{span:12}},[a("a-input",{model:{value:t.value,callback:function(a){e.$set(t,"value",a)},expression:"meta.value"}},[a("i",{attrs:{slot:"addonBefore"},slot:"addonBefore"},[e._v("V")]),a("a",{attrs:{slot:"addonAfter",href:"javascript:void(0);"},on:{click:function(a){return a.preventDefault(),e.handleRemovePostMeta(t)}},slot:"addonAfter"},[a("a-icon",{attrs:{type:"close"}})],1)])],1)],1)],1)})),a("a-form-item",[a("a-button",{attrs:{type:"dashed"},on:{click:e.handleInsertPostMeta}},[e._v("新增")])],1)],2)],1),a("a-divider",{staticClass:"divider-transparent"})],1)]),a("div",{staticClass:"bottom-control"},[a("a-button",{staticStyle:{marginRight:"8px"},attrs:{type:"dashed"},on:{click:function(t){e.advancedVisible=!0}}},[e._v("高级")]),e.saveDraftButton?a("a-button",{staticStyle:{marginRight:"8px"},attrs:{loading:e.draftSaving},on:{click:e.handleDraftClick}},[e._v("保存草稿")]):e._e(),a("a-button",{attrs:{type:"primary",loading:e.saving},on:{click:e.handlePublishClick}},[e._v(" "+e._s(e.selectedPost.id?"保存":"发布")+" ")])],1)],1)},o=[],r=(a("8e6e"),a("ac6a"),a("456d"),a("7f7f"),a("bd86")),i=a("ac0d"),n=a("c1df"),c=a.n(n),l=a("eda3"),d=a("fa25"),u=a("3164"),p=a("c39e"),m=a("edf6"),h=a("3993"),f=a("2f62"),g=a("c405"),v=a("7e9e"),b=a("caf6"),y=a("12de");function C(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var s=Object.getOwnPropertySymbols(e);t&&(s=s.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,s)}return a}function T(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?C(Object(a),!0).forEach((function(t){Object(r["a"])(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):C(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}var P={name:"PostSettingDrawer",mixins:[i["a"],i["b"]],components:{CategoryTree:l["a"],CategorySelectTree:d["a"],SpecialTree:u["a"],SpecialSelectTree:p["a"],TagSelect:m["a"],AttachmentSelectDrawer:h["a"]},data:function(){return{thumbDrawerVisible:!1,categoryFormVisible:!1,specialFormVisible:!1,advancedVisible:!1,settingLoading:!0,selectedPost:this.post,selectedTagIds:this.tagIds,selectedCategoryIds:this.categoryIds,categories:[],categoryToCreate:{},selectedSpecialIds:this.specialIds,specials:[],specialToCreate:{},customTpls:[],saving:!1,draftSaving:!1}},props:{post:{type:Object,required:!0},tagIds:{type:Array,required:!0},categoryIds:{type:Array,required:!0},specialIds:{type:Array,required:!0},metas:{type:Array,required:!0},needTitle:{type:Boolean,required:!1,default:!1},saveDraftButton:{type:Boolean,required:!1,default:!0},visible:{type:Boolean,required:!1,default:!0}},watch:{post:function(e){this.selectedPost=e},selectedPost:function(e){this.$emit("onRefreshPost",e)},tagIds:function(e){this.selectedTagIds=e},selectedTagIds:function(e){this.$emit("onRefreshTagIds",e)},categoryIds:function(e){this.selectedCategoryIds=e},selectedCategoryIds:function(e){this.$emit("onRefreshCategoryIds",e)},specialIds:function(e){this.selectedSpecialIds=e},selectedSpecialIds:function(e){this.$emit("onRefreshSpecialIds",e)},selectedMetas:function(e){this.$emit("onRefreshPostMetas",e)},visible:function(e,t){e&&(this.loadSkeleton(),this.loadCategories(),this.loadSpecials(),this.loadPresetMetasField(),this.loadCustomTpls())}},computed:T({selectedMetas:function(){return this.metas},pickerDefaultValue:function(){if(this.selectedPost.createTime){var e=new Date(this.selectedPost.createTime);return c()(e,"YYYY-MM-DD HH:mm:ss")}return c()(new Date,"YYYY-MM-DD HH:mm:ss")}},Object(f["c"])(["options"])),methods:{loadSkeleton:function(){var e=this;this.settingLoading=!0,setTimeout((function(){e.settingLoading=!1}),500)},loadCategories:function(){var e=this;g["a"].listAll().then((function(t){e.categories=t.data.data}))},loadSpecials:function(){var e=this;v["a"].listAll().then((function(t){e.specials=t.data.data}))},loadPresetMetasField:function(){var e=this;this.metas.length<=0&&y["a"].getActivatedTheme().then((function(t){var a=t.data.data.postMetaField;if(a&&a.length>0)for(var s=0,o=a.length;s<o;s++)e.selectedMetas.push({value:"",key:a[s]})}))},loadCustomTpls:function(){var e=this;y["a"].customPostTpls().then((function(t){e.customTpls=t.data.data}))},handleSelectPostThumb:function(e){this.selectedPost.thumbnail=encodeURI(e.path),this.thumbDrawerVisible=!1},handleRemoveThumb:function(){this.selectedPost.thumbnail=null},handlerCreateCategory:function(){var e=this;this.categoryToCreate.name?g["a"].create(this.categoryToCreate).then((function(t){e.loadCategories(),e.categoryToCreate={},e.toggleCategoryForm()})):this.$notification["error"]({message:"提示",description:"分类名称不能为空！"})},handlerCreateSpecial:function(){var e=this;this.specialToCreate.name?v["a"].create(this.specialToCreate).then((function(t){e.loadSpecials(),e.specialToCreate={},e.toggleSpecialForm()})):this.$notification["error"]({message:"提示",description:"专题名称不能为空！"})},toggleCategoryForm:function(){this.categoryFormVisible=!this.categoryFormVisible},toggleSpecialForm:function(){this.specialFormVisible=!this.specialFormVisible},handleDraftClick:function(){this.selectedPost.status="DRAFT",this.createOrUpdatePost()},handlePublishClick:function(){this.selectedPost.status="PUBLISHED",this.createOrUpdatePost()},createOrUpdatePost:function(){var e=this;this.selectedPost.title?(this.selectedPost.categoryIds=this.selectedCategoryIds,this.selectedPost.specialIds=this.selectedSpecialIds,this.selectedPost.tagIds=this.selectedTagIds,this.selectedPost.metas=this.selectedMetas,"DRAFT"===this.selectedPost.status?this.draftSaving=!0:this.saving=!0,this.selectedPost.id?b["a"].update(this.selectedPost.id,this.selectedPost,!1).then((function(t){e.$log.debug("Updated post",t.data.data),"DRAFT"===e.selectedPost.status?e.$message.success("草稿保存成功！"):e.$message.success("文章更新成功！"),e.$emit("onSaved",!0),e.$router.push({name:"PostList"})})).finally((function(){e.saving=!1,e.draftSaving=!1})):b["a"].create(this.selectedPost,!1).then((function(t){e.$log.debug("Created post",t.data.data),"DRAFT"===e.selectedPost.status?e.$message.success("草稿保存成功！"):e.$message.success("文章发布成功！"),e.$emit("onSaved",!0),e.$router.push({name:"PostList"}),e.selectedPost=t.data.data})).finally((function(){e.saving=!1,e.draftSaving=!1}))):this.$notification["error"]({message:"提示",description:"文章标题不能为空！"})},onClose:function(){this.$emit("close",!1)},onAdvancedClose:function(){this.advancedVisible=!1},onPostDateChange:function(e,t){this.selectedPost.createTime=e.valueOf()},onPostDateOk:function(e){this.selectedPost.createTime=e.valueOf()},handleRemovePostMeta:function(e){var t=this.selectedMetas.indexOf(e);-1!==t&&this.selectedMetas.splice(t,1)},handleInsertPostMeta:function(){this.selectedMetas.push({value:"",key:""})}}},_=P,k=a("2877"),I=Object(k["a"])(_,s,o,!1,null,null,null);t["a"]=I.exports},c39e:function(e,t,a){"use strict";var s=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a-tree-select",{attrs:{treeData:e.specialTreeData,placeholder:"请选择上级目录，默认为顶级目录",treeDefaultExpandAll:"",treeDataSimpleMode:!0,allowClear:!0,value:e.specialIdString},on:{change:e.handleSelectionChange}})},o=[],r=(a("6b54"),a("7f7f"),a("c5f6"),{name:"SpecialSelectTree",model:{prop:"specialId",event:"change"},props:{specialId:{type:Number,required:!0,default:0},categories:{type:Array,required:!1,default:function(){return[]}}},computed:{specialTreeData:function(){return this.categories.map((function(e){return{id:e.id,title:e.name,value:e.id.toString(),pId:e.parentId}}))},specialIdString:function(){return this.specialId.toString()}},methods:{handleSelectionChange:function(e,t,a){this.$log.debug("value: ",e),this.$log.debug("label: ",t),this.$log.debug("extra: ",a),this.$emit("change",e?parseInt(e):0)}}}),i=r,n=a("2877"),c=Object(n["a"])(i,s,o,!1,null,null,null);t["a"]=c.exports},c405:function(e,t,a){"use strict";a("7f7f"),a("ac6a");var s=a("9efd"),o="/api/admin/categories",r={};function i(e,t){t.forEach((function(t){e.key===t.parentId&&(e.children||(e.children=[]),e.children.push({key:t.id,title:t.name,isLeaf:!1}))})),e.children?e.children.forEach((function(e){return i(e,t)})):e.isLeaf=!0}r.listAll=function(){var e=arguments.length>0&&void 0!==arguments[0]&&arguments[0];return Object(s["a"])({url:"".concat(o),params:{more:e},method:"get"})},r.listTree=function(){return Object(s["a"])({url:"".concat(o,"/tree_view"),method:"get"})},r.create=function(e){return Object(s["a"])({url:o,data:e,method:"post"})},r.delete=function(e){return Object(s["a"])({url:"".concat(o,"/").concat(e),method:"delete"})},r.get=function(e){return Object(s["a"])({url:"".concat(o,"/").concat(e),method:"get"})},r.update=function(e,t){return Object(s["a"])({url:"".concat(o,"/").concat(e),data:t,method:"put"})},r.concreteTree=function(e){var t={key:0,title:"top",children:[]};return i(t,e),t.children},t["a"]=r},caf6:function(e,t,a){"use strict";var s=a("9efd"),o="/api/admin/posts",r={listLatest:function(e){return Object(s["a"])({url:"".concat(o,"/latest"),params:{top:e},method:"get"})},query:function(e){return Object(s["a"])({url:o,params:e,method:"get"})},get:function(e){return Object(s["a"])({url:"".concat(o,"/").concat(e),method:"get"})},create:function(e,t){return Object(s["a"])({url:o,method:"post",data:e,params:{autoSave:t}})},update:function(e,t,a){return Object(s["a"])({url:"".concat(o,"/").concat(e),method:"put",data:t,params:{autoSave:a}})},updateDraft:function(e,t){return Object(s["a"])({url:"".concat(o,"/").concat(e,"/status/draft/content"),method:"put",data:{content:t}})},updateStatus:function(e,t){return Object(s["a"])({url:"".concat(o,"/").concat(e,"/status/").concat(t),method:"put"})},updateStatusInBatch:function(e,t){return Object(s["a"])({url:"".concat(o,"/status/").concat(t),data:e,method:"put"})},delete:function(e){return Object(s["a"])({url:"".concat(o,"/").concat(e),method:"delete"})},deleteInBatch:function(e){return Object(s["a"])({url:"".concat(o),data:e,method:"delete"})},preview:function(e){return Object(s["a"])({url:"".concat(o,"/preview/").concat(e),method:"get"})},postStatus:{PUBLISHED:{value:"PUBLISHED",color:"green",status:"success",text:"已发布"},DRAFT:{value:"DRAFT",color:"yellow",status:"warning",text:"草稿"},RECYCLE:{value:"RECYCLE",color:"red",status:"error",text:"回收站"},INTIMATE:{value:"INTIMATE",color:"blue",status:"success",text:"私密"}},permalinkType:{DEFAULT:{type:"DEFAULT",text:"默认"},DATE:{type:"DATE",text:"年月型"},DAY:{type:"DAY",text:"年月日型"},ID:{type:"ID",text:"ID 型"}}};t["a"]=r},d28d:function(e,t,a){"use strict";var s=a("9efd"),o="/api/admin/tags",r={listAll:function(){var e=arguments.length>0&&void 0!==arguments[0]&&arguments[0];return Object(s["a"])({url:o,params:{more:e},method:"get"})},createWithName:function(e){return Object(s["a"])({url:o,data:{name:e},method:"post"})},create:function(e){return Object(s["a"])({url:o,data:e,method:"post"})},update:function(e,t){return Object(s["a"])({url:"".concat(o,"/").concat(e),data:t,method:"put"})},delete:function(e){return Object(s["a"])({url:"".concat(o,"/").concat(e),method:"delete"})}};t["a"]=r},eda3:function(e,t,a){"use strict";var s=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a-tree",{attrs:{checkable:"",treeData:e.categoryTree,defaultExpandAll:!0,checkedKeys:e.categoryIds},on:{check:e.onCheck}})},o=[],r=a("c405"),i={name:"CategoryTree",model:{prop:"categoryIds",event:"check"},props:{categoryIds:{type:Array,required:!1,default:function(){return[]}},categories:{type:Array,required:!1,default:function(){return[]}}},computed:{categoryTree:function(){return r["a"].concreteTree(this.categories)}},methods:{onCheck:function(e,t){this.$log.debug("Chekced keys",e),this.$log.debug("e",t);var a=t.checkedNodes.filter((function(e){return e.data.props.isLeaf})).map((function(e){return e.key}));this.$log.debug("Effectively selected category ids",a),this.$emit("check",a)}}},n=i,c=a("2877"),l=Object(c["a"])(n,s,o,!1,null,null,null);t["a"]=l.exports},edf6:function(e,t,a){"use strict";var s=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("a-select",{staticStyle:{width:"100%"},attrs:{allowClear:"",mode:"tags",placeholder:"选择或输入标签"},on:{change:e.handleChange},model:{value:e.selectedTagNames,callback:function(t){e.selectedTagNames=t},expression:"selectedTagNames"}},e._l(e.tags,(function(t){return a("a-select-option",{key:t.id,attrs:{value:t.name}},[e._v(e._s(t.name))])})),1)],1)},o=[],r=(a("ac6a"),a("7f7f"),a("d28d")),i=a("bc3a"),n=a.n(i),c={name:"TagSelect",model:{prop:"tagIds",event:"change"},props:{tagIds:{type:Array,required:!1,default:function(){return[]}}},data:function(){return{tags:[],selectedTagNames:[]}},created:function(){this.loadTags()},watch:{tags:function(e,t){var a=this;e&&(this.selectedTagNames=this.tagIds.map((function(e){return a.tagIdMap[e].name})))}},computed:{tagIdMap:function(){var e={};return this.tags.forEach((function(t){e[t.id]=t})),e},tagNameMap:function(){var e={};return this.tags.forEach((function(t){e[t.name]=t})),e}},methods:{loadTags:function(e){var t=this;r["a"].listAll(!0).then((function(a){t.tags=a.data.data,e&&e()}))},handleChange:function(){var e=this;this.$log.debug("Changed");var t=this.selectedTagNames.filter((function(t){return!e.tagNameMap[t]}));if(this.$log.debug("Tag names to create",t),t!==[]){var a=t.map((function(e){return r["a"].createWithName(e)}));n.a.all(a).then(n.a.spread((function(){e.loadTags((function(){e.$log.debug("Tag name map",e.tagNameMap);var t=e.selectedTagNames.map((function(t){return e.tagNameMap[t].id}));e.$emit("change",t)}))})))}else{var s=this.selectedTagNames.map((function(t){return e.tagNameMap[t].id}));this.$emit("change",s)}}}},l=c,d=a("2877"),u=Object(d["a"])(l,s,o,!1,null,null,null);t["a"]=u.exports},fa25:function(e,t,a){"use strict";var s=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("a-tree-select",{attrs:{treeData:e.categoryTreeData,placeholder:"请选择上级目录，默认为顶级目录",treeDefaultExpandAll:"",treeDataSimpleMode:!0,allowClear:!0,value:e.categoryIdString},on:{change:e.handleSelectionChange}})},o=[],r=(a("6b54"),a("7f7f"),a("c5f6"),{name:"CategorySelectTree",model:{prop:"categoryId",event:"change"},props:{categoryId:{type:Number,required:!0,default:0},categories:{type:Array,required:!1,default:function(){return[]}}},computed:{categoryTreeData:function(){return this.categories.map((function(e){return{id:e.id,title:e.name,value:e.id.toString(),pId:e.parentId}}))},categoryIdString:function(){return this.categoryId.toString()}},methods:{handleSelectionChange:function(e,t,a){this.$log.debug("value: ",e),this.$log.debug("label: ",t),this.$log.debug("extra: ",a),this.$emit("change",e?parseInt(e):0)}}}),i=r,n=a("2877"),c=Object(n["a"])(i,s,o,!1,null,null,null);t["a"]=c.exports}}]);
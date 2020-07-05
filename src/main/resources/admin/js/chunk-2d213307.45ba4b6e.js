(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2d213307"],{ac2a:function(t,e,a){"use strict";a.r(e);var i=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"container-wrapper"},[a("div",{staticClass:"halo-logo animated fadeInUp"},[a("span",[t._v("Halo "),t.apiModifyVisible?a("small",[t._v("API 设置")]):t._e(),t.authcodeVisible?a("small",[t._v("两步验证")]):t._e()])]),a("div",{directives:[{name:"show",rawName:"v-show",value:"login-form"==t.formVisible,expression:"formVisible == 'login-form'"}],staticClass:"login-form animated"},[a("a-form",{attrs:{layout:"vertical"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.handleLoginPreCheck(e)}}},[a("a-form-item",{staticClass:"animated fadeInUp",style:{"animation-delay":"0.1s"}},[a("a-input",{attrs:{placeholder:"用户名/邮箱"},model:{value:t.username,callback:function(e){t.username=e},expression:"username"}},[a("a-icon",{staticStyle:{color:"rgba(0,0,0,.25)"},attrs:{slot:"prefix",type:"user"},slot:"prefix"})],1)],1),a("a-form-item",{staticClass:"animated fadeInUp",style:{"animation-delay":"0.2s"}},[a("a-input",{attrs:{type:"password",placeholder:"密码"},model:{value:t.password,callback:function(e){t.password=e},expression:"password"}},[a("a-icon",{staticStyle:{color:"rgba(0,0,0,.25)"},attrs:{slot:"prefix",type:"lock"},slot:"prefix"})],1)],1),a("a-form-item",{staticClass:"animated fadeInUp",style:{"animation-delay":"0.3s"}},[a("a-button",{attrs:{loading:t.landing,type:"primary",block:!0},on:{click:t.handleLoginPreCheck}},[t._v("登录")])],1),a("a-row",[a("router-link",{attrs:{to:{name:"ResetPassword"}}},[t.resetPasswordButton?a("a",{staticClass:"tip animated fadeInRight",attrs:{href:"javascript:void(0);"}},[t._v(" 找回密码 ")]):t._e()]),a("a",{staticClass:"tip animated fadeInUp",style:{"animation-delay":"0.4s"},on:{click:t.toggleShowApiForm}},[a("a-icon",{attrs:{type:"setting"}})],1)],1)],1)],1),a("div",{directives:[{name:"show",rawName:"v-show",value:t.apiModifyVisible,expression:"apiModifyVisible"}],staticClass:"api-form animated"},[a("a-form",{attrs:{layout:"vertical"}},[a("a-form-item",{staticClass:"animated fadeInUp",style:{"animation-delay":"0.1s"},attrs:{extra:"* 如果 Admin 不是独立部署，请不要更改此 API"}},[a("a-input",{attrs:{placeholder:"API 地址"},model:{value:t.apiUrl,callback:function(e){t.apiUrl=e},expression:"apiUrl"}},[a("a-icon",{staticStyle:{color:"rgba(0,0,0,.25)"},attrs:{slot:"prefix",type:"api"},slot:"prefix"})],1)],1),a("a-form-item",{staticClass:"animated fadeInUp",style:{"animation-delay":"0.2s"}},[a("a-button",{attrs:{block:!0},on:{click:t.handleApiUrlRestore}},[t._v("恢复默认")])],1),a("a-form-item",{staticClass:"animated fadeInUp",style:{"animation-delay":"0.3s"}},[a("a-button",{attrs:{type:"primary",block:!0},on:{click:t.handleApiModifyOk}},[t._v("保存设置")])],1),a("a-row",[a("a",{staticClass:"tip animated fadeInUp",style:{"animation-delay":"0.4s"},on:{click:t.toggleShowApiForm}},[a("a-icon",{attrs:{type:"rollback"}})],1)])],1)],1),a("div",{directives:[{name:"show",rawName:"v-show",value:t.authcodeVisible,expression:"authcodeVisible"}],staticClass:"authcode-form animated"},[a("a-form",{attrs:{layout:"vertical"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.handleLogin(e)}}},[a("a-form-item",{staticClass:"animated fadeInUp",style:{"animation-delay":"0.1s"}},[a("a-input",{attrs:{placeholder:"两步验证码",maxLength:6},model:{value:t.authcode,callback:function(e){t.authcode=e},expression:"authcode"}},[a("a-icon",{staticStyle:{color:"rgba(0,0,0,.25)"},attrs:{slot:"prefix",type:"safety-certificate"},slot:"prefix"})],1)],1),a("a-form-item",{staticClass:"animated fadeInUp",style:{"animation-delay":"0.3s"}},[a("a-button",{attrs:{loading:t.landing,type:"primary",block:!0},on:{click:t.handleLogin}},[t._v("验证")])],1),a("a-row",[a("a",{staticClass:"tip animated fadeInUp",style:{"animation-delay":"0.4s"},on:{click:t.toggleShowLoginForm}},[a("a-icon",{attrs:{type:"rollback"}})],1)])],1)],1)])},s=[],o=(a("8e6e"),a("ac6a"),a("456d"),a("a481"),a("bd86")),n=a("50fc"),r=a("2f62");function l(t,e){var a=Object.keys(t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(t);e&&(i=i.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),a.push.apply(a,i)}return a}function d(t){for(var e=1;e<arguments.length;e++){var a=null!=arguments[e]?arguments[e]:{};e%2?l(Object(a),!0).forEach((function(e){Object(o["a"])(t,e,a[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(a)):l(Object(a)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(a,e))}))}return t}var c={data:function(){return{username:null,password:null,authcode:null,needAuthCode:!1,formVisible:"login-form",loginVisible:!0,apiModifyVisible:!1,authcodeVisible:!1,defaultApiBefore:window.location.protocol+"//",apiUrl:window.location.host,resetPasswordButton:!1,landing:!1}},computed:d({},Object(r["c"])({defaultApiUrl:"apiUrl"})),created:function(){this.verifyIsInstall();var t=this;document.addEventListener("keydown",(function(e){72===e.keyCode&&e.altKey&&e.shiftKey&&t.toggleHidden()}))},watch:{formVisible:function(t){this.loginVisible="authcode-form"===t,this.apiModifyVisible="api-form"===t,this.authcodeVisible="authcode-form"===t}},methods:d({},Object(r["b"])(["login","loadUser","loadOptions"]),{},Object(r["d"])({setApiUrl:"SET_API_URL",restoreApiUrl:"RESTORE_API_URL"}),{verifyIsInstall:function(){var t=this;n["a"].isInstalled().then((function(e){e.data.data||t.$router.push({name:"Install"})}))},handleLoginPreCheck:function(){var t=this;this.username?this.password?n["a"].loginPreCheck(this.username,this.password).then((function(e){e.data.data&&e.data.data.needMFACode?(t.formVisible="authcode-form",t.authcode=null,t.needAuthCode=!0):(t.needAuthCode=!1,t.handleLogin())})):this.$message.warn("密码不能为空！"):this.$message.warn("用户名不能为空！")},handleLogin:function(){var t=this;this.username?this.password?!this.needAuthCode||this.authcode?(this.landing=!0,this.login({username:this.username,password:this.password,authcode:this.authcode}).then((function(e){t.loginSuccess()})).finally((function(){setTimeout((function(){t.landing=!1}),500)}))):this.$message.warn("两步验证码不能为空！"):this.$message.warn("密码不能为空！"):this.$message.warn("用户名不能为空！")},loginSuccess:function(){this.loadUser(),this.loadOptions(),this.$route.query.redirect?this.$router.replace(this.$route.query.redirect):this.$router.replace({name:"Dashboard"})},handleApiModifyOk:function(){this.setApiUrl(this.apiUrl),this.formVisible="login-form"},handleApiUrlRestore:function(){this.restoreApiUrl(),this.apiUrl=this.defaultApiUrl},toggleShowApiForm:function(){this.formVisible=this.apiModifyVisible?"login-form":"api-form",this.apiModifyVisible=!this.apiModifyVisible,this.apiModifyVisible&&(this.apiUrl=this.defaultApiUrl)},toggleShowLoginForm:function(){this.formVisible="login-form",this.password=null},toggleHidden:function(){this.resetPasswordButton=!this.resetPasswordButton}})},p=c,u=a("2877"),f=Object(u["a"])(p,i,s,!1,null,null,null);e["default"]=f.exports}}]);
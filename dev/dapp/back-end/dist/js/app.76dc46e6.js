(function(t){function e(e){for(var r,a,s=e[0],u=e[1],c=e[2],l=0,d=[];l<s.length;l++)a=s[l],Object.prototype.hasOwnProperty.call(o,a)&&o[a]&&d.push(o[a][0]),o[a]=0;for(r in u)Object.prototype.hasOwnProperty.call(u,r)&&(t[r]=u[r]);p&&p(e);while(d.length)d.shift()();return i.push.apply(i,c||[]),n()}function n(){for(var t,e=0;e<i.length;e++){for(var n=i[e],r=!0,a=1;a<n.length;a++){var s=n[a];0!==o[s]&&(r=!1)}r&&(i.splice(e--,1),t=u(u.s=n[0]))}return t}var r={},a={app:0},o={app:0},i=[];function s(t){return u.p+"js/"+({about:"about"}[t]||t)+"."+{about:"20f72a63"}[t]+".js"}function u(e){if(r[e])return r[e].exports;var n=r[e]={i:e,l:!1,exports:{}};return t[e].call(n.exports,n,n.exports,u),n.l=!0,n.exports}u.e=function(t){var e=[],n={about:1};a[t]?e.push(a[t]):0!==a[t]&&n[t]&&e.push(a[t]=new Promise((function(e,n){for(var r="css/"+({about:"about"}[t]||t)+"."+{about:"86225813"}[t]+".css",o=u.p+r,i=document.getElementsByTagName("link"),s=0;s<i.length;s++){var c=i[s],l=c.getAttribute("data-href")||c.getAttribute("href");if("stylesheet"===c.rel&&(l===r||l===o))return e()}var d=document.getElementsByTagName("style");for(s=0;s<d.length;s++){c=d[s],l=c.getAttribute("data-href");if(l===r||l===o)return e()}var p=document.createElement("link");p.rel="stylesheet",p.type="text/css",p.onload=e,p.onerror=function(e){var r=e&&e.target&&e.target.src||o,i=new Error("Loading CSS chunk "+t+" failed.\n("+r+")");i.code="CSS_CHUNK_LOAD_FAILED",i.request=r,delete a[t],p.parentNode.removeChild(p),n(i)},p.href=o;var f=document.getElementsByTagName("head")[0];f.appendChild(p)})).then((function(){a[t]=0})));var r=o[t];if(0!==r)if(r)e.push(r[2]);else{var i=new Promise((function(e,n){r=o[t]=[e,n]}));e.push(r[2]=i);var c,l=document.createElement("script");l.charset="utf-8",l.timeout=120,u.nc&&l.setAttribute("nonce",u.nc),l.src=s(t);var d=new Error;c=function(e){l.onerror=l.onload=null,clearTimeout(p);var n=o[t];if(0!==n){if(n){var r=e&&("load"===e.type?"missing":e.type),a=e&&e.target&&e.target.src;d.message="Loading chunk "+t+" failed.\n("+r+": "+a+")",d.name="ChunkLoadError",d.type=r,d.request=a,n[1](d)}o[t]=void 0}};var p=setTimeout((function(){c({type:"timeout",target:l})}),12e4);l.onerror=l.onload=c,document.head.appendChild(l)}return Promise.all(e)},u.m=t,u.c=r,u.d=function(t,e,n){u.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:n})},u.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},u.t=function(t,e){if(1&e&&(t=u(t)),8&e)return t;if(4&e&&"object"===typeof t&&t&&t.__esModule)return t;var n=Object.create(null);if(u.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var r in t)u.d(n,r,function(e){return t[e]}.bind(null,r));return n},u.n=function(t){var e=t&&t.__esModule?function(){return t["default"]}:function(){return t};return u.d(e,"a",e),e},u.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},u.p="/",u.oe=function(t){throw console.error(t),t};var c=window["webpackJsonp"]=window["webpackJsonp"]||[],l=c.push.bind(c);c.push=e,c=c.slice();for(var d=0;d<c.length;d++)e(c[d]);var p=l;i.push([0,"chunk-vendors"]),n()})({0:function(t,e,n){t.exports=n("56d7")},"034f":function(t,e,n){"use strict";n("85ec")},"131e":function(t,e,n){},"56d7":function(t,e,n){"use strict";n.r(e);n("e260"),n("e6cf"),n("cca6"),n("a79d");var r=n("2b0e"),a=n("5c96"),o=n.n(a),i=(n("0fae"),function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"app"}},[n("div",{attrs:{id:"nav"}}),n("router-view")],1)}),s=[],u=(n("034f"),n("2877")),c={},l=Object(u["a"])(c,i,s,!1,null,null,null),d=l.exports,p=(n("d3b7"),n("3ca3"),n("ddb0"),n("8c4f")),f=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"home"},[n("router-link",{attrs:{to:"/Main"}},[n("div",{staticClass:"enter-button-wrap"},[n("img",{staticClass:"enter-button",staticStyle:{width:"100%","max-width":"90px"},attrs:{id:"enter",src:"https://nft-1258500098.cos.ap-beijing.myqcloud.com/logo2.png"}})])]),n("div",{staticClass:"image",attrs:{id:"bg1"}},t._l(t.div_num,(function(e){return n("div",{key:e,staticClass:"bg1 grid",style:{width:t.div_width,height:t.div_height,opacity:t.op[e]},attrs:{id:e},on:{mouseover:function(n){return t.hover_handler(e)}}})})),0),n("div",{staticClass:"image bg2",attrs:{id:"bg2"}}),n("div",{staticClass:"footer"},[n("div",{staticClass:"animate"},t._l(3,(function(e){return n("div",{key:e,staticClass:"footer-text"},[n("p",{staticClass:"text"},[t._v("P(A)")]),n("p",{staticClass:"text"},[t._v(" WELCOME")]),n("p",{staticClass:"mark text",staticStyle:{color:"#00FFA1"}},[t._v("!")]),n("p",{staticClass:"text"},[t._v("P(A)")]),n("p",{staticClass:"text"},[t._v(" WELCOME")]),n("p",{staticClass:"mark text",staticStyle:{color:"#00B7FF"}},[t._v("!")]),n("p",{staticClass:"text"},[t._v("P(A)")]),n("p",{staticClass:"text"},[t._v(" WELCOME")]),n("p",{staticClass:"mark text",staticStyle:{color:"#011EFF"}},[t._v("!")]),n("p",{staticClass:"text"},[t._v("P(A)")]),n("p",{staticClass:"text"},[t._v(" WELCOME")]),n("p",{staticClass:"mark text",staticStyle:{color:"#BD00FF"}},[t._v("!")]),n("p",{staticClass:"text"},[t._v("P(A)")]),n("p",{staticClass:"text"},[t._v(" WELCOME")]),n("p",{staticClass:"mark text",staticStyle:{color:"#D501FE"}},[t._v("!")])])})),0)])],1)},h=[],v={name:"Home",components:{},data:function(){return{div_num:0,div_width:"50px",div_height:"50px",op:[]}},beforeMount:function(){var t=document.body.clientWidth,e=document.body.clientHeight,n=35,r=t/n,a=parseInt(e/r)+1,o=(n+1)*a;this.div_num=o,this.div_width=String(r)+"px",this.div_height=String(r)+"px";for(var i=new Array,s=0;s<o;s++)i.push(1);this.op=i},methods:{hover_handler:function(t){var e=document.getElementById(t);e.style.opacity="0"}}},m=v,b=(n("f3e0"),Object(u["a"])(m,f,h,!1,null,"1230a516",null)),g=b.exports;r["default"].use(p["a"]);var y=[{path:"/",name:"Home",component:g},{path:"/about",name:"About",component:function(){return n.e("about").then(n.bind(null,"f820"))}},{path:"/Main",name:"Main",component:function(){return n.e("about").then(n.bind(null,"cd56"))}},{path:"/Memex",name:"Memex",component:function(){return n.e("about").then(n.bind(null,"1a7a"))}}],_=new p["a"]({mode:"hash",base:"/",routes:y}),C=_;r["default"].use(o.a),r["default"].config.productionTip=!1,new r["default"]({router:C,render:function(t){return t(d)}}).$mount("#app")},"85ec":function(t,e,n){},f3e0:function(t,e,n){"use strict";n("131e")}});
//# sourceMappingURL=app.76dc46e6.js.map
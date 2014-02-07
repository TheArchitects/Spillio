window.Modernizr=function(e,t,n){function r(e){b.cssText=e}function o(e,t){return r(C.join(e+";")+(t||""))}function i(e,t){return typeof e===t}function a(e,t){return!!~(""+e).indexOf(t)}function s(e,t){for(var r in e){var o=e[r];if(!a(o,"-")&&b[o]!==n)return"pfx"==t?o:!0}return!1}function c(e,t,r){for(var o in e){var a=t[e[o]];if(a!==n)return r===!1?e[o]:i(a,"function")?a.bind(r||t):a}return!1}function l(e,t,n){var r=e.charAt(0).toUpperCase()+e.slice(1),o=(e+" "+$.join(r+" ")+r).split(" ");return i(t,"string")||i(t,"undefined")?s(o,t):(o=(e+" "+k.join(r+" ")+r).split(" "),c(o,t,n))}function u(){m.input=function(n){for(var r=0,o=n.length;o>r;r++)N[n[r]]=n[r]in E;return N.list&&(N.list=!!t.createElement("datalist")&&!!e.HTMLDataListElement),N}("autocomplete autofocus list placeholder max min multiple pattern required step".split(" ")),m.inputtypes=function(e){for(var r,o,i,a=0,s=e.length;s>a;a++)E.setAttribute("type",o=e[a]),r="text"!==E.type,r&&(E.value=x,E.style.cssText="position:absolute;visibility:hidden;",/^range$/.test(o)&&E.style.WebkitAppearance!==n?(g.appendChild(E),i=t.defaultView,r=i.getComputedStyle&&"textfield"!==i.getComputedStyle(E,null).WebkitAppearance&&0!==E.offsetHeight,g.removeChild(E)):/^(search|tel)$/.test(o)||(r=/^(url|email)$/.test(o)?E.checkValidity&&E.checkValidity()===!1:E.value!=x)),M[e[a]]=!!r;return M}("search tel url email datetime date month week time datetime-local number range color".split(" "))}var d,f,p="2.6.2",m={},h=!0,g=t.documentElement,v="modernizr",y=t.createElement(v),b=y.style,E=t.createElement("input"),x=":)",w={}.toString,C=" -webkit- -moz- -o- -ms- ".split(" "),S="Webkit Moz O ms",$=S.split(" "),k=S.toLowerCase().split(" "),T={svg:"http://www.w3.org/2000/svg"},j={},M={},N={},P=[],L=P.slice,A=function(e,n,r,o){var i,a,s,c,l=t.createElement("div"),u=t.body,d=u||t.createElement("body");if(parseInt(r,10))for(;r--;)s=t.createElement("div"),s.id=o?o[r]:v+(r+1),l.appendChild(s);return i=["&#173;",'<style id="s',v,'">',e,"</style>"].join(""),l.id=v,(u?l:d).innerHTML+=i,d.appendChild(l),u||(d.style.background="",d.style.overflow="hidden",c=g.style.overflow,g.style.overflow="hidden",g.appendChild(d)),a=n(l,e),u?l.parentNode.removeChild(l):(d.parentNode.removeChild(d),g.style.overflow=c),!!a},O=function(t){var n=e.matchMedia||e.msMatchMedia;if(n)return n(t).matches;var r;return A("@media "+t+" { #"+v+" { position: absolute; } }",function(t){r="absolute"==(e.getComputedStyle?getComputedStyle(t,null):t.currentStyle).position}),r},z=function(){function e(e,o){o=o||t.createElement(r[e]||"div"),e="on"+e;var a=e in o;return a||(o.setAttribute||(o=t.createElement("div")),o.setAttribute&&o.removeAttribute&&(o.setAttribute(e,""),a=i(o[e],"function"),i(o[e],"undefined")||(o[e]=n),o.removeAttribute(e))),o=null,a}var r={select:"input",change:"input",submit:"form",reset:"form",error:"img",load:"img",abort:"img"};return e}(),F={}.hasOwnProperty;f=i(F,"undefined")||i(F.call,"undefined")?function(e,t){return t in e&&i(e.constructor.prototype[t],"undefined")}:function(e,t){return F.call(e,t)},Function.prototype.bind||(Function.prototype.bind=function(e){var t=this;if("function"!=typeof t)throw new TypeError;var n=L.call(arguments,1),r=function(){if(this instanceof r){var o=function(){};o.prototype=t.prototype;var i=new o,a=t.apply(i,n.concat(L.call(arguments)));return Object(a)===a?a:i}return t.apply(e,n.concat(L.call(arguments)))};return r}),j.flexbox=function(){return l("flexWrap")},j.canvas=function(){var e=t.createElement("canvas");return!!e.getContext&&!!e.getContext("2d")},j.canvastext=function(){return!!m.canvas&&!!i(t.createElement("canvas").getContext("2d").fillText,"function")},j.webgl=function(){return!!e.WebGLRenderingContext},j.touch=function(){var n;return"ontouchstart"in e||e.DocumentTouch&&t instanceof DocumentTouch?n=!0:A(["@media (",C.join("touch-enabled),("),v,")","{#modernizr{top:9px;position:absolute}}"].join(""),function(e){n=9===e.offsetTop}),n},j.geolocation=function(){return"geolocation"in navigator},j.postmessage=function(){return!!e.postMessage},j.websqldatabase=function(){return!!e.openDatabase},j.indexedDB=function(){return!!l("indexedDB",e)},j.hashchange=function(){return z("hashchange",e)&&(t.documentMode===n||t.documentMode>7)},j.history=function(){return!!e.history&&!!history.pushState},j.draganddrop=function(){var e=t.createElement("div");return"draggable"in e||"ondragstart"in e&&"ondrop"in e},j.websockets=function(){return"WebSocket"in e||"MozWebSocket"in e},j.rgba=function(){return r("background-color:rgba(150,255,150,.5)"),a(b.backgroundColor,"rgba")},j.hsla=function(){return r("background-color:hsla(120,40%,100%,.5)"),a(b.backgroundColor,"rgba")||a(b.backgroundColor,"hsla")},j.multiplebgs=function(){return r("background:url(https://),url(https://),red url(https://)"),/(url\s*\(.*?){3}/.test(b.background)},j.backgroundsize=function(){return l("backgroundSize")},j.borderimage=function(){return l("borderImage")},j.borderradius=function(){return l("borderRadius")},j.boxshadow=function(){return l("boxShadow")},j.textshadow=function(){return""===t.createElement("div").style.textShadow},j.opacity=function(){return o("opacity:.55"),/^0.55$/.test(b.opacity)},j.cssanimations=function(){return l("animationName")},j.csscolumns=function(){return l("columnCount")},j.cssgradients=function(){var e="background-image:",t="gradient(linear,left top,right bottom,from(#9f9),to(white));",n="linear-gradient(left top,#9f9, white);";return r((e+"-webkit- ".split(" ").join(t+e)+C.join(n+e)).slice(0,-e.length)),a(b.backgroundImage,"gradient")},j.cssreflections=function(){return l("boxReflect")},j.csstransforms=function(){return!!l("transform")},j.csstransforms3d=function(){var e=!!l("perspective");return e&&"webkitPerspective"in g.style&&A("@media (transform-3d),(-webkit-transform-3d){#modernizr{left:9px;position:absolute;height:3px;}}",function(t){e=9===t.offsetLeft&&3===t.offsetHeight}),e},j.csstransitions=function(){return l("transition")},j.fontface=function(){var e;return A('@font-face {font-family:"font";src:url("https://")}',function(n,r){var o=t.getElementById("smodernizr"),i=o.sheet||o.styleSheet,a=i?i.cssRules&&i.cssRules[0]?i.cssRules[0].cssText:i.cssText||"":"";e=/src/i.test(a)&&0===a.indexOf(r.split(" ")[0])}),e},j.generatedcontent=function(){var e;return A(["#",v,"{font:0/0 a}#",v,':after{content:"',x,'";visibility:hidden;font:3px/1 a}'].join(""),function(t){e=t.offsetHeight>=3}),e},j.video=function(){var e=t.createElement("video"),n=!1;try{(n=!!e.canPlayType)&&(n=new Boolean(n),n.ogg=e.canPlayType('video/ogg; codecs="theora"').replace(/^no$/,""),n.h264=e.canPlayType('video/mp4; codecs="avc1.42E01E"').replace(/^no$/,""),n.webm=e.canPlayType('video/webm; codecs="vp8, vorbis"').replace(/^no$/,""))}catch(r){}return n},j.audio=function(){var e=t.createElement("audio"),n=!1;try{(n=!!e.canPlayType)&&(n=new Boolean(n),n.ogg=e.canPlayType('audio/ogg; codecs="vorbis"').replace(/^no$/,""),n.mp3=e.canPlayType("audio/mpeg;").replace(/^no$/,""),n.wav=e.canPlayType('audio/wav; codecs="1"').replace(/^no$/,""),n.m4a=(e.canPlayType("audio/x-m4a;")||e.canPlayType("audio/aac;")).replace(/^no$/,""))}catch(r){}return n},j.localstorage=function(){try{return localStorage.setItem(v,v),localStorage.removeItem(v),!0}catch(e){return!1}},j.sessionstorage=function(){try{return sessionStorage.setItem(v,v),sessionStorage.removeItem(v),!0}catch(e){return!1}},j.webworkers=function(){return!!e.Worker},j.applicationcache=function(){return!!e.applicationCache},j.svg=function(){return!!t.createElementNS&&!!t.createElementNS(T.svg,"svg").createSVGRect},j.inlinesvg=function(){var e=t.createElement("div");return e.innerHTML="<svg/>",(e.firstChild&&e.firstChild.namespaceURI)==T.svg},j.smil=function(){return!!t.createElementNS&&/SVGAnimate/.test(w.call(t.createElementNS(T.svg,"animate")))},j.svgclippaths=function(){return!!t.createElementNS&&/SVGClipPath/.test(w.call(t.createElementNS(T.svg,"clipPath")))};for(var R in j)f(j,R)&&(d=R.toLowerCase(),m[d]=j[R](),P.push((m[d]?"":"no-")+d));return m.input||u(),m.addTest=function(e,t){if("object"==typeof e)for(var r in e)f(e,r)&&m.addTest(r,e[r]);else{if(e=e.toLowerCase(),m[e]!==n)return m;t="function"==typeof t?t():t,"undefined"!=typeof h&&h&&(g.className+=" "+(t?"":"no-")+e),m[e]=t}return m},r(""),y=E=null,function(e,t){function n(e,t){var n=e.createElement("p"),r=e.getElementsByTagName("head")[0]||e.documentElement;return n.innerHTML="x<style>"+t+"</style>",r.insertBefore(n.lastChild,r.firstChild)}function r(){var e=v.elements;return"string"==typeof e?e.split(" "):e}function o(e){var t=g[e[m]];return t||(t={},h++,e[m]=h,g[h]=t),t}function i(e,n,r){if(n||(n=t),u)return n.createElement(e);r||(r=o(n));var i;return i=r.cache[e]?r.cache[e].cloneNode():p.test(e)?(r.cache[e]=r.createElem(e)).cloneNode():r.createElem(e),i.canHaveChildren&&!f.test(e)?r.frag.appendChild(i):i}function a(e,n){if(e||(e=t),u)return e.createDocumentFragment();n=n||o(e);for(var i=n.frag.cloneNode(),a=0,s=r(),c=s.length;c>a;a++)i.createElement(s[a]);return i}function s(e,t){t.cache||(t.cache={},t.createElem=e.createElement,t.createFrag=e.createDocumentFragment,t.frag=t.createFrag()),e.createElement=function(n){return v.shivMethods?i(n,e,t):t.createElem(n)},e.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+r().join().replace(/\w+/g,function(e){return t.createElem(e),t.frag.createElement(e),'c("'+e+'")'})+");return n}")(v,t.frag)}function c(e){e||(e=t);var r=o(e);return v.shivCSS&&!l&&!r.hasCSS&&(r.hasCSS=!!n(e,"article,aside,figcaption,figure,footer,header,hgroup,nav,section{display:block}mark{background:#FF0;color:#000}")),u||s(e,r),e}var l,u,d=e.html5||{},f=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,p=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,m="_html5shiv",h=0,g={};!function(){try{var e=t.createElement("a");e.innerHTML="<xyz></xyz>",l="hidden"in e,u=1==e.childNodes.length||function(){t.createElement("a");var e=t.createDocumentFragment();return"undefined"==typeof e.cloneNode||"undefined"==typeof e.createDocumentFragment||"undefined"==typeof e.createElement}()}catch(n){l=!0,u=!0}}();var v={elements:d.elements||"abbr article aside audio bdi canvas data datalist details figcaption figure footer header hgroup mark meter nav output progress section summary time video",shivCSS:d.shivCSS!==!1,supportsUnknownElements:u,shivMethods:d.shivMethods!==!1,type:"default",shivDocument:c,createElement:i,createDocumentFragment:a};e.html5=v,c(t)}(this,t),m._version=p,m._prefixes=C,m._domPrefixes=k,m._cssomPrefixes=$,m.mq=O,m.hasEvent=z,m.testProp=function(e){return s([e])},m.testAllProps=l,m.testStyles=A,m.prefixed=function(e,t,n){return t?l(e,t,n):l(e,"pfx")},g.className=g.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(h?" js "+P.join(" "):""),m}(this,this.document),function(e,t,n){function r(e){return"[object Function]"==g.call(e)}function o(e){return"string"==typeof e}function i(){}function a(e){return!e||"loaded"==e||"complete"==e||"uninitialized"==e}function s(){var e=v.shift();y=1,e?e.t?m(function(){("c"==e.t?f.injectCss:f.injectJs)(e.s,0,e.a,e.x,e.e,1)},0):(e(),s()):y=0}function c(e,n,r,o,i,c,l){function u(t){if(!p&&a(d.readyState)&&(b.r=p=1,!y&&s(),d.onload=d.onreadystatechange=null,t)){"img"!=e&&m(function(){x.removeChild(d)},50);for(var r in k[n])k[n].hasOwnProperty(r)&&k[n][r].onload()}}var l=l||f.errorTimeout,d=t.createElement(e),p=0,g=0,b={t:r,s:n,e:i,a:c,x:l};1===k[n]&&(g=1,k[n]=[]),"object"==e?d.data=n:(d.src=n,d.type=e),d.width=d.height="0",d.onerror=d.onload=d.onreadystatechange=function(){u.call(this,g)},v.splice(o,0,b),"img"!=e&&(g||2===k[n]?(x.insertBefore(d,E?null:h),m(u,l)):k[n].push(d))}function l(e,t,n,r,i){return y=0,t=t||"j",o(e)?c("c"==t?C:w,e,t,this.i++,n,r,i):(v.splice(this.i++,0,e),1==v.length&&s()),this}function u(){var e=f;return e.loader={load:l,i:0},e}var d,f,p=t.documentElement,m=e.setTimeout,h=t.getElementsByTagName("script")[0],g={}.toString,v=[],y=0,b="MozAppearance"in p.style,E=b&&!!t.createRange().compareNode,x=E?p:h.parentNode,p=e.opera&&"[object Opera]"==g.call(e.opera),p=!!t.attachEvent&&!p,w=b?"object":p?"script":"img",C=p?"script":w,S=Array.isArray||function(e){return"[object Array]"==g.call(e)},$=[],k={},T={timeout:function(e,t){return t.length&&(e.timeout=t[0]),e}};f=function(e){function t(e){var t,n,r,e=e.split("!"),o=$.length,i=e.pop(),a=e.length,i={url:i,origUrl:i,prefixes:e};for(n=0;a>n;n++)r=e[n].split("="),(t=T[r.shift()])&&(i=t(i,r));for(n=0;o>n;n++)i=$[n](i);return i}function a(e,o,i,a,s){var c=t(e),l=c.autoCallback;c.url.split(".").pop().split("?").shift(),c.bypass||(o&&(o=r(o)?o:o[e]||o[a]||o[e.split("/").pop().split("?")[0]]),c.instead?c.instead(e,o,i,a,s):(k[c.url]?c.noexec=!0:k[c.url]=1,i.load(c.url,c.forceCSS||!c.forceJS&&"css"==c.url.split(".").pop().split("?").shift()?"c":n,c.noexec,c.attrs,c.timeout),(r(o)||r(l))&&i.load(function(){u(),o&&o(c.origUrl,s,a),l&&l(c.origUrl,s,a),k[c.url]=2})))}function s(e,t){function n(e,n){if(e){if(o(e))n||(d=function(){var e=[].slice.call(arguments);f.apply(this,e),p()}),a(e,d,t,0,l);else if(Object(e)===e)for(c in s=function(){var t,n=0;for(t in e)e.hasOwnProperty(t)&&n++;return n}(),e)e.hasOwnProperty(c)&&(!n&&!--s&&(r(d)?d=function(){var e=[].slice.call(arguments);f.apply(this,e),p()}:d[c]=function(e){return function(){var t=[].slice.call(arguments);e&&e.apply(this,t),p()}}(f[c])),a(e[c],d,t,c,l))}else!n&&p()}var s,c,l=!!e.test,u=e.load||e.both,d=e.callback||i,f=d,p=e.complete||i;n(l?e.yep:e.nope,!!u),u&&n(u)}var c,l,d=this.yepnope.loader;if(o(e))a(e,0,d,0);else if(S(e))for(c=0;c<e.length;c++)l=e[c],o(l)?a(l,0,d,0):S(l)?f(l):Object(l)===l&&s(l,d);else Object(e)===e&&s(e,d)},f.addPrefix=function(e,t){T[e]=t},f.addFilter=function(e){$.push(e)},f.errorTimeout=1e4,null==t.readyState&&t.addEventListener&&(t.readyState="loading",t.addEventListener("DOMContentLoaded",d=function(){t.removeEventListener("DOMContentLoaded",d,0),t.readyState="complete"},0)),e.yepnope=u(),e.yepnope.executeStack=s,e.yepnope.injectJs=function(e,n,r,o,c,l){var u,d,p=t.createElement("script"),o=o||f.errorTimeout;p.src=e;for(d in r)p.setAttribute(d,r[d]);n=l?s:n||i,p.onreadystatechange=p.onload=function(){!u&&a(p.readyState)&&(u=1,n(),p.onload=p.onreadystatechange=null)},m(function(){u||(u=1,n(1))},o),c?p.onload():h.parentNode.insertBefore(p,h)},e.yepnope.injectCss=function(e,n,r,o,a,c){var l,o=t.createElement("link"),n=c?s:n||i;o.href=e,o.rel="stylesheet",o.type="text/css";for(l in r)o.setAttribute(l,r[l]);a||(h.parentNode.insertBefore(o,h),m(n,0))}}(this,document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))},/*! matchMedia() polyfill - Test a CSS media type/query in JS. Authors & copyright (c) 2012: Scott Jehl, Paul Irish, Nicholas Zakas. Dual MIT/BSD license */
window.matchMedia=window.matchMedia||function(e){var t,n=e.documentElement,r=n.firstElementChild||n.firstChild,o=e.createElement("body"),i=e.createElement("div");return i.id="mq-test-1",i.style.cssText="position:absolute;top:-100em",o.style.background="none",o.appendChild(i),function(e){return i.innerHTML='&shy;<style media="'+e+'"> #mq-test-1 { width: 42px; }</style>',n.insertBefore(o,r),t=42==i.offsetWidth,n.removeChild(o),{matches:t,media:e}}}(document),function(e){function t(){E(!0)}if(e.respond={},respond.update=function(){},respond.mediaQueriesSupported=e.matchMedia&&e.matchMedia("only all").matches,!respond.mediaQueriesSupported){var n,r,o,i=e.document,a=i.documentElement,s=[],c=[],l=[],u={},d=30,f=i.getElementsByTagName("head")[0]||a,p=i.getElementsByTagName("base")[0],m=f.getElementsByTagName("link"),h=[],g=function(){for(var t,n,r,o,i=m,a=i.length,s=0;a>s;s++)t=i[s],n=t.href,r=t.media,o=t.rel&&"stylesheet"===t.rel.toLowerCase(),n&&o&&!u[n]&&(t.styleSheet&&t.styleSheet.rawCssText?(y(t.styleSheet.rawCssText,n,r),u[n]=!0):(!/^([a-zA-Z:]*\/\/)/.test(n)&&!p||n.replace(RegExp.$1,"").split("/")[0]===e.location.host)&&h.push({href:n,media:r}));v()},v=function(){if(h.length){var e=h.shift();x(e.href,function(t){y(t,e.href,e.media),u[e.href]=!0,v()})}},y=function(e,t,n){var r,o,i,a,l,u=e.match(/@media[^\{]+\{([^\{\}]*\{[^\}\{]*\})+/gi),d=u&&u.length||0,t=t.substring(0,t.lastIndexOf("/")),f=function(e){return e.replace(/(url\()['"]?([^\/\)'"][^:\)'"]+)['"]?(\))/g,"$1"+t+"$2$3")},p=!d&&n,m=0;for(t.length&&(t+="/"),p&&(d=1);d>m;m++)for(r=0,p?(o=n,c.push(f(e))):(o=u[m].match(/@media *([^\{]+)\{([\S\s]+?)$/)&&RegExp.$1,c.push(RegExp.$2&&f(RegExp.$2))),a=o.split(","),l=a.length;l>r;r++)i=a[r],s.push({media:i.split("(")[0].match(/(only\s+)?([a-zA-Z]+)\s?/)&&RegExp.$2||"all",rules:c.length-1,hasquery:i.indexOf("(")>-1,minw:i.match(/\(min\-width:[\s]*([\s]*[0-9\.]+)(px|em)[\s]*\)/)&&parseFloat(RegExp.$1)+(RegExp.$2||""),maxw:i.match(/\(max\-width:[\s]*([\s]*[0-9\.]+)(px|em)[\s]*\)/)&&parseFloat(RegExp.$1)+(RegExp.$2||"")});E()},b=function(){var e,t=i.createElement("div"),n=i.body,r=!1;return t.style.cssText="position:absolute;font-size:1em;width:1em",n||(n=r=i.createElement("body"),n.style.background="none"),n.appendChild(t),a.insertBefore(n,a.firstChild),e=t.offsetWidth,r?a.removeChild(n):n.removeChild(t),e=o=parseFloat(e)},E=function(e){var t="clientWidth",u=a[t],p="CSS1Compat"===i.compatMode&&u||i.body[t]||u,h={},g=m[m.length-1],v=(new Date).getTime();if(e&&n&&d>v-n)return clearTimeout(r),r=setTimeout(E,d),void 0;n=v;for(var y in s){var x=s[y],w=x.minw,C=x.maxw,S=null===w,$=null===C,k="em";w&&(w=parseFloat(w)*(w.indexOf(k)>-1?o||b():1)),C&&(C=parseFloat(C)*(C.indexOf(k)>-1?o||b():1)),x.hasquery&&(S&&$||!(S||p>=w)||!($||C>=p))||(h[x.media]||(h[x.media]=[]),h[x.media].push(c[x.rules]))}for(var y in l)l[y]&&l[y].parentNode===f&&f.removeChild(l[y]);for(var y in h){var T=i.createElement("style"),j=h[y].join("\n");T.type="text/css",T.media=y,f.insertBefore(T,g.nextSibling),T.styleSheet?T.styleSheet.cssText=j:T.appendChild(i.createTextNode(j)),l.push(T)}},x=function(e,t){var n=w();n&&(n.open("GET",e,!0),n.onreadystatechange=function(){4!=n.readyState||200!=n.status&&304!=n.status||t(n.responseText)},4!=n.readyState&&n.send(null))},w=function(){var e=!1;try{e=new XMLHttpRequest}catch(t){e=new ActiveXObject("Microsoft.XMLHTTP")}return function(){return e}}();g(),respond.update=g,e.addEventListener?e.addEventListener("resize",t,!1):e.attachEvent&&e.attachEvent("onresize",t)}}(this);
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="author" content="songjinzhong,songjz.ecnu@gmail.com">
    <title>404</title>
    <!-- 记住把下面的 homePageName、homePageUrl 改成你想需要的内容 -->
    <script type="text/javascript" src="#" homePageName="返回主页" homePageUrl="/" charset="utf-8"></script>
    <script type="text/javascript" src="https://qzone.qq.com/gy/404/data.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://qzone.qq.com/gy/404/page.js" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="https://qzone.qq.com/gy/404/style/404style.css">
    <script src="https://qzonestyle.gtimg.cn/ac/qzfl/stat.js"></script>
    <script type="text/javascript">
        ! function() {
            function a(a, b) {
                return (/string|function/.test(typeof b) ? h : g)(a, b)
            }
            function b(a, c) {
                return "string" != typeof a && (c = typeof a, "number" === c ? a += "" : a = "function" === c ? b(a.call(a)) : ""), a
            }
            function c(a) {
                return l[a]
            }
            function d(a) {
                return b(a).replace(/&(?![\w#]+;)|[<>"']/g, c)
            }
            function e(a, b) {
                if (m(a))
                    for (var c = 0, d = a.length; d > c; c++) b.call(a, a[c], c, a);
                else
                    for (c in a) b.call(a, a[c], c)
            }
            function f(a, b) {
                var c = /(\/)[^/]+\1\.\.\1/,
                    d = ("./" + a).replace(/[^/]+$/, ""),
                    e = d + b;
                for (e = e.replace(/\/\.\//g, "/"); e.match(c);) e =
                    e.replace(c, "/");
                return e
            }
            function g(b, c) {
                var d = a.get(b) || i({
                    filename: b,
                    name: "Render Error",
                    message: "Template not found"
                });
                return c ? d(c) : d
            }
            function h(a, b) {
                if ("string" == typeof b) {
                    var c = b;
                    b = function() {
                        return new k(c);
                    }
                }
                var d = j[a] = function(c) {
                    try {
                        return new b(c, a) + ""
                    } catch (d) {
                        return i(d)()
                    }
                };
                return d.prototype = b.prototype = n, d.toString = function() {
                    return b + ""
                }, d
            }
            function i(a) {
                var b = "{Template Error}",
                    c = a.stack || "";
                if (c) c = c.split("\n").slice(0, 2).join("\n");
                else
                    for (var d in a) c += "<" + d + ">\n" + a[d] + "\n\n";
                return function() {
                    return "object" == typeof console && console.error(b + "\n\n" + c), 
                }
            }
            var j = a.cache = {},
                k = this.String,
                l = {
                    "<": "&#60;",
                    ">": "&#62;",
                    '"': "&#34;",
                    "'": "&#39;",
                    "&": "&#38;"
                },
                m = Array.isArray || function(a) {
                    return "[object Array]" === {}.toString.call(a)
                },
                n = a.utils = {
                    $helpers: {},
                    $include: function(a, b, c) {
                        return a = f(c, a), g(a, b)
                    },
                    $string: b,
                    $escape: d,
                    $each: e
                },
                o = a.helpers = n.$helpers;
            a.get = function(a) {
                    return j[a.replace(/^\.\//, "")]
                }, a.helper = function(a, b) {
                    o[a] = b
                }, "function" == typeof define ? define(function() {
                    return a
                }) :
                "undefined" != typeof exports ? module.exports = a : this.template = a, a("body", function(a) {
                    var b = this,
                        c = (b.$helpers, b.$escape),
                        d = "/",
                        e = "返回主页",
                        f = a.topid,
                        g = a.topimg,
                        h = a.topname,
                        i = a.topgender,
                        j = a.topbirth,
                        l = a.toplostdate,
                        m = a.toplostplace,
                        n = a.toplostdesc,
                        o = a.toplink,
                        p = b.$each,
                        q = a.otherdata,
                        r = (a.otheritem, a.index, "");
                    var scs = document.getElementsByTagName("script");
                    for (var i = 0; i < scs.length; i++)
                    if (scs[i].src.indexOf("/404/search_children.js") > -1) {
                        if (scs[i].getAttribute("homePageUrl")) d = scs[i].getAttribute("homePageUrl");
                        if (scs[i].getAttribute("homePageName")) e = scs[i].getAttribute("homePageName");
                        break;
                    }
                    return r p(q, function(a) {
                            r += ' <li class="', r += c(f == a._id ? "current" : ""), r += '"><a href="javascript:;" onclick="toThis(\'', r += c(a._id), r += '\');" title="', r += c(a.name), r += '" ><img src="', r += c(a.child_pic), r += '"></a></li> '
                        }), r += " </ul> </div> </div> </div> </div>", new k(r)
                })
        }();
    </script>

    
  </head>
  <body>
    <!--body is here
        当 IE 认为这个404页面是不友好的，就不会跳转，所有下面的 404 默认提示
    -->
<h1 style="font-size:30px;">
error!
</h1>
  </body>
</html>
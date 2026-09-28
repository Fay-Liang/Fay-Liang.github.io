/* ============================================================
   右上角按钮的提示文字 —— 覆盖 Material 的默认翻译
   ------------------------------------------------------------
   repo_url 已改为 GitHub 个人主页，但 Material 中文翻译里
   "source" 固定是「前往仓库」，该值由功能语义决定、不随链接变化。

   为何不用主题覆盖：其语言文件 partials/languages/zh.html 是
   单个 {% macro t(key) %} 包一个字典字面量、内部没有任何
   {% block %}，官方推荐的 {% extends %}+{% block source %}
   写法在此不适用，整份复制又会随 Material 升级而缺键。

   用 document$ 订阅而非 DOMContentLoaded：本站在 mkdocs.yml 中
   开启了 navigation.instant，切换页面是无刷新替换内容，
   DOMContentLoaded 不会再次触发。
   ============================================================ */
(function () {
  var TITLE = "前往主页";

  function apply() {
    document.querySelectorAll(".md-source").forEach(function (el) {
      el.title = TITLE;
    });
  }

  if (typeof document$ !== "undefined" && document$.subscribe) {
    document$.subscribe(apply);              // Material 每次导航后触发
  } else if (document.readyState !== "loading") {
    apply();                                 // 脚本在 DOM 就绪后才执行
  } else {
    document.addEventListener("DOMContentLoaded", apply);
  }
})();

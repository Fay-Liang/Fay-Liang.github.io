/* ============================================================
   MathJax 配置 —— 配合 pymdownx.arithmatex (generic: true)
   必须作为 extra_javascript 的第一个条目加载，
   随后再加载 MathJax CDN 脚本。
   ============================================================ */
window.MathJax = {
  tex: {
    inlineMath: [["\\(", "\\)"]],       // 行内公式 \(...\)
    displayMath: [["\\[", "\\]"]],      // 独立公式 \[...\]
    processEscapes: true,
    processEnvironments: true
  },
  options: {
    ignoreHtmlClass: ".*|",
    processHtmlClass: "arithmatex"
  }
};
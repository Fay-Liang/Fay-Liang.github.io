---
title: 常见问题
---

# 常见问题

## 代码块不高亮

启用 `pymdownx.highlight` 与 `pymdownx.superfences`：

```yaml
markdown_extensions:
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.superfences
```

## 中文搜索无效

在 `search` 插件的 `lang` 中加入 `zh`：

```yaml
plugins:
  - search:
      lang:
        - zh
```

## 修改 nav 后页面 404

检查 `nav` 中的路径是否相对 `docs_dir`，并确认文件名与实际一致：

```yaml
nav:
  - 配置说明: user-guide/configuration.md   # 不要写成 /docs/user-guide/...
```

## 深浅色切换无效

`theme.palette` 需配置两套 `scheme` 并都带 `toggle`：

```yaml
theme:
  palette:
    - scheme: default
      toggle:
        icon: material/brightness-7   # 切到深色
    - scheme: slate
      toggle:
        icon: material/brightness-4   # 切到浅色
```

## 构建报 "Config value 'nav': ... not found"

`nav` 中引用的文件不存在或路径写错，修正路径即可。用 `--strict` 构建可提前暴露此类问题。

## 数学公式不渲染

启用 `pymdownx.arithmatex`（`generic: true`）并在 `extra_javascript` 中引入 MathJax：

```yaml
markdown_extensions:
  - pymdownx.arithmatex:
      generic: true

extra_javascript:
  - assets/js/mathjax.js
  - https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js
```

## 部署后样式丢失

检查 `site_url` 是否正确配置为最终地址，或改用相对路径资源。构建后可用 `mkdocs build --strict` 自检。

## 只想本地预览不想部署

直接 `mkdocs serve` 即可，不配置 `repo_url`、`site_url` 也能正常运行。

## 相关页面

- [配置说明](configuration.md) —— `mkdocs.yml` 全量配置项
- [部署指南](deployment.md) —— 多平台部署流程
---
title: 配置说明
---

# 配置说明

`mkdocs.yml` 是 MkDocs 的唯一配置文件，所有站点信息、主题、导航、扩展与行为都在这里声明。

## 站点基础信息

```yaml
site_name: MyProject Docs          # 必填
site_url: https://example.com      # SEO / sitemap 用
site_description: 项目使用与开发文档
site_author: Zhang San
copyright: Copyright © 2026 Zhang San
```

## 仓库与编辑链接

```yaml
repo_url: https://github.com/user/repo
repo_name: user/repo
edit_uri: blob/main/docs/          # 页面上"编辑此页"的跳转路径
```

## 主题配置

```yaml
theme:
  name: material
  language: zh                     # 简体中文界面
  features:
    - navigation.tabs              # 顶级导航标签页
    - navigation.top               # 回到顶部按钮
    - content.code.copy            # 代码块复制按钮
    - search.suggest               # 搜索建议
  palette:
    - scheme: default              # 浅色
      primary: indigo
      toggle:
        icon: material/brightness-7
    - scheme: slate                # 深色
      primary: indigo
      toggle:
        icon: material/brightness-4
```

## 导航配置

`nav` 定义站点导航结构，未配置时按目录自动生成：

```yaml
nav:
  - 首页: index.md
  - 快速开始:
      - 安装: getting-started/installation.md
      - 快速上手: getting-started/quickstart.md
```

要点：

- 每个条目为 `标题: 路径` 键值对，嵌套列表生成多级导航
- 路径相对于 `docs_dir`（默认 `docs/`）
- 所有页面都应出现在 `nav` 中，否则构建会有警告

## Markdown 扩展

本站启用的扩展完整清单见项目根目录 `mkdocs.yml`，常用片段：

```yaml
markdown_extensions:
  - toc:
      permalink: true              # 标题锚点
  - admonition                     # 提示框
  - pymdownx.highlight             # 代码高亮
  - pymdownx.superfences:          # 支持 Mermaid
      custom_fences:
        - name: mermaid
          class: mermaid
          format: !!python/name:pymdownx.superfences.fence_code_format
  - pymdownx.arithmatex            # LaTeX 公式
      generic: true
```

## 插件

声明 `plugins` 后默认的 `search` **不会自动启用**，需显式加入：

```yaml
plugins:
  - search:
      lang:
        - zh                       # 中文分词
  - git-revision-date-localized:
      type: datetime
      locale: zh
  - minify:                        # 压缩产物
      minify_html: true
```

## 构建与校验

```yaml
strict: true                       # 警告即失败（CI 推荐）
validation:
  links:
    not_found: error               # 死链接视为错误
  nav:
    omitted_files: warn            # 未登记到 nav 的文件
```

## 参考

完整示例参见本站仓库根目录的 `mkdocs.yml`，亦可查阅 [MkDocs 官方配置文档](https://www.mkdocs.org/user-guide/configuration/)。
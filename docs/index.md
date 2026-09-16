# MyProject Docs

欢迎来到 **MyProject** 的官方文档。这里汇总了项目的安装、使用、配置与部署方法。

## 快速导航

- [安装](getting-started/installation.md) —— 环境准备与依赖安装
- [快速上手](getting-started/quickstart.md) —— 5 分钟跑通第一个示例
- [配置说明](user-guide/configuration.md) —— 全量配置项详解
- [部署指南](user-guide/deployment.md) —— GitHub Pages / GitLab Pages / 静态托管
- [常见问题](user-guide/faq.md) —— 高频问题速查
- [关于](about.md) —— 项目信息与联系方式

## 特性一览

- 纯 Markdown 写作，一个 `mkdocs.yml` 集中管理全部配置
- 本地实时预览，保存即刷新
- 支持数学公式、Mermaid 图表、代码高亮与复制按钮
- 深浅色主题一键切换，中文搜索开箱即用
- 基于 mike 的多版本文档管理

## 语法速览

本站启用了丰富的 Markdown 扩展，下面快速演示。

### 数学公式

行内公式：$E = mc^2$，独立公式：

$$
\int_{-\infty}^{+\infty} e^{-x^2}\,\mathrm{d}x = \sqrt{\pi}
$$

### Mermaid 图表

```mermaid
graph LR
    A[Markdown] --> B[MkDocs 构建]
    B --> C[静态站点]
    C --> D[GitHub Pages]
```

### 提示框与折叠块

!!! note "提示"
    使用 `admonition` 扩展可以快速插入提示框。

??? tip "点击展开"
    使用 `pymdownx.details` 扩展可以创建可折叠内容块。

### 任务列表

- [x] 安装 MkDocs 与 Material 主题
- [x] 配置 `mkdocs.yml`
- [ ] 部署到 GitHub Pages

!!! warning "注意"
    所有文档页面都应出现在 `nav` 中，否则在 `strict` 模式下构建会失败。

## 版权

Copyright &copy; 2026 MyProject 团队。基于 [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) 构建。
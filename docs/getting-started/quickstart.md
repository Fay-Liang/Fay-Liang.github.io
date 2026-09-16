---
title: 快速上手
---

# 快速上手

本节带你用 5 分钟建起一个带本地预览的文档站点。

## 初始化项目

```bash
mkdocs new my-project
cd my-project
```

生成的项目结构：

```
my-project/
├── mkdocs.yml        # 配置文件（核心）
├── docs/             # 文档源目录
│   └── index.md      # 首页
└── site/             # 构建产物（build 后生成）
```

## 写第一页文档

编辑 `docs/index.md`，替换为你的内容：

```markdown
# 我的项目

欢迎来到我的项目文档。

## 快速开始

- 安装：`pip install my-project`
- 使用：`my-project --help`
```

## 本地预览

```bash
mkdocs serve
```

浏览器打开 [http://127.0.0.1:8000](http://127.0.0.1:8000)，修改 Markdown 文件后页面会自动刷新。

## 构建静态站点

```bash
mkdocs build
```

产物输出到 `site/` 目录，整个目录可直接上传到任意静态托管平台。

## 按主题组织文档

`docs/` 内可按主题分子目录：

```
docs/
├── index.md
├── getting-started/
│   ├── installation.md
│   └── quickstart.md
├── user-guide/
│   ├── configuration.md
│   └── deployment.md
└── assets/           # 图片、CSS、JS 等静态资源
```

不要忘记在 `mkdocs.yml` 的 `nav` 中登记新页面：

```yaml
nav:
  - 首页: index.md
  - 快速上手: getting-started/quickstart.md
```

## 下一步

- 阅读 [配置说明](../user-guide/configuration.md)，完成主题、插件与扩展的完整配置
- 准备好后按 [部署指南](../user-guide/deployment.md) 发布到 GitHub Pages
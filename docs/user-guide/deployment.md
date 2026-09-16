---
title: 部署指南
---

# 部署指南

本站基于 mike 多版本文档方案部署到 GitHub Pages。以下给出完整流程。

## 版本管理（mike）

mike 将各版本构建产物推送到 `gh-pages` 分支，并生成版本选择器。

```bash
# 部署 v1.0 版本并设为默认
mike deploy v1.0 latest --update-aliases
mike set-default latest

# 查看已部署版本
mike list
```

!!! note "多版本与分支"
    `mike deploy` 要求工作区干净且已提交。开发版本（main 分支）建议使用别名 `latest` 指向最新构建。

## GitHub Pages 手动部署

```bash
mkdocs gh-deploy
```

推送完成后在仓库 **Settings → Pages** 中将 Source 设置为 `gh-pages` 分支。

## GitHub Actions 自动部署

本站使用以下工作流，推送 `main` 分支后自动构建并以 mike 部署：

```yaml
# .github/workflows/deploy.yml
name: Deploy MkDocs
on:
  push:
    branches: [main]
permissions:
  contents: write
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0            # mike 需要完整历史
      - uses: actions/setup-python@v5
        with:
          python-version: 3.x
      - run: pip install -r requirements.txt
      - run: |
          git config user.name github-actions[bot]
          git config user.email 41898282+github-actions[bot]@users.noreply.github.com
          mike deploy --push --update-aliases latest
          mike set-default --push latest
```

!!! warning "site_url 必须正确"
    `site_url` 需配置为最终的 GitHub Pages 地址，否则部署后样式与搜索可能失效。

## 其他平台

- **GitLab Pages**：CI 中执行 `pip install -r requirements.txt && mkdocs build`，产物 `site/` 作为 artifacts
- **Read the Docs**：配置 `.readthedocs.yaml`，构建工具选 MkDocs
- **Netlify / Vercel**：Build command 填 `mkdocs build`，输出目录填 `site`
- **任意静态托管**：直接上传 `site/` 目录（Nginx、OSS、CDN 均可）

## 最佳实践

1. CI 中打开 `strict: true`，把链接错误挡在合并前
2. `site/` 加入 `.gitignore`，`docs/` 纳入版本控制
3. 多版本发布用 `mike deploy <版本号>`，保留历史版本
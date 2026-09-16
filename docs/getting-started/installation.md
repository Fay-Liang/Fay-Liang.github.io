---
title: 安装
---

# 安装

本页介绍 MyProject 的安装方法，包括环境要求、虚拟环境与常用插件的安装。

## 环境要求

- Python 3.9 及以上版本
- pip 包管理器

## 安装 MkDocs 核心

```bash
pip install mkdocs
```

## 安装 Material 主题（推荐）

Material for MkDocs 功能最丰富，本站即基于该主题构建：

```bash
pip install mkdocs-material
```

## 安装常用插件

```bash
# Pymdown Extensions —— 扩展 Markdown 语法
pip install pymdown-extensions

# 压缩产出的 HTML / CSS / JS
pip install mkdocs-minify-plugin

# 页面最后修改时间
pip install mkdocs-git-revision-date-localized-plugin

# 多版本文档管理
pip install mike
```

你也可以将全部依赖写入 `requirements.txt` 后一次性安装：

```bash
pip install -r requirements.txt
```

## 使用虚拟环境（建议）

!!! info "建议"
    在虚拟环境中安装，避免污染系统 Python 环境。

=== "Windows (PowerShell)"

    ```bash
    python -m venv venv
    .\venv\Scripts\Activate.ps1
    ```

=== "macOS / Linux"

    ```bash
    python -m venv venv
    source venv/bin/activate
    ```

## 验证安装

```bash
mkdocs --version
```

输出类似 `mkdocs, version 1.6.1` 即表示安装成功。

## 下一步

- 前往 [快速上手](quickstart.md) 创建你的第一个文档站点
- 或直接阅读 [配置说明](../user-guide/configuration.md) 了解 `mkdocs.yml` 全量配置项
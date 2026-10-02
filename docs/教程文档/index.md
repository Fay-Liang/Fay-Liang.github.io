---
title: 教程文档
hide:
  - navigation
  - toc
---

<style>
  .sec-hero { text-align: center; margin: 2rem 0 2.2rem; }
  .sec-hero h1 { font-size: 2.2rem; font-weight: 700; margin: 0; }
  .sec-hero p { font-size: 1.05rem; margin: .6rem 0 0; color: var(--md-default-fg-color--light); }
  .card-list { display: grid; gap: .9rem; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); }
  .card {
    display: block; padding: 1rem 1.2rem; border-radius: 12px;
    background: var(--md-code-bg-color);
    border: 1px solid var(--md-default-fg-color--lightest);
    color: var(--md-default-fg-color); text-decoration: none;
    transition: transform .18s ease, box-shadow .18s ease, border-color .18s ease;
  }
  .card:hover {
    transform: translateY(-2px);
    border-color: var(--md-typeset-a-color);
    box-shadow: 0 6px 18px rgba(0,0,0,.12);
  }
  .card-title { font-weight: 700; font-size: 1.05rem; }
  .card-desc { font-size: .88rem; margin-top: .3rem; color: var(--md-default-fg-color--light); }
</style>

<div class="sec-hero">
  <h1>教程文档</h1>
  <p>工具链、环境配置与踩坑记录</p>
</div>

<div class="card-list">
  <a class="card" href="SDCC使用指南/">
    <div class="card-title">SDCC使用指南</div>
    <div class="card-desc">开源 8051 工具链：安装、编译流程、Makefile 与 VSCode 配置</div>
  </a>
  <a class="card" href="Ubuntu开机亮度无法自动调节/">
    <div class="card-title">Ubuntu 开机亮度无法自动调节</div>
    <div class="card-desc">NVIDIA 独显机型上亮度不复位的排查与 systemd 脚本修复</div>
  </a>
</div>

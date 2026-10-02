---
title: 项目开发
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
  <h1>项目开发</h1>
  <p>从机械结构到软件实现的完整过程</p>
</div>

<div class="card-list">
  <a class="card" href="六足机器人/">
    <div class="card-title">六足机器人</div>
    <div class="card-desc">基于 Linkit 7697 的复刻项目，含机械、电子与软件全流程分析</div>
  </a>
  <a class="card" href="可自主预警的天气小助手/">
    <div class="card-title">可自主预警的天气小助手</div>
    <div class="card-desc">结合嵌入式硬件与天气 API，主动推送预警而非被动查询</div>
  </a>
</div>

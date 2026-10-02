---
title: 学习笔记
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
  <h1>学习笔记</h1>
  <p>嵌入式与底层方向的实践记录</p>
</div>

<div class="card-list">
  <a class="card" href="51单片机/">
    <div class="card-title">51单片机</div>
    <div class="card-desc">STC15 系列快速认知、开发环境搭建与 GPIO 实验</div>
  </a>
  <a class="card" href="STM32/">
    <div class="card-title">STM32</div>
    <div class="card-desc">寄存器级外设笔记：GPIO / 定时器 / 串口 / ADC / DMA / I2C / SPI</div>
  </a>
  <a class="card" href="C++/">
    <div class="card-title">C++</div>
    <div class="card-desc">C ---> C++过渡学习笔记</div>
  </a>
  <a class="card" href="ESP32/">
    <div class="card-title">ESP32</div>
  </a>
  <a class="card" href="Linux/">
    <div class="card-title">Linux</div>
  </a>
</div>

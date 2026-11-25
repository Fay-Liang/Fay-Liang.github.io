---
title: 作品集
hide:
  - navigation
  - toc
---

<style>
  .pf-hero { text-align:center; margin:1.2rem 0 2rem; }
  .pf-hero h1 { font-size:2.4rem; font-weight:800; margin:0; letter-spacing:1px; }
  .pf-hero p { font-size:1.05rem; margin:.7rem 0 0; color:var(--md-default-fg-color--light); }
  .pf-intro {
    background: var(--md-code-bg-color);
    border-radius:14px;
    padding:1.2rem 1.4rem;
    margin-bottom:2rem;
    line-height:1.8;
  }
  .pf-stats {
    display:grid; gap:.9rem;
    grid-template-columns:repeat(auto-fit,minmax(150px,1fr));
    margin-bottom:2rem;
  }
  .pf-stat {
    background:var(--md-code-bg-color);
    border-radius:12px;
    padding:1rem 1.1rem;
    border:1px solid var(--md-default-fg-color--lightest);
  }
  .pf-stat b { display:block; font-size:1.35rem; color:var(--md-primary-fg-color); line-height:1.3; }
  .pf-stat span { font-size:.82rem; color:var(--md-default-fg-color--light); }
  .pf-grid { display:grid; gap:1rem; grid-template-columns:repeat(auto-fit,minmax(300px,1fr)); }
  .pf-card {
    display:block; padding:1.1rem 1.2rem; border-radius:14px;
    background:var(--md-code-bg-color);
    border:1px solid var(--md-default-fg-color--lightest);
    color:var(--md-default-fg-color); text-decoration:none;
    transition:transform .18s ease, box-shadow .18s ease, border-color .18s ease;
  }
  .pf-card:hover {
    transform:translateY(-3px);
    border-color:var(--md-typeset-a-color);
    box-shadow:0 8px 22px rgba(0,0,0,.12);
  }
  .pf-card h3 { margin:0 0 .3rem; font-size:1.06rem; color:var(--md-primary-fg-color); }
  .pf-card p { margin:.2rem 0 .6rem; font-size:.88rem; color:var(--md-default-fg-color--light); line-height:1.65; }
  .pf-tags { display:flex; flex-wrap:wrap; gap:.35rem; }
  .pf-tag {
    font-size:.72rem; padding:.12rem .5rem; border-radius:20px;
    background:var(--md-default-bg-color);
    border:1px solid var(--md-default-fg-color--lightest);
    color:var(--md-default-fg-color--light);
  }
  @media (min-width:900px) {
    .pf-grid { grid-template-columns:repeat(2,1fr); }
  }
  .pf-foot { margin-top:2.4rem; text-align:center; color:var(--md-default-fg-color--light); font-size:.9rem; }
  .pf-foot a { margin:0 .5rem; }
</style>

<div class="pf-hero">
  <h1>作品集</h1>
  <p>嵌入式软硬件 · 从原理图、PCB 到固件与上位机</p>
</div>

<div class="pf-intro">
  这里收录了 4 个完整的嵌入式项目，覆盖 <strong>电机控制、PCB 设计、MCU 固件、上位机与 ROS 2 系统集成</strong>。
  每个项目都独立走完了“设计 → 焊接 → 调试 → 验证”的链路，详情页记录了硬件方案、控制算法、调试过程与可复现的资料。
</div>

<div class="pf-stats">
  <div class="pf-stat"><b>4</b><span>个完整软硬件项目</span></div>
  <div class="pf-stat"><b>6 层</b><span>最高 PCB 层数</span></div>
  <div class="pf-stat"><b>100 Hz</b><span>平衡车控制环频率</span></div>
  <div class="pf-stat"><b>25</b><span>梳理的 ROS 2 功能包</span></div>
</div>

<div class="pf-grid">
  <a class="pf-card" href="FOC控制板/">
    <h3>STM32G431 FOC 六层控制板</h3>
    <p>双路 FOC 控制板：六层 PCB、FD6288 栅极驱动、RS624 电流采样，固件实现 SVPWM / V/f 调制并通过 UART DMA 上传波形。</p>
    <div class="pf-tags">
      <span class="pf-tag">STM32G431</span>
      <span class="pf-tag">FOC / SVPWM</span>
      <span class="pf-tag">六层 PCB</span>
      <span class="pf-tag">C</span>
    </div>
  </a>

  <a class="pf-card" href="STM32两轮平衡车/">
    <h3>STM32 两轮平衡车</h3>
    <p>100 Hz 控制环，MPU6500 + 双路编码器 + TB6612，角度/速度/转向三环 PID，含状态机保护与 Python 串口可视化上位机。</p>
    <div class="pf-tags">
      <span class="pf-tag">STM32F103</span>
      <span class="pf-tag">PID</span>
      <span class="pf-tag">互补滤波</span>
      <span class="pf-tag">状态机</span>
    </div>
  </a>

  <a class="pf-card" href="STM32F407最小系统板/">
    <h3>STM32F407 最小系统板</h3>
    <p>四层板从原理图到焊接点亮，打通 Keil / ARM-GCC 双工具链与 SWD 调试，配套串口环形缓冲区与 Python 上位机。</p>
    <div class="pf-tags">
      <span class="pf-tag">STM32F407</span>
      <span class="pf-tag">四层 PCB</span>
      <span class="pf-tag">OpenOCD</span>
      <span class="pf-tag">Python</span>
    </div>
  </a>

  <a class="pf-card" href="ROS2移动机器人/">
    <h3>ROS 2 移动机器人底盘</h3>
    <p>树莓派 5 + ROS 2 Humble 接入 Orbbec 深度相机与 DRV8323 无刷底盘，完成建图导航验证，梳理 25 个功能包并输出 15 页文档。</p>
    <div class="pf-tags">
      <span class="pf-tag">ROS 2 Humble</span>
      <span class="pf-tag">树莓派 5</span>
      <span class="pf-tag">DRV8323</span>
      <span class="pf-tag">Linux</span>
    </div>
  </a>
</div>

<div class="pf-foot">
  <p>项目图片与演示视频持续补充中。</p>
  <p>
    <a href="https://github.com/Fay-Liang" target="_blank">GitHub</a> ·
    <a href="/邮箱">邮箱</a> ·
    <a href="/关于">关于我</a>
  </p>
</div>

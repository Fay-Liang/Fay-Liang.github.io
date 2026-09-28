---
title: Ubuntu开机亮度无法自动调节解决办法
date: 2026/03/17 18:19:02
---
# **Ubuntu设置开机自动恢复亮度**

适用于 NVIDIA 显卡，如 RTX 4060 Max-Q

> 🎯 **目标：** 每次关机或重启后，屏幕亮度自动恢复为上次手动调整的亮度，而不是默认最大亮度。

## 🧩 一、适用场景与背景

- **系统：** Ubuntu（你使用的是 24.04 Noble，或其他版本也可参考）
- **显卡：** NVIDIA（你使用的是 **RTX 4060 Max-Q / Mobile**，对应的 backlight 接口是 `nvidia_0`）
- **问题：** 每次重启后，屏幕亮度总是恢复为最大（比如 1000），而不是你调整后的舒适亮度（比如 500 或 62）。
- **需求：** 实现 **“系统自动保存你调整后的亮度，并在下次开机时自动恢复”**。

---

## 二、核心思路

为了实现这个功能，我们需要做两件事：

1. **定时（比如每分钟）获取当前亮度并保存到文件**
2. **在每次开机时，从该文件中读取上一次保存的亮度值，并重新设置屏幕亮度**

---

## 🗂 三、文件与脚本规划

| 文件 / 脚本                                        | 作用                                                 |
| -------------------------------------------------- | ---------------------------------------------------- |
| `/var/lib/brightness/last_brightness`            | 用于存储你上一次设置的亮度值（比如 500）             |
| `/usr/local/bin/save_current_brightness.sh`      | 脚本：获取当前亮度并保存到 `last_brightness`       |
| `/usr/local/bin/restore_brightness_on_boot.sh`   | 脚本：从 `last_brightness` 读取并设置亮度          |
| `/etc/systemd/system/save-brightness.service`    | systemd 服务：运行保存亮度的脚本                     |
| `/etc/systemd/system/save-brightness.timer`      | systemd 定时器：每分钟触发一次保存                   |
| `/etc/systemd/system/restore-brightness.service` | systemd 服务：在开机时（显示管理器之后）运行恢复脚本 |

---

## 🛠 四、详细操作步骤

### 步骤 1：创建保存亮度值的目录和文件

打开终端，运行以下命令：

```bash
sudo mkdir -p /var/lib/brightness
sudo touch /var/lib/brightness/last_brightness
sudo chmod 666 /var/lib/brightness/last_brightness
```

> 这个文件将用于存储你上一次设置的亮度值（如 500 或 62）。

---

### 步骤 2：创建 “保存当前亮度” 的脚本

创建脚本文件：

```bash
sudo nano /usr/local/bin/save_current_brightness.sh
```

粘贴以下内容：

```bash
#!/bin/bash

# NVIDIA backlight 接口路径
BACKLIGHT_DIR="/sys/class/backlight/nvidia_0"
BRIGHTNESS_FILE="$BACKLIGHT_DIR/brightness"
SAVE_FILE="/var/lib/brightness/last_brightness"

# 检查 backlight 接口是否存在
if [ ! -f "$BRIGHTNESS_FILE" ]; then
    echo "错误：未找到 NVIDIA backlight 接口：$BRIGHTNESS_FILE"
    exit 1
fi

# 读取当前亮度值
CURRENT_BRIGHTNESS=$(cat "$BRIGHTNESS_FILE")

# 检查是否为数字
if ! [[ "$CURRENT_BRIGHTNESS" =~ ^[0-9]+$ ]]; then
    echo "错误：无法读取有效的亮度值：$CURRENT_BRIGHTNESS"
    exit 1
fi

# 保存亮度值
echo "$CURRENT_BRIGHTNESS" | sudo tee "$SAVE_FILE" > /dev/null

echo "[$(date)] 已保存亮度: $CURRENT_BRIGHTNESS"
```

保存并退出：`Ctrl + O` → 回车 → `Ctrl + X`

赋予执行权限：

```bash
sudo chmod +x /usr/local/bin/save_current_brightness.sh
```

---

### 步骤 3：创建 “开机恢复亮度” 的脚本

创建脚本文件：

```bash
sudo nano /usr/local/bin/restore_brightness_on_boot.sh
```

粘贴以下内容：

```bash
#!/bin/bash

# NVIDIA backlight 接口路径
BACKLIGHT_DIR="/sys/class/backlight/nvidia_0"
BRIGHTNESS_FILE="$BACKLIGHT_DIR/brightness"
SAVE_FILE="/var/lib/brightness/last_brightness"

# 检查 backlight 接口是否存在
if [ ! -f "$BRIGHTNESS_FILE" ]; then
    echo "错误：未找到 NVIDIA backlight 接口：$BRIGHTNESS_FILE"
    exit 1
fi

# 检查保存的亮度文件是否存在
if [ ! -f "$SAVE_FILE" ]; then
    echo "警告：未找到保存的亮度文件：$SAVE_FILE，将不修改亮度"
    exit 0
fi

# 读取保存的亮度值
SAVED_BRIGHTNESS=$(cat "$SAVE_FILE")

# 检查是否为数字
if ! [[ "$SAVED_BRIGHTNESS" =~ ^[0-9]+$ ]]; then
    echo "错误：保存的亮度值不是有效数字：$SAVED_BRIGHTNESS"
    exit 1
fi

# 获取最大亮度
MAX_BRIGHTNESS=$(cat "$BACKLIGHT_DIR/max_brightness")

# 限制亮度不超过最大值
if [ "$SAVED_BRIGHTNESS" -gt "$MAX_BRIGHTNESS" ]; then
    SAVED_BRIGHTNESS=$MAX_BRIGHTNESS
fi

# 设置亮度
echo "$SAVED_BRIGHTNESS" | sudo tee "$BRIGHTNESS_FILE" > /dev/null

echo "[$(date)] 已恢复亮度: $SAVED_BRIGHTNESS (最大: $MAX_BRIGHTNESS)"
```

保存并退出，然后赋予执行权限：

```bash
sudo chmod +x /usr/local/bin/restore_brightness_on_boot.sh
```

---

### 步骤 4：创建 “定时保存亮度” 的 systemd 服务

创建服务文件：

```bash
sudo nano /etc/systemd/system/save-brightness.service
```

粘贴以下内容：

```ini
[Unit]
Description=Save Current Screen Brightness (NVIDIA)

[Service]
Type=oneshot
ExecStart=/usr/local/bin/save_current_brightness.sh
```

保存并退出。

---

### 步骤 5：创建 “定时保存亮度” 的 systemd 定时器

创建定时器文件：

```bash
sudo nano /etc/systemd/system/save-brightness.timer
```

粘贴以下内容：

```ini
[Unit]
Description=Timer to save screen brightness every minute

[Timer]
OnBootSec=1min
OnUnitActiveSec=1min

[Install]
WantedBy=timers.target
```

保存并退出。

启用并启动定时器：

```bash
sudo systemctl daemon-reload
sudo systemctl enable save-brightness.service
sudo systemctl enable save-brightness.timer
sudo systemctl start save-brightness.timer
```

---

### 步骤 6：创建 “开机恢复亮度” 的 systemd 服务（关键！）

创建服务文件：

```bash
sudo nano /etc/systemd/system/restore-brightness.service
```

粘贴以下内容（重要：依赖显示管理器，确保开机时屏幕已初始化）：

```ini
[Unit]
Description=Restore NVIDIA Screen Brightness on Boot (After Display Manager)
After=display-manager.service graphical.target
Requires=display-manager.service

[Service]
Type=oneshot
ExecStart=/usr/local/bin/restore_brightness_on_boot.sh

[Install]
WantedBy=graphical.target
```

保存并退出。

启用该服务：

```bash
sudo systemctl enable restore-brightness.service
```

---

### 步骤 7：重启系统，测试功能

```bash
sudo reboot
```

---

## 🧪 五、测试与验证

### 测试 1：查看保存的亮度值

```bash
cat /var/lib/brightness/last_brightness
```

你应该看到一个数字，比如 `62` 或 `500`，这就是你上次保存的亮度。

### 测试 2：查看当前亮度

```bash
cat /sys/class/backlight/nvidia_0/brightness
```

如果它和你保存的值一致，说明开机恢复成功 ✅

### 测试 3：查看服务日志（可选）

```bash
journalctl -u restore-brightness.service
journalctl -u save-brightness.service
```

查看是否有成功信息，比如：

```
已恢复亮度: 500 (最大: 1000)
已保存亮度: 500
```

---

## 📁 六、文件结构总结

| 路径                                               | 用途                             |
| -------------------------------------------------- | -------------------------------- |
| `/var/lib/brightness/last_brightness`            | 存储你上一次设置的亮度值         |
| `/usr/local/bin/save_current_brightness.sh`      | 每分钟自动保存当前亮度           |
| `/usr/local/bin/restore_brightness_on_boot.sh`   | 开机时恢复亮度                   |
| `/etc/systemd/system/save-brightness.service`    | 定义保存亮度的服务               |
| `/etc/systemd/system/save-brightness.timer`      | 每分钟触发一次保存               |
| `/etc/systemd/system/restore-brightness.service` | 开机时（显示管理器之后）恢复亮度 |

---

## 七、补充说明

| 项目             | 说明                                                                                 |
| ---------------- | ------------------------------------------------------------------------------------ |
| 适用显卡接口     | `nvidia_0`（你的 NVIDIA 显卡接口名）                                               |
| 亮度值含义       | 是写入 `/sys/class/backlight/nvidia_0/brightness` 的实际数值，非百分比             |
| 如何手动调亮度   | 可以运行：`echo 500 \| sudo tee /sys/class/backlight/nvidia_0/brightness`           |
| 如何修改保存频率 | 编辑 `/etc/systemd/system/save-brightness.timer`，比如改为 `OnUnitActiveSec=30s` |

---

## 八、最终效果

| 功能                                        | 是否实现 |
| ------------------------------------------- | -------- |
| 每分钟自动保存当前亮度                      | ✔️     |
| 开机自动恢复上一次的亮度（而不是最大亮度）  | ✔️     |
| 支持 NVIDIA 显卡笔记本（如 RTX 4060 Max-Q） | ✔️     |
| 无需手动操作，全自动化                      | ✔️     |

---

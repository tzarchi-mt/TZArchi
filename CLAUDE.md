# TZARCHI — Website Project Instructions

## 项目概述

**TZ Architecture Pty Ltd** 的官方网站，域名 `www.tzarchi.com.au`。  
单页 HTML 网站，极简深色风格，设计参考 **Minale + Mann**（伦敦建筑事务所）。  
面向高端住宅与商业建筑客户，服务区域：Melbourne, VIC。

---

## 文件结构

```
TZ ARCHI WEB/
├── CLAUDE.md                  ← 本文件
├── index.html                 ← 主页（单页，所有内容在此）
└── Project/
    ├── download_images.sh     ← 一键下载所有项目图片的脚本
    ├── Stott St_Preston/
    │   ├── images/            ← Stott St_Preston_Pic 1~3.jpg
    │   └── README.md
    ├── Orchard House_Eltham/
    │   ├── images/            ← Orchard House_Eltham_Pic 1~2.jpg
    │   └── README.md
    ├── Bona Vista_Bayswater/
    │   ├── images/            ← Bona Vista_Bayswater_Pic 1~5.jpg
    │   └── README.md
    └── Ellingworth_Boxhill/
        ├── images/            ← Ellingworth_Boxhill_Pic 1~2.jpg
        └── README.md
```

> 图片命名规范：`项目名_Pic X.jpg`（例：`Stott St_Preston_Pic 1.jpg`）

---

## 设计规范

### 色彩

| 变量 | 色值 | 用途 |
|---|---|---|
| `--ink` | `#0c0c0c` | 主背景 |
| `--ink-2` | `#161616` | 次背景（About、Contact 区块） |
| `--ink-3` | `#1e1e1e` | 卡片 hover 状态 |
| `--rule` | `#2c2c2c` | 分割线 |
| `--muted` | `#666660` | 次要文字、标签 |
| `--pale` | `#aaaaaa` | 辅助文字 |
| `--white` | `#ffffff` | 主文字 |

> **无强调色（无金色）** — 完全黑白灰单色调，靠留白和字重区分层级。

### 字体

| 字体 | 用途 | 类比 |
|---|---|---|
| **Space Grotesk** 300/400/500 | 主字体（导航、正文、标签） | 接近 Graphik（Minale+Mann 用字）|
| **Cormorant** 300/400 italic | 引言、About pull quote、装饰性斜体 | 衬线对比字体 |

- Google Fonts CDN 加载，需联网
- 字体大小基准：`16px`
- 正文 `font-weight: 300`，标签 `font-weight: 400`，按钮 `font-weight: 500`

### 动效

- 滚动出现：`[data-reveal]` 元素，`opacity 0→1` + `translateY 20px→0`，时长 `0.9s`
- Slideshow：Hero 项目图片自动轮播，间隔 `5.5s`，切换时背景 `scale(1.04→1.0)` 缓动
- Hover：项目图片 `scale(1.04)` + `grayscale(15%→0%)`；项目箭头线条宽度扩展
- Nav：滚动超过 60px 后背景 `rgba(12,12,12,0.94)` + `backdrop-filter: blur(18px)`

---

## 页面模块（按顺序）

### 1. `#hero` — 全幅项目图片轮播
- 全屏高度（`100svh`），背景图自动切换（4个项目）
- 左下角显示当前项目名称 + 类型标签
- 右下角：圆点导航 + 前/后箭头按钮
- JS 变量 `slides[]` 控制文字内容，`.slide-bg` 控制背景图

### 2. Marquee 滚动条
- 服务类型 + 地点信息循环滚动
- 修改：找到 `.marquee-track` 内的 `<span>` 标签

### 3. `#work` — 项目列表
- 交错大图列表（奇数行：图左文右；偶数行：文左图右）
- 每行包含：项目类型标签、项目名、地点、"View Project"箭头链接
- 图片 hover：解除 grayscale，scale 放大
- 添加项目：复制一个 `.project-row` 块，修改图片 src 和文字

### 4. `#about` — 关于事务所
- 左侧：大号衬线体引言（Cormorant italic）
- 右侧：3段正文（直接来自现有网站真实文字）
- 底部：3列原则条目（01/02/03）

### 5. `#services` — 服务项目
- 3列网格，6项服务，编号 01~06
- 无图标，纯文字排版

### 6. `#contact` — 联系方式
- 左侧：联系详情 + 社交媒体
- 右侧：联系表单（`mailto:` 触发邮件客户端）

---

## 真实内容（已填入）

### 联系信息
- **地址**：Suite 103 / 991 Whitehorse Road, Box Hill VIC 3128
- **电话**：0416 517 588
- **邮箱**：info@tzarchi.com.au
- **WeChat**：添加我们的微信
- **社交**：Instagram · Twitter · Pinterest

### CTA 按钮链接
- **Start Your Project** → `https://buildcheck.tzarchi.com.au`（新标签页打开）

### 现有项目（4个）

| 项目名 | 类型 | 地点 | 图片文件夹 |
|---|---|---|---|
| Stott St_Preston | Residential · Townhouse | Preston, VIC | `Project/Stott St_Preston/images/` |
| Orchard House_Eltham | Residential · New Build | Eltham, VIC | `Project/Orchard House_Eltham/images/` |
| Bona Vista_Bayswater | Residential · Landscape | Bayswater, VIC | `Project/Bona Vista_Bayswater/images/` |
| Ellingworth_Boxhill | Commercial · Office Interior | Box Hill, VIC | `Project/Ellingworth_Boxhill/images/` |

> 目前图片仍链接自 Squarespace CDN。将本地图片放入对应 `images/` 文件夹后，  
> 告诉 Claude 文件名，即可替换为本地路径。

---

## 如何让 Claude 更新网站

### 替换项目图片（本地图片就绪后）
> "把 Stott St_Preston 的图片换成本地文件 `Project/Stott St_Preston/images/Stott St_Preston_Pic 1.jpg`"

### 添加新项目
> "新增项目：名称 Duncan Ave_Boronia，类型 Residential，地点 Boronia VIC，图片 `Project/Duncan Ave_Boronia/images/Duncan Ave_Boronia_Pic 1.jpg`"

### 修改联系信息
> "更新电话为 XXXX，地址改为 XXXX"

### 更新 Hero 轮播顺序
> "把 Ellingworth_Boxhill 设为第一张轮播图"

### 修改 About 正文
> "把 About 第二段改为：[新文字]"

### 修改 Start Your Project 链接
> "把 Start Your Project 按钮链接改为 https://xxx"

### 添加新服务项
> "在 Services 里新增第七项：名称 [X]，描述 [X]"

---

## 技术说明

- **纯 HTML/CSS/JS**，零依赖，可直接浏览器打开
- 响应式断点：`1024px`（平板）、`768px`（手机）、`480px`（小屏）
- 联系表单：`mailto:` 方式触发邮件客户端（如需 Formspree 后端提交，告知 Claude）
- 图片：目前热链 Squarespace CDN，建议迁移至本地 `images/` 后更新路径

---

## 部署

上传 `index.html` 至托管服务即可（Netlify / Vercel / cPanel）。  
本地图片就绪后，同时上传 `Project/` 文件夹，并更新 `index.html` 中的图片路径。

---

*Last updated: 2026-05-24 | Design ref: Minale + Mann | Built with Claude Cowork*

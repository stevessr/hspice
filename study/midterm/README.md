# 电子信息与集成电路 · 期中复习讲义

基于**实验一至实验九**与《数字集成电路分析与设计——深亚微米工艺（第三版）》相关章节整理。

> **内容规范：**复习重点为编写者依据课程材料的整理，不代表教师公布的考试范围；原实验材料的数值、单位和网表差异，参见附录 E。教材与实验的原始图表版权仍归各自权利人所有；此仓库仅保存重新组织的学习笔记与自绘示意图。

## 内容导航

- [使用说明](content/00-reading-guide.md)
- [知识结构与复习范围](content/chapters/01-knowledge-map.md)
- [MOS 晶体管的基础与工作状态](content/chapters/02-mos-basics.md)
- [传输特性、器件尺寸与参数提取](content/chapters/03-device-parameters.md)
- [反相器、负载线与噪声容限](content/chapters/04-inverters-noise.md)
- [功耗、动态行为与延迟](content/chapters/05-power-delay.md)
- [CMOS 组合逻辑门](content/chapters/06-combinational-logic.md)
- [SR 锁存器与主从 JK 触发器](content/chapters/07-sequential-logic.md)
- [HSPICE 网表、扫描与结果判读](content/chapters/08-hspice-netlists.md)
- [典型题型与标准作答示例](content/chapters/09-practice.md)

### 附录

- [附录 A · 常用公式速查](content/appendices/a-formula-reference.md)
- [附录 B · 逻辑功能与真值表速查](content/appendices/b-truth-tables.md)
- [附录 C · HSPICE 指令及模板速查](content/appendices/c-hspice-quick-reference.md)
- [附录 D · 九项实验索引与教材定位](content/appendices/d-experiment-index.md)
- [附录 E · 原始资料的差异、错误与核对建议](content/appendices/e-source-discrepancies.md)
- [附录 F · 考试前自查清单](content/appendices/f-checklist.md)

## 目录结构

```text
study/midterm/
├── README.md                    # GitHub 内容入口
├── content/                     # Markdown：唯一手工维护的正文
│   ├── 00-reading-guide.md
│   ├── chapters/                # 九章正文
│   └── appendices/              # 附录 A–F
├── typst/                       # 从 Markdown 生成，可作为排版级二次编辑起点
│   ├── reading-guide.typ
│   ├── sections/
│   └── appendices/
├── assets/figures/              # 矢量图 SVG
├── scripts/sync_typst.py        # Markdown -> Typst
├── main.typ                     # Typst 文档入口
└── Makefile
```

## 来源与适用性

本版本从既有期中复习讲义重新拆分，涵盖实验一至九；仓库中另有实验十 PDF，但由于未收到其对应教学内容，本复习讲义尚未将实验十列为考试范围或生成该实验的知识章节。正文中的图示需参考原讲义 PDF 或实验 PDF；本次转换保留文字、表格、计算及代码，不承诺完全还原原 LaTeX 自绘图。

## 本地构建

依赖 Pandoc ≥ 3.1、Typst ≥ 0.14 及中文字体（建议 Noto CJK）：

```bash
cd study/midterm
python3 scripts/sync_typst.py   # 改动 Markdown 后同步 Typst
mkdir -p build
typst compile main.typ build/midterm-review.pdf
```

也可以运行 `make all`。若只阅读源码，GitHub 直接预览 `content/` 中的 Markdown 即可，不需要安装 Typst。

**编辑约定：**优先改 `content/`，同步后生成 `typst/`。如需仅针对出版版式微调 Typst，请单独维护 patch 或在 `main.typ` 修改样式，避免同步覆盖。`assets/` 中的图片由两种格式共用。

## 内容检验

- Markdown 各章节为独立文件，公式使用 `$...$` 和 `$$...$$`，真值表使用 GFM 表格。
- Typst 生成文件添加 GENERATED 标记，确保单一事实来源。
- 图片使用相对路径；GitHub Actions 可在提交后构建 PDF 并上传 artifact。
- 具体 HSPICE 网表是否能运行，取决于工艺模型库与 HSPICE 安装环境；文中示例不是硅片工艺参数校准报告。

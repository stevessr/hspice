# 电子信息与集成电路 · 期中复习资料

依据实验一至实验九及既有课程复习提纲组织。**自编题目不代表正式考试原题**，计算值须区分理想近似与工艺库仿真。

## 在线阅读

- **VitePress 网站：** https://stevessr.github.io/hspice/
- **系统复习：** https://stevessr.github.io/hspice/content/00-reading-guide
- **实践题库（五大主题，题解分离）：** https://stevessr.github.io/hspice/content/practice/
- **PDF 内嵌阅读器：** https://stevessr.github.io/hspice/pdf
- **PDF 直链：** https://stevessr.github.io/hspice/midterm-review.pdf
- **图解索引：** https://stevessr.github.io/hspice/figures
- **在线自测：** https://stevessr.github.io/hspice/quiz

## 目录及单一内容来源

```text
study/midterm/
├── index.md                 # VitePress 首页
├── pdf.md                   # PDF 在线查看 / 切换实验资料
├── figures.md               # 电路图解索引
├── quiz.md                  # 14 道自测题与答案解析
├── .vitepress/
│   ├── config.mts           # 导航、侧栏、搜索、/hspice/ base
│   └── theme/               # 响应式排版增强
├── content/
│   ├── 00-reading-guide.md
│   ├── chapters/            # 九章理论
│   ├── appendices/          # 六项附录
│   └── practice/            # 五组专题练习 + answers/ 五份解析
├── typst/                   # 从 Markdown 自动生成
├── main.typ                 # PDF 排版入口
├── public/                  # 构建时生成的 PDF（不入库）
├── scripts/
│   ├── sync_typst.py
│   └── validate.py
├── package.json             # VitePress
└── Makefile
```

## 本地构建

依赖：Python 3、Pandoc ≥ 3.1、Typst ≥ 0.14、Node.js 22、Noto CJK 字体，以及 `rsvg-convert`（由 `librsvg2-bin` 提供，用于打印版 PNG 图示）。

```bash
cd study/midterm
python3 scripts/validate.py
python3 scripts/rasterize_svg.py
python3 scripts/sync_typst.py
python3 scripts/validate.py --generated
mkdir -p build

python3 -m pip install 'pypdf>=5,<7'
python3 scripts/build_pdf.py
mkdir -p public/experiments
cp build/midterm-review.pdf public/midterm-review.pdf
# 从仓库根目录复制原始实验 PDF：
cp ../../实验*.pdf public/experiments/

npm install
npm run docs:build
npm run docs:preview
```

本地开发：`npm run docs:dev`；注意构建前必须确保 `public/` 已放入 PDF，否则仅有网页无法展示 PDF。发布地址使用 `base: '/hspice/'`，防止 GitHub Pages 子路径造成静态资源 404。

## GitHub Actions：网站与 PDF 分离

- [`study-pages.yml`](../../.github/workflows/study-pages.yml)：**独立 VitePress 网站构建与 GitHub Pages 部署**。只使用 Node.js，不安装 Pandoc、Typst。缓存 npm 下载目录及 `node_modules`，缓存键包含 `package.json` 的哈希。
- [`study-typst.yml`](../../.github/workflows/study-typst.yml)：**独立 Typst PDF 生成**。根据 Markdown、Typst 入口、转换脚本及 SVG 的内容哈希缓存已编译 PDF，并缓存 Typst 资源；每次成功后上传 `hspice-midterm-review` artifact。
- 网站构建会**尽力获取最近一次成功生成的 PDF artifact**；PDF 编译失败或超时时仍然可以独立发布 Markdown 章节、实践题和原始实验 PDF。
- PDF 工作流完成且成功后自动触发网站再次部署，更新在线 PDF；在两次构建之间，网站可能暂时提供上一版成功构建的 PDF。
- PR 只验证代码，不发布 GitHub Pages。两个工作流拥有独立的并发组与超时控制。

Pages 的部署源需要在 **Settings → Pages → Build and deployment → Source** 中选择 **GitHub Actions**。在线预览地址仍为 https://stevessr.github.io/hspice/pdf 。

**维护原则：**手工只编辑 `content/` 的 Markdown；`typst/` 为可重复生成的镜像；网站直接渲染原始 Markdown，不维护第二套正文。原始实验 PDF 不在构建中修改。


## 分章 PDF 构建及质量检查

从 `main.typ` 中按原顺序读取 26 个 Typst 模块，逐章独立编译并由 pypdf 合并为 `build/midterm-review.pdf`。这种方式可防止跨章节分页布局使整个编译进程长期停滞。输出中保留 PDF 书签索引；各章节在 Typst 生成阶段独立分页，因此其页码属于分章页码，不能当作整册连续页码引用。

每章设置编译超时。构建时将教学 SVG 在 `assets/figures/` 中转换为**最大宽度约 1200 像素的 PNG 中间文件**供 Typst 排版，VitePress 仍使用原始 SVG。若插图仍导致某一章节无法编译，工作流会明确警告，并且只对该章节退回“请参阅在线 Markdown 版”的文字提示。

网站通过 `study-pages.yml` 单独构建并发布，PDF 失败不阻断 Markdown 文档站。VitePress 的 MathJax 渲染与插图存在性由 Actions 自动检查。

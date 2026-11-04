# 电子信息与集成电路 · 期中复习资料

依据实验一至实验九及既有课程复习提纲组织。**自编题目不代表正式考试原题**，计算值须区分理想近似与工艺库仿真。

## 在线阅读

- **VitePress 网站：** https://stevessr.github.io/hspice/
- **系统复习：** https://stevessr.github.io/hspice/content/00-reading-guide
- **实践题库（五大主题，题解分离）：** https://stevessr.github.io/hspice/content/practice/
- **PDF 内嵌阅读器：** https://stevessr.github.io/hspice/pdf
- **PDF 直链：** https://stevessr.github.io/hspice/midterm-review.pdf

## 目录及单一内容来源

```text
study/midterm/
├── index.md                 # VitePress 首页
├── pdf.md                   # PDF 在线查看 / 切换实验资料
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

依赖：Python 3、Pandoc ≥ 3.1、Typst ≥ 0.14、Node.js 22、Noto CJK 字体。

```bash
cd study/midterm
python3 scripts/validate.py
python3 scripts/sync_typst.py
python3 scripts/validate.py --generated
mkdir -p build

typst compile main.typ build/midterm-review.pdf
mkdir -p public/experiments
cp build/midterm-review.pdf public/midterm-review.pdf
# 从仓库根目录复制原始实验 PDF：
cp ../../实验*.pdf public/experiments/

npm install
npm run docs:build
npm run docs:preview
```

本地开发：`npm run docs:dev`；注意构建前必须确保 `public/` 已放入 PDF，否则仅有网页无法展示 PDF。发布地址使用 `base: '/hspice/'`，防止 GitHub Pages 子路径造成静态资源 404。

## GitHub Actions

`.github/workflows/study-typst.yml` 在 `main` 推送后自动执行：

1. 验证 Markdown 章节、练习及链接，重新生成 Typst。
2. 编译包含实践题及答案的完整 PDF，上传 PDF artifact。
3. 将完整复习 PDF 和实验一至十原始 PDF 放到 VitePress 的 `public/`。
4. 构建 VitePress 网站，校验页面链接，上传站点 artifact。
5. 由 `actions/deploy-pages` 发布静态站点；PR 仅构建，不部署。

仓库必须在 **Settings → Pages → Build and deployment → Source** 中启用 **GitHub Actions**，并允许 Pages 工作流部署。只有 Actions 的构建与部署任务均成功，才表示发布完成。

**维护原则：**手工只编辑 `content/` 的 Markdown；`typst/` 为可重复生成的镜像；网站直接渲染原始 Markdown，不维护第二套正文。原始实验 PDF 不在构建中修改。

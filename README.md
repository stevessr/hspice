# HSPICE 课程实验与复习资料

本仓库保留**实验一至实验十**的原始 PDF，并在 `study/midterm/` 提供 Markdown + Typst 结构化复习资料和 VitePress 网站。

- **VitePress 在线站点：** https://stevessr.github.io/hspice/
- **在线阅读课程章节：** https://stevessr.github.io/hspice/content/00-reading-guide
- **实践题库与参考答案：** https://stevessr.github.io/hspice/content/practice/
- **PDF 在线预览（含实验资料）：** https://stevessr.github.io/hspice/pdf
- [源代码、排版说明与构建方法](study/midterm/README.md)

网站使用现有 Markdown 作为唯一手工维护的内容源，VitePress 网站与 Typst PDF 采用**独立的 GitHub Actions 工作流**：网站可不依赖 PDF 编译直接部署；PDF 构建使用内容哈希缓存，成功后自动触发网站更新在线预览，Node 依赖也单独缓存。

课程范围由学习者自行核对；实验十已纳入 PDF 资源阅读列表，但未因文件存在而自动推定属于期中考试范围。

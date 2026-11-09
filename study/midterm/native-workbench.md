# 教材 Typst 在线校对与验收工作台

这里统一了原来的 **445 页验收矩阵**、**本地校对工作台** 和 **Typst 精修网页版预览**。打开即按原 PDF 页码载入仓库发布的 Typst 源码、静态 HTML 和等原纸尺寸 SVG；可以直接修改源码并在浏览器里调用 Typst WebAssembly 预览当前修改，无需先下载 445 页工程 ZIP。

<script setup lang="ts">
import NativeReview from './.vitepress/theme/NativeReview.vue'
</script>

<NativeReview />

## 审校与发布方式

工作台使用正式的 native-fidelity.json 八项校验以及原扫描与源码哈希、审校人、时间和对照记录作为验收证据。**机器 OCR、自动编译、浏览器内初检都不能自动提高整页 1:1 验收数。** 页面读取 GitHub Pages 发布的可编辑原生 Typst；本地修改仅保存在当前浏览器，下载 Typst 文件或 JSON 补丁，再经 GitHub PR 审核与 Actions 重新构建发布。

“已发布 HTML/SVG”显示仓库当前编译结果；“编译当前修改并预览”尝试在浏览器加载 Typst WASM，重建当前改动的 SVG。含外部字体、图片或尚未公开依赖的页面可能无法直接 WASM 编译，页面会显示具体错误，已发布的预览不受影响。可选导入本地扫描图 ZIP 做左右校对，**扫描图不会上传到网站**。

[单独打开可检索的全书 Typst HTML 阅读器](/native-typst) · [查看仓库源码](https://github.com/stevessr/hspice/tree/main/fullbook/native)

# 教材图例速查：电路图、器件结构、版图与波形

从《数字集成电路分析与设计——深亚微米工艺（第三版）》的现有**可编辑 Typst 重排稿**中，按原图编号、中文图名、章节和页码建立可筛选的图录。

- **直接查图号**：输入“图 2.14”“图 6.13”“图 10.7”等，也支持图名关键词。
- **按章节和类型筛选**：MOS、CMOS、SRAM、逻辑门、时钟、电源、互连等。
- **查看图片**：每项展示其所在**整页 Typst SVG 预览**，可打开更清晰的大图。
- **返回教材**：同时显示教材印刷页及用户上传的 445 页 PDF 对应页序，点击可进入该页的 Typst 在线校对工作台。
- **图注全文检索**：另提供[自动生成的完整图号文字索引](/reference/figures-catalog)，供 VitePress 全站搜索使用。

<script setup lang="ts">
import FigureReference from '../.vitepress/theme/FigureReference.vue'
</script>

<FigureReference />

## 原图与重排图的区别

目录依托仓库已有的图注和扫描导向的重排材料。**缩略图不等于教材的原始图像**：不少晶体管图、互连示意、工艺剖面和曲线仍是可编辑概念图，部分显微照片仅保留占位及授权说明。页面中同时提供 Typst 源码，以便进一步校对和修改。

- **页码规则**：印刷第 *n* 页对应扫描 PDF 第 *n+19* 页。
- **式子与图片联合查找**：可配合[第 1—6 章公式索引](/reference/formula-index)、[第 7—11 章公式索引](/reference/formula-index-systems)检索同页公式和对应电路图。
- **维护方式**：GitHub Actions 每次构建时从 \`fullbook/native/web/*-page-*.typ\` 重新抽取明确的图注；图号、图名或页码修改后重新部署，图录即可随之更新。

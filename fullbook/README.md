# 《数字集成电路分析与设计——深亚微米工艺（第三版）》445 页 Typst 视觉复刻工程

原始资料为 **445 页扫描 PDF，无可提取文字层**。本项目的 `main.typ` 逐页使用 Typst 图片排版再现全部扫描页；`generate_typst.py` 生成 23 个分块源码，`build.py` 调用 Typst 生成完整 445 页 PDF。

**边界：这是完整视觉复刻，不是全文可编辑的 Typst 录入。** 原书中的文字、数学公式、表格和电路图仍是页面图像。真正的可编辑重排需要逐页转录、重画并核验；仓库既有的九章精编也不等于全书转录。

## 使用

所需软件：Python 3、Typst 0.14+、Poppler `pdfimages`/`pdfinfo`，以及 `pypdf`、`Pillow`。

```bash
cd fullbook
python3 -m pip install -r requirements.txt
python3 extract_pages.py '/path/to/合法持有的教材扫描文件.pdf'
python3 generate_typst.py
python3 validate.py
python3 build.py
```

输出 `build/digital-ic-book-445pages-typst.pdf`，包含 445 页及章级书签。原始尺寸 **506.8346 × 729.6 pt**，页图尺寸 **2112 × 3040 px**。九章的原扫描 PDF 章首页依次为：20、47、87、127、167、208、254、292、322。

**版权与资源：** 公开仓库只存放可重复构建的源码与脚本；`pages/`、教材原件和生成的整书 PDF 被忽略，不会自动发布到 GitHub Pages。请使用自己合法持有的原始 PDF 在本地生成，未经授权不要公开分发整本扫描教材。完整的附图源码包已在本次对话内提供。

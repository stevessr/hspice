# 扫描教材全书 → 原生 Typst 工作流

用户本地执行，扫描 PDF 与全文 OCR 结果均不向公开仓库上传。

依赖：Python 3.11+、Tesseract（chi_sim 和 eng）、Typst 0.14+、Noto Serif CJK SC，以及 requirements-scan.txt 指定的 Python 包。

操作：安装依赖，然后运行：

    python3 -m pip install -r fullbook/native/tools/requirements-scan.txt
    python3 fullbook/native/tools/scan_to_native.py --pdf /path/to/book.pdf --output /tmp/book-native --pages 445 --workers 3 --archive /tmp/book-native.zip
    python3 fullbook/native/tools/audit_ocr_text.py /tmp/book-native
    typst compile /tmp/book-native/main.typ /tmp/book-draft.pdf

ZIP 可导入 VitePress /native-workbench 逐页对照原扫描、原 OCR 和可编辑源码。
每个原扫描页会有独立 editable_pages/page-NNN.typ，保留原 PDF 尺寸，并为后续原生公式和表格替换留出位置。源扫描仅用于本地视觉比对，绝不作为 Typst 文字正文。

重要：全书 445 页 OCR 草稿不等于完成 445 页 1:1 版式复刻。OCR 对公式上下标、单位、脚注、图形与表格存在明显缺陷，正文高度还会溢出。只有逐页复核全文、公式、表格、图元、页码与版式才能标记验收。当前 1:1 整页通过 0/445。

GitHub Actions 的 scan-native 只使用临时合成的 2 页模拟扫描件做测试，并不读取或发布教材原文。

# 1:1 视觉差异检查（本地、无需 PDF）

对照用户私有的教材扫描页与由**可编辑 Typst 源文件**编译出的 SVG，生成并排图、半透明叠图、差异热图及 SSIM／墨迹重合率。不会上传或公开原书扫描图。

```bash
python3 -m pip install -r fullbook/native/tools/requirements-visual.txt
python3 fullbook/native/tools/visual_diff.py \
  --scan '/path/to/preview_scans/page-026.jpg' \
  --typst-svg '/path/to/page-1.svg' \
  --output './visual-review/page-026'
```

**不应只根据 SSIM 或 IoU 宣称复刻成功：**扫描噪声、字体描边、灰度、光学畸变与数字化重排会影响分数。即使页面像素高度相似，公式或电路图也可能是不具备可编辑结构的图片；仍必须通过 `fidelity_gate.py` 六项逐页验收。

本工具仅产生用户本地输出。公开网站只托管原创 Typst 源及编译 SVG，不上传教材整页扫描图。

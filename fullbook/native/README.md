# 全书原生 Typst 重排工作区

**状态：没有完成 445 页原生转写。**

原教材为 445 页扫描 PDF，且没有可靠文字层。图像版的 `fullbook/main.typ` 是视觉复刻，原书文字和公式不可编辑，**不计入原生重排进度**。

本目录用于真正可编辑的内容：每一页的文字应录入 Typst 段落，数学表达式应使用 Typst math，表格应使用 `table`，电路图应由可编辑的 Typst 图形元素或源代码构成。照片等原本就是位图的资料可以保留独立图片素材，但不能让整页扫描图冒充原生文本。

- `template.typ`：无原书摘录的排版与公式/表格示例。
- `figures/nmos.typ`：原生 Typst 元器件结构示意图范例。
- `page-status.json`：对应原书 PDF 的 445 个扫描页编号及其转录状态。
- `validate.py`：状态检查（使用 `--require-complete` 才会严格要求全文完成）。

原书可编辑转写的局部稿由本次对话以独立文件包提供，**未将原书正文批量上传 Public 仓库**。仓库中的测试模板是原创演示内容，不表示已经转录教材。

## 编译

```bash
cd fullbook/native
typst compile template.typ /tmp/native-typst-smoke.pdf
python3 validate.py
python3 validate.py --require-complete  # 未完成 445 页时将失败
```

## 编辑完成的判定

必须满足：445 页全覆盖、逐字对照原扫描页、公式由 Typst 数学语法表示、表格及逻辑图形为可编辑源码、图号和交叉引用正确、编译输出能按页校对。自动 OCR 生成的未经检查文字不可标记为 `verified`。

来源：用户上传的《数字集成电路分析与设计——深亚微米工艺（第三版）》445 页扫描件。

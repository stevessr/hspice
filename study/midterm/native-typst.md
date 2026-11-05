# 原生 Typst 精修 · 网页预览

这里直接显示 **Typst 源码编译的 HTML**，不依赖 PDF，也不使用整页扫描图充当正文。每节都可以在浏览器中阅读并打开对应的可编辑源文件。以下仍是按原扫描校对的知识选段，不是整本教材的逐字全文重排。

<script setup lang="ts">
import { computed, ref } from 'vue'
import { withBase } from 'vitepress'

const sections = [
  { id: '01-gates-noise-delay', title: '第1章 · 逻辑门、噪声容限、延迟与功耗', pages: '扫描第26—32页', summary: '门电路、理想与实际电平、转换时间、式（1.2）—（1.5）' },
  { id: '02-mos-threshold', title: '第2章 · MOS结构、费米势和阈值', pages: '扫描第48—57页', summary: '四端器件、平带电压、耗尽区、体效应、式（2.1）—（2.12）' }
]
const selected = ref(sections[0].id)
const active = computed(() => sections.find(x => x.id === selected.value)!)
const htmlUrl = computed(() => withBase('/native-typst/' + active.value.id + '.html'))
const sourceUrl = computed(() => withBase('/native-typst/' + active.value.id + '.typ'))
</script>

<div class="native-review">
  <div class="native-review-nav" role="group" aria-label="选择校对章节">
    <button v-for="item in sections" :key="item.id" type="button"
      :class="{ selected: selected === item.id }" :aria-pressed="selected === item.id"
      @click="selected = item.id">{{ item.title }}</button>
  </div>
  <div class="native-review-summary">
    <strong>{{ active.title }}</strong>
    <span>{{ active.pages }} · {{ active.summary }}</span>
    <div class="native-review-links">
      <a :href="htmlUrl" target="_blank" rel="noopener noreferrer">独立网页阅读</a>
      <a :href="sourceUrl" target="_blank" rel="noopener noreferrer">查看可编辑 Typst 源码</a>
    </div>
  </div>
  <iframe :key="active.id" class="native-review-frame" :src="htmlUrl"
    :title="'原生 Typst HTML：' + active.title" loading="lazy"></iframe>
</div>

## 本轮校对记录

| 原书 PDF 页码 | 已核对的核心项目 | 未完成的部分 |
| --- | --- | --- |
| 26—27 | 三输入 NAND/NOR、D 触发器、理想与实际逻辑门 | 图 1.4—1.6 尚待忠实矢量重绘 |
| 28 | 噪声容限 $NMH=V_{OH}-V_{IH}$、$NML=V_{IL}-V_{OL}$ | 图 1.7 曲线的完整图形 |
| 29—30 | 10%—90% 转换时间与 50% 传播延迟的区别 | 图 1.8 的全部波形标注、图 1.9 散点 |
| 31—32 | 功耗式（1.2）—（1.5）、MOS 开关基本结构 | 图 1.10 的精确几何及脚注 |
| 48—53 | NMOS/PMOS 四端、费米势、氧化层电容 | 图 2.1—2.5 的逐线重绘 |
| 54—57 | 平带电压、耗尽层、阈值与体效应式（2.6）—（2.12） | 例 2.2 全部中间数值、能带图 |

**两个容易被 OCR 改坏的地方：**教材式（1.5）采用转换频率 $f$，原式没有额外写出活动因子 $\alpha$；MOS 阈值的耗尽电荷需先统一 p 型衬底的负电荷符号，再解释阈值关系，不能沿用乱码识别结果。

## 状态边界

本轮已对上述 **17 个源扫描页**的关键公式和术语进行人工复核，精修内容属于选段与释义；这些页面仍未全部完成逐字、逐图、逐脚注验收。**445 页教材的整页最终验收仍为 0 页。**

此网页与现有 [系统复习](/content/00-reading-guide)、[教材精编](/textbook) 和 [原 PDF 资料库](/pdf) 互不覆盖。以后修改对应 Typst 源码，GitHub Actions 会重新生成 HTML 并更新本页，不需要制作 PDF。

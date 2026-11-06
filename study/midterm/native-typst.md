# 原生 Typst 精修 · 网页预览

这里直接显示 **Typst 源码编译的 HTML**，不依赖 PDF，也不使用整页扫描图充当正文。每节都可以在浏览器中阅读并打开对应的可编辑源文件。以下仍是按原扫描校对的知识选段，不是整本教材的逐字全文重排。

<script setup lang="ts">
import { computed, ref } from 'vue'
import { withBase } from 'vitepress'

const sections = [
  { id: '01-gates-noise-delay', title: '第1章 · 逻辑门、噪声容限、延迟与功耗', pages: '扫描第26—32页', summary: '门电路、理想与实际电平、转换时间、式（1.2）—（1.5）' },
  { id: '02-mos-threshold', title: '第2章 · MOS结构、费米势和阈值', pages: '扫描第48—57页', summary: '四端器件、平带电压、耗尽区、体效应、式（2.1）—（2.12）' },
  { id: '03-page-026', title: '原书第26页 · 门电路与D触发器原生重绘', pages: 'PDF第26页/印刷第7页', summary: '图1.4、图1.5与8行DFF激励表的原生Typst草稿；版式仍需比对' },
  { id: '04-page-027', title: '原书第27页 · 理想逻辑电路与传输曲线', pages: 'PDF第27页/印刷第8页', summary: '图1.6原生可编辑曲线、五条数字逻辑基本特性；仍需版式对照' },
  { id: '05-page-028', title: '原书第28页 · 逻辑振幅与噪声容限', pages: 'PDF第28页/印刷第9页', summary: '原生重绘图1.7(a)—(d)，VTC、噪声容限及四个图示' },
  { id: '06-page-029', title: '原书第29页 · 瞬态转换及延迟', pages: 'PDF第29页/印刷第10页', summary: '原生重绘图1.8(a)波形、10/50/90%阈值、传播延迟' },
  { id: '07-page-030', title: '原书第30页 · 理想瞬态与功耗统计', pages: 'PDF第30页/印刷第11页', summary: '图1.8(b)原生波形；图1.9历史散点仍待逐点重画' },
  { id: '08-page-031', title: '原书第31页 · 功耗公式与设计权衡', pages: 'PDF第31页/印刷第12页', summary: '式(1.2)—(1.5)的可编辑 Typst 数学表达和设计概念' },
  { id: '09-page-032', title: '原书第32页 · NMOS器件结构', pages: 'PDF第32页/印刷第13页', summary: '图1.10原生栅、氧化层、源漏、p型衬底截面' },
  { id: '10-page-033', title: '原书第33页 · CMOS与NMOS反相器', pages: 'PDF第33页/印刷第14页', summary: '图1.11互补反相器、电路状态及静态功耗' },
  { id: '11-page-034', title: '原书第34页 · NMOS负载与互连', pages: 'PDF第34页/印刷第15页', summary: '图1.12可编辑电阻负载反相器、深亚微米互连' },
  { id: '12-page-035', title: '原书第35页 · 互连电阻与耦合', pages: 'PDF第35页/印刷第16页', summary: '图1.13–1.15，RC/IR和耦合原生图' },
  { id: '13-page-036', title: '原书第36页 · 时钟树与偏斜', pages: 'PDF第36页/印刷第17页', summary: '图1.16时钟树拓扑，原书照片仍待重排' },
  { id: '14-page-037', title: '原书第37页 · 串扰与分布RLC', pages: 'PDF第37页/印刷第18页', summary: '图1.17–1.19，耦合及分布RLC可编辑' },
  { id: '15-page-038', title: '原书第38页 · CAD物理设计流程', pages: 'PDF第38页/印刷第19页', summary: '图1.20设计流程拓扑示意' },
  { id: '16-page-039', title: '原书第39页 · SPICE电路分析', pages: 'PDF第39页/印刷第20页', summary: '1.5.1节SPICE与电路验证概念' },
  { id: '17-page-040', title: '原书第40页 · ITRS工艺路线图', pages: 'PDF第40页/印刷第21页', summary: '表1.2已逐格核对，共9行6列' },
  { id: '18-page-041', title: '原书第41页 · 电压、功耗与电流趋势', pages: 'PDF第41页/印刷第22页', summary: '图1.21供电电压与功耗历史趋势' },
  { id: '19-page-042', title: '原书第42页 · ITRS设计生产力与SoC', pages: 'PDF第42页/印刷第23页', summary: '图1.22设计生产力差距、图1.23 IP复用' },
  { id: '20-page-043', title: '原书第43页 · SoC实例、章节小结', pages: 'PDF第43页/印刷第24页', summary: '图1.24 SoC功能分区、1.7小结、1.8参考' },
  { id: '21-page-044', title: '原书第44页 · 习题P1.1—P1.7与半加器', pages: 'PDF第44页/印刷第25页', summary: 'P1.4 半加器真值表、P1.1—P1.7概览' },
  { id: '22-page-045', title: '原书第45页 · 反相器、RC延迟与开关', pages: 'PDF第45页/印刷第26页', summary: 'P1.7五级反相器和P1.8/P1.9 RC电路' },
  { id: '23-page-046', title: '原书第46页 · 习题P1.10—P1.12', pages: 'PDF第46页/印刷第27页', summary: '工艺倍增、处理器代际与电容充电题解' },
  { id: '24-page-047', title: '原书第47页 · MOS晶体管章节提要', pages: 'PDF第47页/印刷第28页', summary: '第2章11节索引与器件模型' },
  { id: '25-page-048', title: '原书第48页 · MOS器件及四端结构', pages: 'PDF第48页/印刷第29页', summary: '2.1—2.2 MOS四端器件对照' },
  { id: '26-page-049', title: '原书第49页 · NMOS结构与沟道', pages: 'PDF第49页/印刷第30页', summary: '图2.1 NMOS可编辑横截面' },
  { id: '27-page-050', title: '原书第50页 · PMOS剖面与阈值', pages: 'PDF第50页/印刷第31页', summary: '图2.2 PMOS器件和阈值极性' },
  { id: '28-page-051', title: '原书第51页 · CMOS阱与隔离结构', pages: 'PDF第51页/印刷第32页', summary: '图2.3 CMOS阱与STI隔离' },
  { id: '29-page-052', title: '原书第52页 · 能带与载流子平衡', pages: 'PDF第52页/印刷第33页', summary: '图2.4能带、质量作用定律及费米势' }
]
const selected = ref(sections[0].id)
const active = computed(() => sections.find(x => x.id === selected.value)!)
const htmlUrl = computed(() => withBase('/native-typst/' + active.value.id + '.html'))
const sourceUrl = computed(() => active.value.id.includes('-page-') ? 'https://github.com/stevessr/hspice/blob/main/fullbook/native/web/' + active.value.id + '.typ' : withBase('/native-typst/' + active.value.id + '.typ'))
const visualMode = ref(false)
const canShowVisual = computed(() => active.value.id.includes('-page-'))
const layoutUrl = computed(() => withBase('/native-typst/' + active.value.id + '-layout.svg'))
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
  <div v-if="canShowVisual" class="native-review-nav" role="group" aria-label="预览模式">
    <button type="button" :aria-pressed="!visualMode" :class="{ selected: !visualMode }"
      @click="visualMode = false">语义 HTML · 可检索</button>
    <button type="button" :aria-pressed="visualMode" :class="{ selected: visualMode }"
      @click="visualMode = true">固定页尺寸 SVG · 视觉比对</button>
    <a :href="layoutUrl" target="_blank" rel="noopener noreferrer">单独打开整页 SVG</a>
  </div>
  <iframe v-if="!visualMode || !canShowVisual" :key="active.id" class="native-review-frame" :src="htmlUrl"
    :title="'原生 Typst HTML：' + active.title" loading="lazy"></iframe>
  <div v-else class="native-review-layout">
    <p>原 PDF 页面尺寸 506.8346 × 729.6 pt。此图由 Typst 源码排版导出，不是原扫描图，也尚未通过 1:1 几何验收。</p>
    <img :src="layoutUrl" alt="原书该页可编辑 Typst 固定尺寸 SVG 预览，待版式精校" />
  </div>
</div>

此处展示的 **SVG 是版式重排的视觉预览**，公式、文字及图元仍在 Typst 中编辑；与原扫描逐元素比较仍是下一步验收工作。

## 第2章前六页：PDF 第47—52页

新增原生 MOS 横截面与 CMOS 阱结构，覆盖第2章章节提要、2.1绪论、2.2 MOS结构、2.3阈值电压开头；器件物理公式采用Typst math，图2.1—2.4均有可编辑简化图元。当前连续选段为 **PDF 第26—52页，共27页**，仍不是任何一页的完整1:1验收。

## 第1章末尾：PDF 第42—46页

新增原生可编辑的图1.22、图1.23、SoC功能分区示意、半加器P1.4真值表、五级反相器链和RC充电图。对应的数字实例包括 **12.5 kΩ × 100 fF = 1.25 ns**、**25 fF 电容在30 ps升高0.6 V需要0.5 mA**；题解属于学习补充，原书并未给出对应答案。第1章连续可编辑选段扩展为 PDF 第26—46页，共21页，原纸版式和全部原图仍未完成1:1验收。

## 上轮精修：PDF 第35—41页

新增七个 Typst 原生选段及独立的 HTML、SVG。图1.14—1.16、1.18—1.21具备原生可编辑拓扑或趋势示意；表1.2的历史 ITRS 预测值9行6列已对照源扫描重建。图1.13与1.17是扫描照片及分布图，不以虚构矢量代替原图。仍未完成逐字、逐元素、逐页的 1:1 排版验收。

## 前轮新增第30—34页

新增图1.8(b)的原生瞬态波形、式(1.2)—(1.5)完整数学表达、图1.10 MOS横截面、图1.11 CMOS反相器和图1.12 NMOS电阻负载反相器。**图1.9已从原扫描追踪出126个候选点位，重绘为可编辑 Typst 点阵；类别、坐标、重叠点仍需人工校验，不作为定量数据使用。** 所有新增页均可在网页切换至可编辑文字 HTML 或固定页尺寸 SVG，仍须进行1:1验收。

## 本轮校对记录

| 原书 PDF 页码 | 已核对的核心项目 | 未完成的部分 |
| --- | --- | --- |
| 26 | 门电路、MUX、DFF原生Typst曲线与图元、8行激励表已重排 | 图1.4/1.5几何与页面布局仍需逐元素核验 |
| 28 | 图1.7四幅电平抽象与VTC曲线、噪声容限公式的原生Typst文字和图形 | 坐标比例、图注位置、逐行分页未完成1:1验收 |
| 29 | 图1.8(a)输入输出瞬态波形和传播延迟定义的原生Typst表达 | 曲线时刻、图1.8(b)续图及版式未完成1:1验收 |
| 27 | 理想与实际逻辑门、图1.6的可编辑电路和阶跃传输曲线、五条特性已重排 | 图1.6的几何与页面分页仍需逐元素验收 |
| 28 | 噪声容限 $NMH=V_{OH}-V_{IH}$、$NML=V_{IL}-V_{OL}$ | 图 1.7 曲线的完整图形 |
| 29—30 | 10%—90% 转换时间与 50% 传播延迟的区别 | 图 1.8 的全部波形标注、图 1.9 散点 |
| 31—32 | 功耗式（1.2）—（1.5）、MOS 开关基本结构 | 图 1.10 的精确几何及脚注 |
| 48—53 | NMOS/PMOS 四端、费米势、氧化层电容 | 图 2.1—2.5 的逐线重绘 |
| 54—57 | 平带电压、耗尽层、阈值与体效应式（2.6）—（2.12） | 例 2.2 全部中间数值、能带图 |

**两个容易被 OCR 改坏的地方：**教材式（1.5）采用转换频率 $f$，原式没有额外写出活动因子 $\alpha$；MOS 阈值的耗尽电荷需先统一 p 型衬底的负电荷符号，再解释阈值关系，不能沿用乱码识别结果。

## 状态边界

本轮已对上述 **17 个源扫描页**的关键公式和术语进行人工复核，精修内容属于选段与释义；这些页面仍未全部完成逐字、逐图、逐脚注验收。**445 页教材的整页最终验收仍为 0 页。**

此网页与现有 [系统复习](/content/00-reading-guide)、[教材精编](/textbook) 和 [原 PDF 资料库](/pdf) 互不覆盖。以后修改对应 Typst 源码，GitHub Actions 会重新生成 HTML 并更新本页，不需要制作 PDF。

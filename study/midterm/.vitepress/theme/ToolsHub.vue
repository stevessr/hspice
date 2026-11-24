<script setup lang="ts">
import { withBase } from 'vitepress'

const groups = [
  {
    title: '交互学习与仿真',
    description: '完成练习、观察电路行为；实验指导与浏览器模拟器分开标明。',
    tools: [
      { title: '在线自测', href: '/quiz', label: '即时评分',
        description: '概念题作答、查看解析与重新测试。' },
      { title: '电路交互实验', href: '/review-1to4/online-lab', label: '浏览器运行',
        description: '调节 RC、MOS 与 CMOS 参数，观察模型曲线和响应。' },
      { title: 'HSPICE 仿真指导', href: '/review-1to4/simulations', label: '实验讲义',
        description: '六组仿真任务、网表与操作步骤；实际仿真依赖本地 HSPICE。' }
    ]
  },
  {
    title: '在线阅读与资料预览',
    description: '把分章 PDF 和 Typst 网页阅览统一放在一个入口。',
    tools: [
      { title: 'PDF 资料库', href: '/pdf', label: '在线阅读',
        description: '检索教材精编、章节和实验 PDF，并在浏览器内预览。' },
      { title: 'Typst 原生网页阅读器', href: '/native-typst', label: '445 页索引',
        description: '浏览原生 Typst 重排后的网页和页面预览，支持全文查找。' }
    ]
  },
  {
    title: '教材整理与校对',
    description: '用于编辑、对照与检查教材重排；不必挤在首页或顶栏。',
    tools: [
      { title: 'Typst 逐页校对工作台', href: '/native-workbench', label: '编辑与核对',
        description: '按 PDF 页序定位，查看源码与页面布局，在浏览器中编辑并导出补丁。' },
      { title: '重排质量验收', href: '/fidelity', label: '进度检查',
        description: '查看逐页质量状态，区分机器转写、可预览与严格 1:1 验收。' }
    ]
  }
]
</script>

<template>
  <div class="learning-tool-hub">
    <section v-for="group in groups" :key="group.title" class="tool-group">
      <div class="tool-group-header">
        <h2>{{ group.title }}</h2>
        <p>{{ group.description }}</p>
      </div>
      <div class="tool-grid">
        <a v-for="tool in group.tools" :key="tool.href" :href="withBase(tool.href)" class="tool-card">
          <span class="tool-category">{{ tool.label }}</span>
          <span class="tool-title">{{ tool.title }} <span aria-hidden="true">↗</span></span>
          <span class="tool-description">{{ tool.description }}</span>
        </a>
      </div>
    </section>
  </div>
</template>

<style scoped>
.learning-tool-hub { margin: 1.25rem 0 2.5rem; }
.tool-group { margin: 2.1rem 0 2.4rem; }
.tool-group-header h2 { margin: 0 0 .45rem; padding: 0; border: 0; font-size: 1.3rem; }
.tool-group-header p { margin: 0 0 1rem; color: var(--vp-c-text-2); font-size: .91rem; }
.tool-grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: .85rem; }
.tool-card {
  display: flex; flex-direction: column; align-items: flex-start; gap: .48rem;
  min-height: 156px; padding: 1.08rem 1.2rem; border: 1px solid var(--vp-c-divider);
  border-radius: 12px; background: var(--vp-c-bg-soft); color: var(--vp-c-text-1);
  text-decoration: none; transition: border-color .15s ease, background .15s ease;
}
.tool-card:hover { border-color: var(--vp-c-brand-1); background: var(--vp-c-bg-elv); }
.tool-card:focus-visible { outline: 2px solid var(--vp-c-brand-1); outline-offset: 2px; }
.tool-category { font-size: .77rem; color: var(--vp-c-text-2); }
.tool-title { display: flex; width: 100%; justify-content: space-between; gap: .5rem;
  font-weight: 650; font-size: 1.03rem; line-height: 1.4; }
.tool-title > span { font-weight: 400; color: var(--vp-c-brand-1); }
.tool-description { color: var(--vp-c-text-2); font-size: .86rem; line-height: 1.7; }
@media (max-width: 690px) { .tool-grid { grid-template-columns: 1fr; }
  .tool-card { min-height: 130px; } }
@media (prefers-reduced-motion: reduce) { .tool-card { transition: none; } }
</style>

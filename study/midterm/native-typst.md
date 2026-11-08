# 数字集成电路教材 · 原生 Typst 逐页预览

本页直接打开 Typst 源码构建的可检索 HTML，或切换到对应原纸尺寸的 SVG 预览。每一页都有可下载和修改的 `.typ` 源码。页面转换是可编辑的，但**源码存在不意味着准确复刻原扫描**。

<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue'
import { withBase } from 'vitepress'

type Item = {
  id: string
  title: string
  source_pdf_pages: number[]
  html: string
  typst: string
  status: string
}
const items = ref<Item[]>([])
const loading = ref(true)
const error = ref('')
const current = ref('')
const jump = ref(1)
const search = ref('')
const view = ref<'html'|'svg'>('html')
const filter = ref<'all'|'editorial'|'ocr'>('all')
const selected = computed(() => items.value.find(v => v.id === current.value))
const page = computed(() => selected.value?.source_pdf_pages?.[0] ?? 1)
const isPage = computed(() => selected.value?.source_pdf_pages?.length === 1)
const isOcr = (item: Item) => item.status?.startsWith('machine OCR')
const statusText = (item: Item) => isOcr(item)
  ? '机器 OCR · 未逐字、逐公式或逐图校对'
  : item.source_pdf_pages.length === 1
  ? '人工辅助编辑选段 · 严格 1:1 未验收'
  : '跨页学习选段'
const pageItems = computed(() => items.value.filter(v => v.source_pdf_pages?.length === 1))
const ocrCount = computed(() => pageItems.value.filter(isOcr).length)
const editedCount = computed(() => pageItems.value.length - ocrCount.value)
const matching = computed(() => {
  const s = search.value.trim().toLowerCase()
  return items.value.filter(v => {
    if (filter.value === 'editorial' && isOcr(v)) return false
    if (filter.value === 'ocr' && !isOcr(v)) return false
    return !s || v.title.toLowerCase().includes(s)
      || v.id.toLowerCase().includes(s)
      || v.source_pdf_pages.some(n => String(n) === s)
  })
})
const canVisual = computed(() => isPage.value && selected.value?.id.includes('-page-'))
const previewUrl = computed(() => withBase('/native-typst/' + (selected.value?.html ?? '')))
const layoutUrl = computed(() => withBase('/native-typst/' + (selected.value?.id ?? '') + '-layout.svg'))
const sourceUrl = computed(() => selected.value
  ? 'https://github.com/stevessr/hspice/blob/main/fullbook/native/web/' + selected.value.typst
  : '')
function choose(item: Item) {
  current.value = item.id
  jump.value = item.source_pdf_pages[0]
  view.value = 'html'
}
function go(n: number) {
  if (!Number.isInteger(n) || n < 1 || n > 445) return
  const item = pageItems.value.find(v => v.source_pdf_pages[0] === n)
  if (item) choose(item)
}
function adjacent(delta: number) { go(page.value + delta) }
function chooseId(id: string) { const item = items.value.find(v => v.id === id); if (item) choose(item) }
watch(filter, () => { if (matching.value.length && !matching.value.some(x => x.id === current.value)) choose(matching.value[0]) })
onMounted(async () => {
  try {
    const response = await fetch(withBase('/native-typst/index.json'), { cache: 'no-store' })
    if (!response.ok) throw Error('无法读取已生成的 Typst 页码目录')
    const data = await response.json()
    if (data.format !== 'native-typst-html' || !Array.isArray(data.items)) throw Error('Typst 目录结构无效')
    items.value = data.items
    const pdfPages = new Set(pageItems.value.map(i => i.source_pdf_pages[0]))
    if (pdfPages.size !== 445 || !Array.from({ length: 445 }, (_, i) => pdfPages.has(i + 1)).every(Boolean))
      throw Error('目录不包含连续的 445 页原始 PDF 映射')
    const urlPage = typeof window !== 'undefined'
      ? Number(new URLSearchParams(window.location.search).get('page')) : 0
    go(Number.isInteger(urlPage) && urlPage >= 1 && urlPage <= 445 ? urlPage : 293)
  } catch (e) { error.value = e instanceof Error ? e.message : String(e) }
  finally { loading.value = false }
})
</script>

<div class="native-all-reader">
  <div v-if="loading" role="status">正在加载 445 页 Typst 目录……</div>
  <p v-if="error" class="native-reader-error" role="alert">{{ error }}</p>
  <template v-if="items.length">
    <div class="native-reader-stats">
      <span>原书逐页可编辑源码：<strong>{{ pageItems.length }} / 445</strong></span>
      <span>人工辅助编辑：<strong>{{ editedCount }}</strong></span>
      <span>机器 OCR 草稿：<strong>{{ ocrCount }}</strong></span>
      <span>严格 1:1 验收：<strong>0 / 445</strong></span>
    </div>
    <div class="native-reader-controls">
      <label>跳转 PDF 页码 <input type="number" min="1" max="445" v-model.number="jump" @keyup.enter="go(jump)" /></label>
      <button type="button" @click="go(jump)">打开页码</button>
      <button type="button" @click="adjacent(-1)" :disabled="page <= 1">上一页</button>
      <button type="button" @click="adjacent(1)" :disabled="page >= 445">下一页</button>
      <label>内容搜索 <input v-model="search" type="search" placeholder="页码、章节名称或公式关键词" /></label>
      <label>来源质量
        <select v-model="filter"><option value="all">全部</option><option value="editorial">人工编辑选段</option><option value="ocr">机器 OCR 草稿</option></select>
      </label>
    </div>
    <div class="native-reader-index">
      <label for="native-page-select">目录（{{ matching.length }} 项）</label>
      <select id="native-page-select" :value="current" @change="chooseId(($event.target as any).value)">
        <option v-for="item in matching" :key="item.id" :value="item.id">{{ item.source_pdf_pages.length === 1 ? 'PDF '+item.source_pdf_pages[0]+' · ' : '' }}{{ item.title }}{{ isOcr(item) ? ' [OCR未校对]' : '' }}</option>
      </select>
    </div>
    <div v-if="selected" class="native-reader-active">
      <strong>{{ selected.title }}</strong>
      <p>{{ statusText(selected) }}</p>
      <div class="native-reader-links">
        <a :href="previewUrl" target="_blank" rel="noopener">独立打开 HTML</a>
        <a :href="sourceUrl" target="_blank" rel="noopener">查看可编辑 Typst 源码</a>
        <a v-if="canVisual" :href="layoutUrl" target="_blank" rel="noopener">单独打开 SVG</a>
        <a href="/fidelity">逐页严格验收矩阵</a>
      </div>
      <div class="native-reader-tabs" v-if="canVisual">
        <button type="button" :aria-pressed="view==='html'" @click="view='html'">HTML · 文本可检索</button>
        <button type="button" :aria-pressed="view==='svg'" @click="view='svg'">SVG · 原纸尺寸</button>
      </div>
      <iframe v-if="view==='html' || !canVisual" :key="selected.id" :src="previewUrl" :title="'Typst HTML：'+selected.title" loading="lazy"></iframe>
      <div v-else class="native-reader-image">
        <p>SVG尺寸 506.8346 × 729.6 pt。此图来自 Typst 原生文字及图元，不是扫描件。</p>
        <img :src="layoutUrl" :alt="'原书PDF第'+page+'页的Typst版式草稿'" />
      </div>
    </div>
  </template>
</div>

<style scoped>
.native-all-reader { margin: 1.4rem 0; }
.native-reader-stats { display:flex;flex-wrap:wrap;gap:0.5rem 1.5rem;border-bottom:1px solid var(--vp-c-divider);padding:0 0 1rem; }
.native-reader-stats span {font-size:.88rem;}
.native-reader-controls { display:flex; flex-wrap:wrap;gap:.8rem;align-items:end;margin:1.4rem 0; }
.native-reader-controls label,.native-reader-index label {display:flex;flex-direction:column;gap:.3rem;font-size:.82rem;}
.native-reader-controls input,.native-reader-controls select,.native-reader-index select {border:1px solid var(--vp-c-divider);border-radius:6px;padding:.45rem;min-width:110px;background:var(--vp-c-bg-soft);font:inherit;}
.native-reader-controls button,.native-reader-tabs button {border:1px solid var(--vp-c-divider);border-radius:6px;padding:.4rem .65rem;}
.native-reader-controls button:hover,.native-reader-tabs button:hover {border-color:var(--vp-c-brand-1);}
.native-reader-index {display:grid;gap:.35rem;}
.native-reader-index select {width:100%;font-size:.88rem;min-width:0;}
.native-reader-active {margin-top:1.1rem;}
.native-reader-active > p {font-size:.86rem;color:var(--vp-c-text-2);margin:.3rem 0;}
.native-reader-links,.native-reader-tabs {display:flex;flex-wrap:wrap;gap:.9rem;align-items:center;margin:.7rem 0;}
.native-reader-links a {font-size:.85rem;}
.native-reader-active iframe {width:100%;height:650px;border:1px solid var(--vp-c-divider);border-radius:8px;background:white;}
.native-reader-image {overflow:auto;border:1px solid var(--vp-c-divider);border-radius:8px;padding:12px;}
.native-reader-image img {width:100%;max-width:590px;display:block;margin:auto;}
.native-reader-image p {font-size:.8rem;color:var(--vp-c-text-2);}
.native-reader-error {color:var(--vp-c-danger-1);}
@media(max-width:640px) {.native-reader-active iframe{height:520px;}.native-reader-controls{gap:.55rem;}}
</style>

## 校对进度与完成标准

可编辑源码全书覆盖只是第一层。PDF20–324属于人工辅助编辑选段，PDF1–19、325–445属于OCR机器草稿。每一页还需分别完成文字、数学、图表、MOS电路全部端口、页眉脚注和逐页视觉版式的校对。**严格 1:1 验收进度仍为0/445。**

[打开 445 页原扫描与 Typst 的本地校对工作台](/native-workbench) · [查看逐页验收矩阵](/fidelity)

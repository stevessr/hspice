<script setup lang="ts">
import { computed, onMounted, ref, watch } from 'vue'
import { withBase } from 'vitepress'

type FigureEntry = {
  number: string; chapter: string; chapter_title: string; title: string; category: string;
  pdf_page: number; printed_page: number; typst: string; preview: string; source_line: number;
  other_pdf_pages: number[]; figures_verified: boolean; placeholder: boolean; reference_only: boolean
}
type FigureIndex = { format: string; total: number; entries: FigureEntry[] }
const entries = ref<FigureEntry[]>([])
const loading = ref(true)
const error = ref('')
const query = ref('')
const chapter = ref('all')
const category = ref('all')
const showThumbnails = ref(true)
const limit = ref(12)
const categories = computed(() => [...new Set(entries.value.map(x => x.category))].sort())
const chapters = computed(() => [...new Set(entries.value.map(x => x.chapter))].sort(
  (a, b) => (Number(a) || 12) - (Number(b) || 12)
))
const filtered = computed(() => {
  const needle = query.value.trim().toLocaleLowerCase()
  return entries.value.filter(x => (
    (chapter.value === 'all' || x.chapter === chapter.value) &&
    (category.value === 'all' || x.category === category.value) &&
    (!needle || [x.number, '图' + x.number, x.title, x.chapter_title, x.category,
      String(x.pdf_page), String(x.printed_page)]
      .some(t => t.toLocaleLowerCase().includes(needle)))
  ))
})
const visible = computed(() => filtered.value.slice(0, limit.value))
const available = computed(() => filtered.value.length - visible.value.length)
watch([query, chapter, category], () => { limit.value = 12 })
const chapterName = (id: string) => {
  const x = entries.value.find(e => e.chapter === id)
  return x ? (Number(id) ? '第 ' + id + ' 章 · ' + x.chapter_title : x.chapter_title) : id
}
const previewSrc = (x: FigureEntry) => withBase('/native-typst/' + x.preview)
const reviewHref = (x: FigureEntry) => withBase('/native-workbench') + '?page=' + x.pdf_page
const sourceHref = (x: FigureEntry) =>
  'https://github.com/stevessr/hspice/blob/main/fullbook/native/web/' + x.typst + '#L' + x.source_line
const statusLabel = (x: FigureEntry) =>
  x.placeholder ? '原书照片占位说明'
    : x.figures_verified ? '该页图形已标记核对' : 'Typst 重排预览 · 原图未严格验收'
function reset() { query.value = ''; chapter.value = 'all'; category.value = 'all' }
onMounted(async () => {
  try {
    const response = await fetch(withBase('/figure-index.json'), { cache: 'no-store' })
    if (!response.ok) throw Error('图录索引未发布（HTTP ' + response.status + '）')
    const data: FigureIndex = await response.json()
    if (data.format !== 'hspice-textbook-figure-index-v1' ||
        !Array.isArray(data.entries) || data.total !== data.entries.length) throw Error('图录数据格式校验失败')
    if (!data.entries.every(x => Number.isInteger(x.pdf_page) &&
      x.pdf_page >= 20 && x.pdf_page <= 445 &&
      x.pdf_page - 19 === x.printed_page && typeof x.title === 'string')) {
      throw Error('图录页码或标题异常')
    }
    entries.value = data.entries
    const selected = new URLSearchParams(window.location.search).get('q')
    if (selected) query.value = selected.slice(0, 160)
  } catch (e) { error.value = e instanceof Error ? e.message : String(e) }
  finally { loading.value = false }
})
</script>

<template>
  <section class="figure-reference" aria-label="教材图例速查">
    <div class="figure-intro">
      <strong>图号、图名、印刷页码与 PDF 页序集中检索</strong>
      <p>图片展示仓库的可编辑 Typst <b>整页重排预览</b>，不是教材扫描原图。
        有些图仍是结构草图、示意重绘或原书照片占位，未完成严格图形验收。</p>
    </div>
    <p v-if="loading" role="status">正在读取教材图目录……</p>
    <p v-else-if="error" role="alert">{{ error }}。
      也可阅读<a :href="withBase('/reference/figures-catalog')">完整图号表</a>。</p>
    <template v-else>
      <div class="figure-controls">
        <div class="figure-search">
          <label for="figure-query">按图号、图名或页码搜索</label>
          <input id="figure-query" type="search" v-model="query"
            placeholder="例如：图2.14、CMOS、SRAM、Elmore、386" autocomplete="off" />
        </div>
        <div>
          <label for="figure-chapter">教材章节</label>
          <select id="figure-chapter" v-model="chapter">
            <option value="all">全部章节</option>
            <option v-for="id in chapters" :key="id" :value="id">{{ chapterName(id) }}</option>
          </select>
        </div>
        <div>
          <label for="figure-category">图形类型</label>
          <select id="figure-category" v-model="category">
            <option value="all">全部类型</option>
            <option v-for="name in categories" :key="name" :value="name">{{ name }}</option>
          </select>
        </div>
      </div>
      <div class="figure-toolbar">
        <p role="status">找到 <strong>{{ filtered.length }}</strong> 项（已索引 {{ entries.length }} 个不同图号）</p>
        <label><input v-model="showThumbnails" type="checkbox" /> 显示整页预览</label>
        <button type="button" @click="reset" :disabled="!query && chapter === 'all' && category === 'all'">清除筛选</button>
      </div>
      <div v-if="filtered.length === 0" class="figure-empty">
        未找到匹配图号；可尝试章节名、中文图名或清除筛选。图录只收录已有明确图注的重排页面。
      </div>
      <div class="figure-grid">
        <article v-for="entry in visible" :key="entry.number" class="figure-card">
          <div v-if="showThumbnails" class="figure-thumbnail">
            <a :href="previewSrc(entry)" target="_blank" rel="noopener noreferrer"
              :aria-label="'打开图 ' + entry.number + ' 所在整页重排预览'">
              <img :src="previewSrc(entry)"
                :alt="'图 ' + entry.number + ' 所在 PDF 第 ' + entry.pdf_page + ' 页 Typst 预览'"
                loading="lazy" decoding="async" />
            </a>
          </div>
          <div class="figure-body">
            <div class="figure-heading">
              <strong>图 {{ entry.number }}</strong><small>{{ entry.category }}</small>
            </div>
            <p class="figure-title">{{ entry.title }}</p>
            <p class="figure-muted">{{ chapterName(entry.chapter) }}</p>
            <div class="figure-pages">
              <span>印刷第 <b>{{ entry.printed_page }}</b> 页</span>
              <span>PDF 第 <b>{{ entry.pdf_page }}</b> 页</span>
            </div>
            <p class="figure-muted">{{ statusLabel(entry) }}</p>
            <div class="figure-links">
              <a :href="reviewHref(entry)">查看对应页与校对记录</a>
              <a :href="sourceHref(entry)" target="_blank" rel="noopener noreferrer">查看 Typst 源码</a>
            </div>
          </div>
        </article>
      </div>
      <div v-if="available > 0" class="figure-more">
        <button type="button" @click="limit += 12">加载更多（剩余 {{ available }} 项）</button>
      </div>
      <p class="figure-footer">
        <a :href="withBase('/reference/figures-catalog')">查看图号文字表（支持 VitePress 全站搜索）</a>。
        印刷第 n 页 = PDF 第 n+19 页。目录自动提取自重排源码，尚无明确图注的页面可能未收录。
      </p>
    </template>
  </section>
</template>

<style scoped>
.figure-reference { margin: 1.4rem 0 2rem; color: var(--vp-c-text-1); }
.figure-intro { border: 1px solid var(--vp-c-divider); border-radius: 12px; padding: 1rem 1.2rem; }
.figure-intro p { color: var(--vp-c-text-2); margin: .55rem 0 0; font-size: .91rem; line-height: 1.7; }
.figure-controls { display: grid; grid-template-columns: minmax(220px, 2fr) 1fr 1fr; gap: .8rem; margin: 1.15rem 0; }
.figure-controls label { display: block; color: var(--vp-c-text-2); font-size: .8rem; margin-bottom: .3rem; }
.figure-controls input, .figure-controls select {
  width: 100%; padding: .56rem .65rem; background: var(--vp-c-bg-soft); border: 1px solid var(--vp-c-divider);
  color: var(--vp-c-text-1); border-radius: 8px; min-height: 39px; font: inherit; font-size: .88rem;
}
.figure-controls :is(input, select):focus-visible, .figure-reference button:focus-visible {
  outline: 2px solid var(--vp-c-brand-1); outline-offset: 2px;
}
.figure-toolbar { display: flex; align-items: center; flex-wrap: wrap; gap: .9rem; margin-bottom: 1rem; }
.figure-toolbar p { margin: 0 auto 0 0; color: var(--vp-c-text-2); font-size: .9rem; }
.figure-toolbar label { display: flex; align-items: center; gap: .3rem; font-size: .85rem; }
.figure-reference button { border: 1px solid var(--vp-c-divider); border-radius: 8px; padding: .4rem .75rem; font-size: .85rem; background: var(--vp-c-bg-soft); }
.figure-reference button:disabled { opacity: .4; cursor: not-allowed; }
.figure-reference button:not(:disabled) { cursor: pointer; }
.figure-grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 1rem; }
.figure-card { border: 1px solid var(--vp-c-divider); border-radius: 11px; overflow: hidden; background: var(--vp-c-bg); min-width: 0; }
.figure-thumbnail { background: var(--vp-c-bg-soft); height: 220px; overflow: hidden; display: flex; align-items: center; justify-content: center; border-bottom: 1px solid var(--vp-c-divider); }
.figure-thumbnail a { height: 100%; width: 100%; display: block; }
.figure-thumbnail img { object-fit: contain; width: 100%; height: 100%; }
.figure-body { padding: .85rem 1rem 1rem; }
.figure-heading { display: flex; align-items: center; justify-content: space-between; gap: .6rem; }
.figure-heading strong { font-size: .98rem; }
.figure-heading small { font-size: .75rem; color: var(--vp-c-text-2); }
.figure-title { margin: .45rem 0 .7rem; font-size: .87rem; line-height: 1.65; overflow-wrap: anywhere; }
.figure-muted { color: var(--vp-c-text-3); font-size: .78rem; margin: .25rem 0; }
.figure-pages { display: flex; gap: 1rem; flex-wrap: wrap; margin: .6rem 0; font-size: .85rem; }
.figure-links { display: flex; gap: .6rem 1rem; flex-wrap: wrap; margin-top: .8rem; font-size: .83rem; }
.figure-links a { color: var(--vp-c-brand-1); text-decoration: none; }
.figure-links a:hover { text-decoration: underline; }
.figure-more { display: flex; justify-content: center; margin: 1.4rem 0; }
.figure-empty { padding: 2rem .8rem; text-align: center; border: 1px dashed var(--vp-c-divider); border-radius: 9px; }
.figure-footer { color: var(--vp-c-text-2); font-size: .86rem; line-height: 1.7; margin-top: 1.5rem; }
@media (max-width: 740px) {
  .figure-controls { grid-template-columns: repeat(2, minmax(0,1fr)); }
  .figure-search { grid-column: 1 / -1; }
  .figure-grid { grid-template-columns: 1fr; }
  .figure-thumbnail { height: 250px; }
}
@media (max-width: 390px) {
  .figure-controls { grid-template-columns: 1fr; }
  .figure-search { grid-column: auto; }
}
</style>

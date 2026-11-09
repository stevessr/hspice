<script setup lang="ts">
import { computed, onMounted, ref, watch } from 'vue'
import { withBase } from 'vitepress'

type Formula = {
  id: string; name: string; note: string; latex: string; html: string
  original_label: string; chapter: number; topic: string
  printed_page: number; pdf_page: number; source_route: string; source_line: number
}
type FormulaIndex = { format: string; total: number; entries: Formula[] }
const entries = ref<Formula[]>([])
const loading = ref(true)
const error = ref('')
const query = ref('')
const chapter = ref('all')
const kind = ref('all')
const hidden = ref(false)
const revealed = ref<Set<string>>(new Set())
const showCount = ref(18)
const copyStatus = ref('')
const chapters = computed(() => [...new Set(entries.value.map(x => x.chapter))].sort((a, b) => a - b))
const matches = computed(() => {
  const needles = query.value.trim().toLocaleLowerCase().split(/\s+/).filter(Boolean)
  return entries.value.filter(x => {
    if (chapter.value !== 'all' && x.chapter !== Number(chapter.value)) return false
    if (kind.value === 'numbered' && !/^式\s*\(/.test(x.original_label)) return false
    if (kind.value === 'derived' && /^式\s*\(/.test(x.original_label)) return false
    const haystack = [x.name, x.note, x.latex, x.original_label,
      x.topic, String(x.printed_page), String(x.pdf_page), '第' + x.chapter + '章'].join(' ').toLocaleLowerCase()
    return needles.every(word => haystack.includes(word))
  })
})
const visible = computed(() => matches.value.slice(0, showCount.value))
const remaining = computed(() => matches.value.length - visible.value.length)
const sourceHref = (x: Formula) => withBase(x.source_route)
const reviewHref = (x: Formula) => withBase('/native-workbench') + '?page=' + x.pdf_page
function reset() { query.value = ''; chapter.value = 'all'; kind.value = 'all' }
function toggle(id: string) {
  const changed = new Set(revealed.value)
  changed.has(id) ? changed.delete(id) : changed.add(id)
  revealed.value = changed
}
function isShown(x: Formula) { return !hidden.value || revealed.value.has(x.id) }
async function copyLatex(x: Formula) {
  try {
    await navigator.clipboard.writeText(x.latex)
    copyStatus.value = '已复制「' + x.name + '」的 LaTeX'
  } catch { copyStatus.value = '复制失败，请在来源页选择公式文本' }
}
watch([query, chapter, kind], () => { showCount.value = 18; revealed.value = new Set() })
watch(hidden, () => { revealed.value = new Set() })
onMounted(async () => {
  try {
    const response = await fetch(withBase('/review-formulas.json'))
    if (!response.ok) throw new Error('公式索引读取失败（HTTP ' + response.status + '）')
    const data = await response.json() as FormulaIndex
    if (data.format !== 'hspice-revision-formula-index-v1' || data.total !== 145 ||
        !Array.isArray(data.entries) || data.entries.length !== data.total) {
      throw new Error('公式索引数据不完整')
    }
    if (!data.entries.every(x => x.pdf_page === x.printed_page + 19 &&
      typeof x.html === 'string' && x.html.includes('<svg'))) {
      throw new Error('公式排版或教材页码校验失败')
    }
    entries.value = data.entries
    const url = new URLSearchParams(window.location.search)
    const q = url.get('q')
    if (q) query.value = q.slice(0, 120)
    const ch = url.get('chapter')
    if (ch && /^(?:[1-9]|10|11)$/.test(ch)) chapter.value = ch
  } catch (e) {
    error.value = e instanceof Error ? e.message : String(e)
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <section class="formula-finder" aria-label="教材公式检索与默写">
    <p v-if="loading" role="status">正在加载公式与教材页码……</p>
    <p v-else-if="error" role="alert">{{ error }}。可转到
      <a :href="withBase('/reference/formula-index')">第 1—6 章公式表</a>或
      <a :href="withBase('/reference/formula-index-systems')">第 7—11 章公式表</a>。
    </p>
    <template v-else>
      <div class="finder-controls">
        <div class="finder-search">
          <label for="formula-query">按公式名、式号、用途或页码搜索</label>
          <input id="formula-query" v-model="query" type="search" autocomplete="off"
            placeholder="例如：体效应、速度饱和、(2.11)、SRAM、Elmore" />
        </div>
        <div>
          <label for="formula-chapter">教材章节</label>
          <select id="formula-chapter" v-model="chapter">
            <option value="all">全部章节</option>
            <option v-for="num in chapters" :key="num" :value="String(num)">第 {{ num }} 章</option>
          </select>
        </div>
        <div>
          <label for="formula-kind">原书定位类型</label>
          <select id="formula-kind" v-model="kind">
            <option value="all">全部</option>
            <option value="numbered">教材编号公式</option>
            <option value="derived">图示、例题及推导</option>
          </select>
        </div>
      </div>
      <div class="finder-toolbar">
        <p role="status">匹配 <strong>{{ matches.length }}</strong> / {{ entries.length }} 项</p>
        <label class="finder-switch">
          <input v-model="hidden" type="checkbox" /> 默写模式：先遮盖公式
        </label>
        <button :disabled="!query && chapter === 'all' && kind === 'all'" type="button" @click="reset">清空</button>
      </div>
      <p v-if="copyStatus" class="finder-status" role="status">{{ copyStatus }}</p>
      <p v-if="matches.length === 0" class="finder-empty">
        没有匹配的条目。请更换关键词或章节；本索引收录教材精选的 145 项公式，并非原书所有等式。
      </p>
      <div class="formula-grid">
        <article v-for="item in visible" :key="item.id" class="formula-card">
          <div class="formula-header">
            <strong>{{ item.name }}</strong>
            <small>第 {{ item.chapter }} 章</small>
          </div>
          <p class="formula-note">{{ item.note || item.topic }}</p>
          <div class="formula-math">
            <div v-if="isShown(item)" class="formula-svg" v-html="item.html" :aria-label="item.name + ' 的数学公式'"></div>
            <button v-else class="formula-reveal" type="button" @click="toggle(item.id)">
              <span>公式已隐藏</span><span>点击显示答案</span>
            </button>
          </div>
          <div class="formula-meta">
            <span>{{ item.original_label }}</span>
            <span>印刷 p.{{ item.printed_page }} / PDF p.{{ item.pdf_page }}</span>
          </div>
          <div class="formula-actions">
            <a :href="reviewHref(item)">教材对应页</a>
            <a :href="sourceHref(item)">公式原表</a>
            <button type="button" @click="copyLatex(item)">复制 LaTeX</button>
          </div>
        </article>
      </div>
      <div v-if="remaining > 0" class="finder-more">
        <button type="button" @click="showCount += 18">显示更多（剩余 {{ remaining }} 项）</button>
      </div>
      <p class="finder-footer">
        公式使用当前教材速查表的编号、条件与页码，PDF 跳转进入可编辑 Typst 校对页，
        并非原始扫描图片。使用前需核对“线性/饱和”“长/短沟道”“符号方向”等适用条件。
      </p>
    </template>
  </section>
</template>

<style scoped>
.formula-finder { margin: 1rem 0 2rem; }
.finder-controls { display:grid; grid-template-columns:minmax(210px,2fr) minmax(115px,1fr) minmax(140px,1fr); gap:.7rem; margin-bottom:.8rem; }
.finder-controls label { display:block; font-size:.8rem; color:var(--vp-c-text-2); margin-bottom:.35rem; }
.finder-controls :is(input,select) {
  width:100%; min-width:0; min-height:40px; padding:.55rem .65rem; font:inherit; font-size:.9rem; border:1px solid var(--vp-c-divider);
  border-radius:8px; color:var(--vp-c-text-1); background:var(--vp-c-bg-soft);
}
.finder-controls :is(input,select):focus-visible, .formula-finder button:focus-visible { outline:2px solid var(--vp-c-brand-1); outline-offset:2px; }
.finder-toolbar { display:flex; flex-wrap:wrap; gap:.8rem; align-items:center; margin-bottom:1rem; }
.finder-toolbar p { color:var(--vp-c-text-2); margin:0 auto 0 0; font-size:.87rem; }
.finder-switch { display:inline-flex; gap:.38rem; align-items:center; font-size:.84rem; }
.formula-finder button { cursor:pointer; border:1px solid var(--vp-c-divider); border-radius:8px; padding:.4rem .65rem; font-size:.83rem; background:var(--vp-c-bg-soft); color:var(--vp-c-text-1); }
.formula-finder button:disabled { cursor:not-allowed; opacity:.4; }
.formula-grid { display:grid; grid-template-columns:repeat(2,minmax(0,1fr)); gap:.85rem; align-items:stretch; }
.formula-card { display:flex; flex-direction:column; min-width:0; border:1px solid var(--vp-c-divider); border-radius:12px; overflow:hidden; padding:.9rem 1rem; }
.formula-header { display:flex; gap:.6rem; align-items:flex-start; justify-content:space-between; line-height:1.5; }
.formula-header strong { font-size:.95rem; }
.formula-header small { white-space:nowrap; font-size:.73rem; color:var(--vp-c-text-3); }
.formula-note { color:var(--vp-c-text-2); font-size:.8rem; margin:.35rem 0 .5rem; line-height:1.6; }
.formula-math { display:flex; align-items:center; justify-content:center; flex:1; min-height:112px; padding:.75rem .35rem; max-width:100%; overflow-x:auto; }
.formula-svg { width:100%; text-align:center; font-size:1.1rem; }
.formula-svg :deep(svg) { max-width:none; height:auto; }
.formula-reveal { display:flex; flex-direction:column; gap:.35rem; align-items:center; width:100%; min-height:88px; justify-content:center; border-style:dashed !important; }
.formula-reveal span:first-child { font-weight:600; }
.formula-meta { display:flex; gap:.35rem .7rem; flex-wrap:wrap; justify-content:space-between; font-size:.76rem; color:var(--vp-c-text-3); border-top:1px solid var(--vp-c-divider); padding-top:.6rem; }
.formula-actions { display:flex; align-items:center; gap:.6rem 1rem; flex-wrap:wrap; margin-top:.65rem; font-size:.8rem; }
.formula-actions a { color:var(--vp-c-brand-1); text-decoration:none; }
.formula-actions a:hover { text-decoration:underline; }
.formula-actions button { border:0; background:none; padding:0; color:var(--vp-c-brand-1); }
.finder-empty { border:1px dashed var(--vp-c-divider); border-radius:10px; padding:1.5rem; }
.finder-more { display:flex; justify-content:center; margin:1.25rem 0; }
.finder-footer,.finder-status { font-size:.82rem; color:var(--vp-c-text-2); line-height:1.7; }
@media (max-width:760px) {
  .finder-controls { grid-template-columns:repeat(2,minmax(0,1fr)); }
  .finder-search { grid-column:1/-1; }
  .formula-grid { grid-template-columns:1fr; }
}
@media (max-width:420px) { .finder-controls { grid-template-columns:1fr; } .finder-search { grid-column:auto; } }
</style>

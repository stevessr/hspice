<script setup lang="ts">
import { computed, onBeforeUnmount, onMounted, ref, shallowRef } from 'vue'
import { withBase } from 'vitepress'
import { unzipSync } from 'fflate'

type Entry = { id: string; title: string; source_pdf_pages: number[]; html: string; typst: string; status: string }
type Quality = {
  pdf_page: number; editorial_state: string; checks: Record<string, boolean>
  evidence: Record<string, string>; unresolved: string[]; notes: string
}
type LocalReview = { drafts: Record<string, string>; preliminarilyReviewed: number[] }
const total = 445
const storageKey = 'hspice-native-review-v2'
const names: Record<string, string> = {
  text_complete: '正文逐字完整',
  math_complete: '公式及编号完整',
  tables_complete: '表格数据和可编辑性',
  figures_editable: '电路图和图形忠实',
  captions_references_complete: '图注与交叉引用',
  footnotes_headers_complete: '脚注、页眉与页码',
  layout_compared: '版式逐页对照',
  typst_html_compiled: 'Typst 网页编译'
}
const ranges = [
  { label: '全书', from: 1, to: 445 },
  { label: '前置页', from: 1, to: 19 },
  { label: '第 1 章', from: 20, to: 46 },
  { label: '第 2 章', from: 47, to: 86 },
  { label: '第 3 章', from: 87, to: 126 },
  { label: '第 4 章', from: 127, to: 166 },
  { label: '第 5 章', from: 167, to: 207 },
  { label: '第 6 章', from: 208, to: 253 },
  { label: '第 7 章', from: 254, to: 291 },
  { label: '第 8 章', from: 292, to: 321 },
  { label: '后续章节与附录', from: 322, to: 445 }
]
const entries = ref<Entry[]>([])
const quality = ref<Quality[]>([])
const busy = ref(true)
const error = ref('')
const page = ref(26)
const jump = ref(26)
const rangeIndex = ref(0)
const filter = ref('all')
const source = ref('')
const original = ref('')
const sourceLoading = ref(false)
const sourceError = ref('')
const drafts = ref<Record<string, string>>({})
const preliminary = ref<number[]>([])
const preview = ref<'html' | 'svg' | 'live'>('svg')
const liveSvg = ref('')
const liveError = ref('')
const compiling = ref(false)
const scanUrl = ref('')
const scans = shallowRef<Record<string, Uint8Array>>({})
const archiveName = ref('')
const archiveError = ref('')
const search = ref('')
const scanInput = ref<HTMLInputElement | null>(null)
let currentRequest = 0
let runtimePromise: Promise<any> | undefined
const byPage = computed(() => new Map(entries.value.filter(e => e.source_pdf_pages.length === 1).map(e => [e.source_pdf_pages[0], e])))
const selected = computed(() => byPage.value.get(page.value))
const currentQA = computed(() => quality.value[page.value - 1])
const isOcr = computed(() => (selected.value?.status || '').startsWith('machine OCR'))
const isModified = computed(() => selected.value ? source.value !== original.value : false)
const changeCount = computed(() => Object.keys(drafts.value).length)
const approved = (p: Quality) => Object.keys(names).every(k => p.checks?.[k] === true)
  && ['reference_scan_sha256', 'typst_source_sha256', 'reviewer', 'reviewed_at', 'comparison_notes'].every(k => !!p.evidence?.[k])
const acceptedCount = computed(() => quality.value.filter(approved).length)
const displayedPages = computed(() => {
  const range = ranges[rangeIndex.value]
  return quality.value.filter(p => {
    if (p.pdf_page < range.from || p.pdf_page > range.to) return false
    if (filter.value === 'unresolved' && !p.unresolved?.length) return false
    if (filter.value === 'accepted' && !approved(p)) return false
    if (filter.value === 'edited' && !(String(p.pdf_page) in drafts.value)) return false
    const s = search.value.trim().toLowerCase()
    return !s || String(p.pdf_page) === s || (byPage.value.get(p.pdf_page)?.title || '').toLowerCase().includes(s)
  })
})
const publishedHtml = computed(() => withBase('/native-typst/' + (selected.value?.html || '')))
const publishedSvg = computed(() => withBase('/native-typst/' + (selected.value?.id || '') + '-layout.svg'))
const sourceLink = computed(() => 'https://github.com/stevessr/hspice/blob/main/fullbook/native/web/' + (selected.value?.typst || ''))
const previewLabel = computed(() => preview.value === 'live' ? '本机 WASM 编译结果' : 'GitHub Pages 已发布版本')

function persist() {
  if (typeof window === 'undefined') return
  try {
    const record: LocalReview = { drafts: drafts.value, preliminarilyReviewed: preliminary.value }
    localStorage.setItem(storageKey, JSON.stringify(record))
  } catch (e) { sourceError.value = '无法存储浏览器草稿，请下载修改补丁：' + String(e) }
}
function updateDraft() {
  if (source.value === original.value) delete drafts.value[String(page.value)]
  else drafts.value[String(page.value)] = source.value
  liveSvg.value = ''
  persist()
}
function setScan(n: number) {
  if (scanUrl.value) URL.revokeObjectURL(scanUrl.value)
  scanUrl.value = ''
  const match = Object.keys(scans.value).find(k => k.endsWith('/preview_scans/page-' + String(n).padStart(3, '0') + '.jpg'))
  if (match) scanUrl.value = URL.createObjectURL(new Blob([scans.value[match] as BlobPart], { type: 'image/jpeg' }))
}
async function selectPage(n: number, writeHistory = true) {
  if (!Number.isInteger(n) || n < 1 || n > total) return
  page.value = n
  jump.value = n
  setScan(n)
  preview.value = 'svg'
  liveSvg.value = ''
  liveError.value = ''
  const req = ++currentRequest
  sourceLoading.value = true
  sourceError.value = ''
  try {
    const item = byPage.value.get(n)
    if (!item) throw new Error('该页没有对应的 Typst 目录')
    const response = await fetch(withBase('/native-typst/' + item.typst))
    if (!response.ok) throw new Error('源码 HTTP ' + response.status)
    const value = await response.text()
    if (req !== currentRequest) return
    original.value = value
    source.value = drafts.value[String(n)] ?? value
  } catch (e) {
    if (req === currentRequest) { source.value = ''; original.value = ''; sourceError.value = String(e) }
  } finally { if (req === currentRequest) sourceLoading.value = false }
  if (writeHistory && typeof window !== 'undefined') {
    const url = new URL(window.location.href)
    url.searchParams.set('page', String(n))
    history.replaceState(null, '', url)
  }
}
function download(name: string, payload: string, mime = 'text/plain;charset=utf-8') {
  const url = URL.createObjectURL(new Blob([payload], { type: mime }))
  const a = document.createElement('a')
  a.href = url; a.download = name; a.click()
  setTimeout(() => URL.revokeObjectURL(url), 1000)
}
function exportCurrent() {
  download('page-' + String(page.value).padStart(3, '0') + '.typ', source.value)
}
function exportPatch() {
  download('typst-review-patch.json', JSON.stringify({
    schema: 'hspice-native-review-v2',
    note: '浏览器初检记录不能直接计入严格 1:1 验收',
    edits: Object.entries(drafts.value).map(([n, typst]) => ({ pdf_page: Number(n), typst })),
    preliminarily_reviewed: preliminary.value.slice().sort((a, b) => a - b)
  }, null, 2), 'application/json;charset=utf-8')
}
function resetCurrent() {
  source.value = original.value
  updateDraft()
}
async function importZip(event: Event) {
  const input = event.target as HTMLInputElement
  const file = input.files?.[0]
  if (!file) return
  archiveError.value = ''
  try {
    const zip = unzipSync(new Uint8Array(await file.arrayBuffer()))
    const names = Object.keys(zip).filter(n => /(?:^|\/)preview_scans\/page-\d{3}\.jpg$/.test(n))
    if (!names.length) throw new Error('ZIP 中缺少 preview_scans/page-NNN.jpg 文件')
    scans.value = zip
    archiveName.value = file.name
    setScan(page.value)
  } catch (e) { archiveError.value = String(e) }
  input.value = ''
}
async function ensureRuntime(): Promise<any> {
  if (runtimePromise) return runtimePromise
  runtimePromise = new Promise((resolve, reject) => {
    const global = window as any
    if (global.$typst) { resolve(global.$typst); return }
    const el = document.createElement('script')
    el.type = 'module'
    el.src = 'https://cdn.jsdelivr.net/npm/@myriaddreamin/typst-all-in-one.ts@0.6.0/dist/esm/index.js'
    el.onload = () => global.$typst ? resolve(global.$typst) : reject(Error('浏览器 Typst 引擎未初始化'))
    el.onerror = () => reject(Error('无法加载 Typst WASM 前端，检查网络或 CDN'))
    document.head.appendChild(el)
  }).catch(e => { runtimePromise = undefined; throw e })
  return runtimePromise
}
function normalize(path: string): string {
  const parts: string[] = []
  for (const bit of path.split('/')) {
    if (!bit || bit === '.') continue
    if (bit === '..') parts.pop()
    else parts.push(bit)
  }
  return parts.join('/')
}
async function addDependencies(engine: any, content: string, directory: string, visited: Set<string>) {
  const refs = [...content.matchAll(/#(?:import|include)\s+"([^"]+\.typ)"/g)]
  for (const match of refs) {
    const path = normalize(directory + '/' + match[1])
    if (!path.startsWith('figures/') || visited.has(path)) continue
    if (visited.size >= 40) throw Error('引用文件过多，请使用仓库完整 Typst 项目编译')
    visited.add(path)
    const response = await fetch(withBase('/native-typst/' + path))
    if (!response.ok) throw Error('缺少依赖：' + path)
    const text = await response.text()
    await engine.addSource('/' + path, text)
    await addDependencies(engine, text, path.substring(0, path.lastIndexOf('/')), visited)
  }
}
async function compileCurrent() {
  if (!selected.value || compiling.value) return
  preview.value = 'live'
  compiling.value = true
  liveError.value = ''
  liveSvg.value = ''
  try {
    const engine = await ensureRuntime()
    const baseName = selected.value.id
    const response = await fetch(withBase('/native-typst/' + baseName + '-layout.typ'))
    if (!response.ok) throw Error('该页尚未发布排版包装源码')
    const wrapper = await response.text()
    const normalized = source.value.replaceAll('../figures/', 'figures/')
    const full = wrapper.replace(/#include\s+"[^"]+\.typ"/, normalized)
    if (full === wrapper) throw Error('排版包装文件缺少可替换的 #include')
    await engine.resetShadow()
    await addDependencies(engine, full, '', new Set<string>())
    await engine.addSource('/main.typ', full)
    const result = await engine.svg({ mainFilePath: '/main.typ' })
    if (typeof result !== 'string' || !result.includes('<svg')) throw Error('Typst 没有返回 SVG')
    liveSvg.value = result
  } catch (e) {
    liveError.value = String(e)
  } finally { compiling.value = false }
}
function togglePreliminary(yes: boolean) {
  const s = new Set(preliminary.value)
  if (yes) s.add(page.value); else s.delete(page.value)
  preliminary.value = [...s]
  persist()
}
function navigateHistory() {
  const n = Number(new URLSearchParams(location.search).get('page'))
  if (Number.isInteger(n) && n >= 1 && n <= total) void selectPage(n, false)
}
onMounted(async () => {
  try {
    const stored = localStorage.getItem(storageKey)
    if (stored) {
      const state = JSON.parse(stored) as LocalReview
      if (state.drafts && typeof state.drafts === 'object') drafts.value = state.drafts
      if (Array.isArray(state.preliminarilyReviewed)) preliminary.value = state.preliminarilyReviewed
    }
  } catch { /* corrupt or disabled local storage: start fresh */ }
  try {
    const [qRes, idxRes] = await Promise.all([
      fetch(withBase('/native-fidelity.json'), { cache: 'no-store' }),
      fetch(withBase('/native-typst/index.json'), { cache: 'no-store' })
    ])
    if (!qRes.ok || !idxRes.ok) throw Error('站点验收数据或 Typst 目录获取失败')
    const q = await qRes.json(), idx = await idxRes.json()
    if (q.source_pages !== total || q.pages?.length !== total) throw Error('验收矩阵不是连续的 445 页')
    if (idx.format !== 'native-typst-html' || !Array.isArray(idx.items)) throw Error('Typst 目录格式错误')
    quality.value = q.pages
    entries.value = idx.items
    if (byPage.value.size !== total) throw Error('Typst 目录未覆盖完整的 445 页')
    const requested = Number(new URLSearchParams(location.search).get('page'))
    await selectPage(Number.isInteger(requested) && requested >= 1 && requested <= total ? requested : 26, false)
    window.addEventListener('popstate', navigateHistory)
  } catch (e) { error.value = String(e) }
  finally { busy.value = false }
})
onBeforeUnmount(() => {
  if (scanUrl.value) URL.revokeObjectURL(scanUrl.value)
  if (typeof window !== 'undefined') window.removeEventListener('popstate', navigateHistory)
})
</script>

<template>
  <div class="unified-review">
    <p v-if="busy" role="status">正在加载在线验收矩阵和 445 页 Typst 源码索引……</p>
    <p v-if="error" class="review-error" role="alert">{{ error }}</p>
    <template v-if="!busy && !error">
      <div class="review-summary">
        <div><strong>{{ acceptedCount }} / {{ total }}</strong><span>严格整页验收</span></div>
        <div><strong>{{ byPage.size }}</strong><span>在线可查看与编辑的原生 Typst 页</span></div>
        <div><strong>{{ changeCount }}</strong><span>浏览器本地修改稿</span></div>
        <div><strong>{{ preliminary.length }}</strong><span>仅本机人工初检标记</span></div>
      </div>
      <div class="review-bar">
        <label>章节 <select v-model.number="rangeIndex"><option v-for="(part,i) in ranges" :key="i" :value="i">{{ part.label }}</option></select></label>
        <label>筛选 <select v-model="filter">
          <option value="all">全部</option><option value="unresolved">有待解决项</option>
          <option value="edited">我已修改</option><option value="accepted">正式验收通过</option>
        </select></label>
        <label>页码或标题 <input v-model="search" type="search" placeholder="如 CMOS、179、MOS" /></label>
        <label>跳转 PDF 页码 <input v-model.number="jump" type="number" min="1" max="445" @keyup.enter="selectPage(jump)" /></label>
        <button type="button" @click="selectPage(jump)">跳转</button>
        <button type="button" :disabled="page<=1" @click="selectPage(page-1)">上一页</button>
        <button type="button" :disabled="page>=total" @click="selectPage(page+1)">下一页</button>
      </div>
      <div class="review-pages" role="group" aria-label="选择扫描 PDF 页码">
        <button v-for="q in displayedPages" :key="q.pdf_page" type="button"
          :class="{ active:q.pdf_page===page, accepted:approved(q), changed:String(q.pdf_page) in drafts, issue:q.unresolved?.length }"
          :aria-pressed="q.pdf_page===page" @click="selectPage(q.pdf_page)">{{ q.pdf_page }}</button>
        <p v-if="!displayedPages.length">当前筛选条件没有页面。</p>
      </div>
      <div v-if="selected && currentQA" class="review-current">
        <h2>PDF 第 {{ page }} 页 · {{ selected.title }}</h2>
        <p>源码：{{ isOcr ? '机器 OCR 草稿' : '人工辅助编辑选段' }} · 严格验收：{{ approved(currentQA) ? '通过' : '未通过' }}</p>
        <div class="review-matrix">
          <section>
            <h3>逐页验收条件</h3>
            <div class="review-checklist">
              <div v-for="(name,key) in names" :key="key"><span>{{ currentQA.checks?.[key] ? '✓' : '○' }}</span> {{ name }}</div>
            </div>
            <p v-if="currentQA.notes">{{ currentQA.notes }}</p>
          </section>
          <section>
            <h3>待解决问题及证据</h3>
            <ul v-if="currentQA.unresolved?.length"><li v-for="issue in currentQA.unresolved" :key="issue">{{ issue }}</li></ul>
            <p v-else>本页暂未列明缺项，仍须对照原书和提交审校证据。</p>
            <p v-if="currentQA.evidence?.reviewer">审校人：{{ currentQA.evidence.reviewer }} · {{ currentQA.evidence.reviewed_at }}</p>
            <label><input type="checkbox" :checked="preliminary.includes(page)" @change="togglePreliminary(($event.target as HTMLInputElement).checked)" />
              本页已由我初检（不改变正式验收结果）</label>
          </section>
        </div>
        <div class="review-toolbar">
          <label>本地扫描参考图（可选）
            <input ref="scanInput" type="file" accept=".zip,application/zip" @change="importZip" />
          </label>
          <span v-if="archiveName">已导入：{{ archiveName }}</span>
          <span v-if="archiveError" class="review-error">{{ archiveError }}</span>
          <button @click="exportCurrent" :disabled="sourceLoading">下载本页 .typ</button>
          <button @click="exportPatch">下载修改补丁 JSON</button>
          <button @click="resetCurrent" :disabled="!isModified">还原已发布源码</button>
        </div>
        <div class="review-columns">
          <section class="review-code">
            <h3>Typst 在线源码编辑器 <small>{{ isModified ? '● 有本地修改' : '与已发布版本一致' }}</small></h3>
            <p v-if="sourceLoading">读取源码中……</p>
            <p v-if="sourceError" class="review-error">{{ sourceError }}</p>
            <textarea v-model="source" :disabled="sourceLoading" spellcheck="false"
              :aria-label="'PDF 第 '+page+' 页的 Typst 源码'" @input="updateDraft"></textarea>
            <a :href="sourceLink" target="_blank" rel="noopener">GitHub 对应源码</a>
            <p>修改自动保存在当前浏览器。下载 .typ 或修改补丁后，可作为 GitHub PR 的校对输入。</p>
          </section>
          <section class="review-preview">
            <h3>Typst 结果预览 <small>{{ previewLabel }}</small></h3>
            <div class="review-tabs">
              <button :aria-pressed="preview==='svg'" @click="preview='svg'">已发布 SVG 版式</button>
              <button :aria-pressed="preview==='html'" @click="preview='html'">已发布 HTML 正文</button>
              <button :aria-pressed="preview==='live'" :disabled="compiling" @click="compileCurrent">
                {{ compiling ? '正在本机编译…' : '编译当前修改并预览' }}
              </button>
            </div>
            <p v-if="preview==='live' && liveError" class="review-error" role="alert">{{ liveError }}。仍可查看已发布 HTML/SVG 或导出源码交由 CI 编译。</p>
            <div v-if="preview==='live' && liveSvg" class="review-live" v-html="liveSvg"></div>
            <p v-if="preview==='live' && !liveSvg && !liveError" role="status">正在初始化 Typst WebAssembly 并编译当前文本……</p>
            <iframe v-if="preview==='html'" :key="selected.id" :src="publishedHtml" :title="'Typst HTML '+selected.title" loading="lazy"></iframe>
            <div v-if="preview==='svg'" class="review-svg"><img :src="publishedSvg" :alt="'第 '+page+' 页已发布 Typst 原生 SVG'" /></div>
            <p v-if="preview!=='live'">已发布视图是 GitHub Actions 对仓库源码的编译结果；编辑后点击“编译当前修改并预览”才会查看本机改动。</p>
            <a :href="publishedHtml" target="_blank" rel="noopener">独立打开 HTML</a> ·
            <a :href="publishedSvg" target="_blank" rel="noopener">独立打开 SVG</a>
          </section>
        </div>
        <details v-if="scanUrl" class="review-scan" open>
          <summary>本地扫描参考图（不上传服务器）</summary>
          <img :src="scanUrl" :alt="'原扫描 PDF 第 '+page+' 页'" />
        </details>
        <p v-else>如需扫描对照，可选导入本地 ZIP 中的 <code>preview_scans/page-NNN.jpg</code>；仅查看和编辑公开 Typst 结果无需 ZIP。</p>
      </div>
    </template>
  </div>
</template>

<style scoped>
.unified-review{margin:1.1rem 0;font-size:.9rem}
.review-summary{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:.7rem;margin-bottom:1rem}
.review-summary>div{background:var(--vp-c-bg-soft);border:1px solid var(--vp-c-divider);border-radius:10px;padding:.75rem}
.review-summary strong{display:block;font-size:1.4rem;line-height:1.5}
.review-summary span{font-size:.77rem;color:var(--vp-c-text-2)}
.review-bar,.review-toolbar,.review-tabs{display:flex;gap:.5rem;align-items:end;flex-wrap:wrap;padding:.5rem 0}
.review-bar label,.review-toolbar label{display:flex;gap:.2rem;flex-direction:column;font-size:.79rem}
.review-bar input,.review-bar select,.review-toolbar input{background:var(--vp-c-bg);color:var(--vp-c-text-1);border:1px solid var(--vp-c-divider);padding:.4rem;border-radius:6px;max-width:220px}
.unified-review button{border:1px solid var(--vp-c-divider);border-radius:6px;padding:.4rem .6rem;cursor:pointer}
.unified-review button:hover:not(:disabled){border-color:var(--vp-c-brand-1)}
.unified-review button:disabled{opacity:.45;cursor:default}
.review-pages{display:grid;grid-template-columns:repeat(auto-fill,minmax(39px,1fr));gap:4px;max-height:200px;overflow:auto;padding:.5rem 0}
.review-pages button{font-size:.75rem;padding:.3rem .1rem}
.review-pages .active{outline:2px solid var(--vp-c-brand-1)}
.review-pages .accepted{background:var(--vp-c-green-soft)}
.review-pages .changed{border-color:var(--vp-c-brand-1);font-weight:bold}
.review-pages .issue:not(.active){border-style:dashed}
.review-current>h2{margin:1rem 0 .4rem;font-size:1.18rem}
.review-current>p{font-size:.81rem;color:var(--vp-c-text-2)}
.review-matrix{display:grid;grid-template-columns:1fr 1fr;gap:1rem}
.review-matrix section{background:var(--vp-c-bg-soft);padding:.75rem;border:1px solid var(--vp-c-divider);border-radius:8px}
.review-matrix h3,.review-code h3,.review-preview h3{margin:.3rem 0 .6rem;font-size:1rem}
.review-matrix p,.review-matrix li{font-size:.82rem}
.review-matrix ul{margin:.2rem 0 .65rem;padding-left:1.2rem}
.review-checklist{display:grid;grid-template-columns:1fr 1fr;gap:.4rem;font-size:.79rem}
.review-checklist span{font-size:.96rem}
.review-columns{display:grid;grid-template-columns:minmax(0,1fr) minmax(0,1fr);gap:.85rem}
.review-code,.review-preview{min-width:0}
.review-code textarea{width:100%;height:630px;min-height:350px;background:var(--vp-c-bg-soft);color:var(--vp-c-text-1);border:1px solid var(--vp-c-divider);border-radius:8px;padding:.85rem;font:12px/1.55 ui-monospace,monospace;tab-size:2;resize:vertical}
.review-code p,.review-preview p{font-size:.78rem;color:var(--vp-c-text-2);margin:.5rem 0}
.review-code h3 small,.review-preview h3 small{font-size:.72rem;color:var(--vp-c-text-2);font-weight:normal}
.review-preview iframe{width:100%;height:600px;border:1px solid var(--vp-c-divider);border-radius:8px;background:white}
.review-svg,.review-live{background:white;border:1px solid var(--vp-c-divider);border-radius:8px;height:600px;overflow:auto;padding:12px;color:black}
.review-svg img,.review-live :deep(svg){width:100%;height:auto;max-height:none}
.review-scan img{display:block;max-width:660px;width:100%;margin:1rem auto}
.review-scan{margin-top:1rem}
.review-error{color:var(--vp-c-danger-1)!important}
@media(max-width:940px){.review-columns,.review-matrix{grid-template-columns:1fr}.review-summary{grid-template-columns:repeat(2,minmax(0,1fr))}.review-code textarea{height:380px}.review-preview iframe,.review-svg,.review-live{height:470px}}
</style>

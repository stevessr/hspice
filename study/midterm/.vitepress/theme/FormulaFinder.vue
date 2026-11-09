<script setup lang="ts">
import { computed, nextTick, onMounted, onUnmounted, ref, watch } from 'vue'
import { withBase } from 'vitepress'
import {
  STORAGE_KEY, SESSION_KEY, decodeProgress, encodeProgress, recordAnswer, reviewStats,
  filterFormulaEntries, selectSession, selectPrioritizedSession, isDue,
  encodeSession, decodeSession, mergeProgressBackup, makeProgressBackup
} from './formula-review-core.mjs'

type Formula = {
  id: string; name: string; note: string; latex: string; html: string
  original_label: string; chapter: number; topic: string
  printed_page: number; pdf_page: number; source_route: string; source_line: number
}
type FormulaIndex = { format: string; total: number; entries: Formula[] }
type Rating = 'again' | 'hard' | 'good'
type ReviewRecord = {
  reviews: number; lapses: number; streak: number; rating: Rating
  reviewedAt: number; dueAt: number
}

const entries = ref<Formula[]>([])
const loading = ref(true)
const error = ref('')
const query = ref('')
const chapter = ref('all')
const kind = ref('all')
const status = ref('all')
const hidden = ref(false)
const revealed = ref<Set<string>>(new Set())
const showCount = ref(18)
const copyStatus = ref('')
const storageMessage = ref('')
const progress = ref<Record<string, ReviewRecord>>({})
const clock = ref(0)
const hydrated = ref(false)

// Practice mode freezes the current filtered selection into a finite session.
// Filtering, copying, skipping and browsing do not mark a card as mastered.
const mode = ref<'browse' | 'practice'>('browse')
const sessionSize = ref(15)
const sessionOrder = ref('priority')
const sessionIds = ref<string[]>([])
const cursor = ref(0)
const practiceRevealed = ref(false)
const sessionRatings = ref<Record<Rating | 'skipped', number>>({
  again: 0, hard: 0, good: 0, skipped: 0
})
type SavedSession = {
  ids: string[]; cursor: number; revealed: boolean
  ratings: Record<Rating | 'skipped', number>; updatedAt: number
}
const savedSession = ref<SavedSession | null>(null)
const practicePanel = ref<HTMLElement | null>(null)
let clockTimer: ReturnType<typeof setInterval> | undefined
onUnmounted(() => { if (clockTimer) clearInterval(clockTimer) })
const chapters = computed(() => [...new Set(entries.value.map(x => x.chapter))].sort((a, b) => a - b))
const matches = computed(() => filterFormulaEntries(entries.value, progress.value, {
  query: query.value, chapter: chapter.value, kind: kind.value,
  status: status.value, now: clock.value
}))
const visible = computed(() => matches.value.slice(0, showCount.value))
const remaining = computed(() => matches.value.length - visible.value.length)
const stats = computed(() => reviewStats(entries.value, progress.value, clock.value))
const current = computed(() => {
  const id = sessionIds.value[cursor.value]
  return id ? entries.value.find(x => x.id === id) : undefined
})

const sourceHref = (x: Formula) => withBase(x.source_route)
const reviewHref = (x: Formula) => withBase('/native-workbench') + '?page=' + x.pdf_page
const isShown = (x: Formula) => !hidden.value || revealed.value.has(x.id)

function toggle(id: string) {
  const changed = new Set(revealed.value)
  changed.has(id) ? changed.delete(id) : changed.add(id)
  revealed.value = changed
}
function resetFilters() {
  query.value = ''
  chapter.value = 'all'
  kind.value = 'all'
  status.value = 'all'
}
function dueLabel(record?: ReviewRecord) {
  if (!record) return '尚未复习'
  if (isDue(record, clock.value)) return '现在可复习'
  return '下次：' + new Date(record.dueAt).toLocaleDateString('zh-CN', {
    month: 'short', day: 'numeric'
  })
}
function ratingLabel(record?: ReviewRecord) {
  if (!record) return '未学习'
  return record.rating === 'good' ? '已掌握' :
    record.rating === 'hard' ? '需巩固' : '待重学'
}
function saveProgress(): boolean {
  try {
    localStorage.setItem(STORAGE_KEY, encodeProgress(progress.value))
    storageMessage.value = ''
    return true
  } catch {
    storageMessage.value = '浏览器禁止本地保存：本次练习仍可继续，刷新后记录可能丢失。'
    return false
  }
}
function answer(id: string, rating: Rating) {
  const old = progress.value[id]
  const now = Date.now()
  progress.value = { ...progress.value, [id]: recordAnswer(old, rating, now) }
  clock.value = now
  saveProgress()
}
function focusPractice() {
  nextTick(() => practicePanel.value?.focus())
}
function saveSession() {
  try {
    if (mode.value !== 'practice' || cursor.value >= sessionIds.value.length) {
      localStorage.removeItem(SESSION_KEY)
      savedSession.value = null
      return
    }
    const session: SavedSession = {
      ids: [...sessionIds.value], cursor: cursor.value,
      revealed: practiceRevealed.value, ratings: { ...sessionRatings.value },
      updatedAt: Date.now()
    }
    localStorage.setItem(SESSION_KEY, encodeSession(session))
    savedSession.value = session
  } catch {
    storageMessage.value = '当前浏览器无法保存练习断点，本次练习仍可继续。'
  }
}
function revealAnswer() {
  if (!current.value) return
  practiceRevealed.value = true
  saveSession()
  focusPractice()
}
function startSession() {
  if (!matches.value.length) return
  if (savedSession.value && !window.confirm('已有未完成的练习，开始新的一轮将覆盖当前断点。确定继续？')) return
  const chosen = sessionOrder.value === 'priority'
    ? selectPrioritizedSession(matches.value, progress.value, sessionSize.value, Date.now())
    : selectSession(matches.value, sessionSize.value, sessionOrder.value === 'shuffle')
  sessionIds.value = chosen.map(x => x.id)
  cursor.value = 0
  practiceRevealed.value = false
  sessionRatings.value = { again: 0, hard: 0, good: 0, skipped: 0 }
  mode.value = 'practice'
  saveSession()
  focusPractice()
}
function resumeSession() {
  if (!savedSession.value) return
  const session = savedSession.value
  sessionIds.value = [...session.ids]
  cursor.value = session.cursor
  practiceRevealed.value = session.revealed
  sessionRatings.value = { ...session.ratings }
  mode.value = 'practice'
  focusPractice()
}
function discardSession() {
  if (!savedSession.value ||
      !window.confirm('放弃未完成的一轮练习？已经完成的单卡复习记录会保留。')) return
  savedSession.value = null
  try { localStorage.removeItem(SESSION_KEY) } catch {}
}
function advance(rating?: Rating) {
  if (!current.value) return
  if (rating) {
    if (!practiceRevealed.value) return
    answer(current.value.id, rating)
    sessionRatings.value = { ...sessionRatings.value, [rating]: sessionRatings.value[rating] + 1 }
  } else {
    sessionRatings.value = { ...sessionRatings.value, skipped: sessionRatings.value.skipped + 1 }
  }
  practiceRevealed.value = false
  cursor.value += 1
  saveSession()
  focusPractice()
}
function exitSession() {
  saveSession()
  mode.value = 'browse'
  practiceRevealed.value = false
}
function downloadBackup() {
  try {
    const text = makeProgressBackup(progress.value)
    const href = URL.createObjectURL(new Blob([text], { type: 'application/json;charset=utf-8' }))
    const a = document.createElement('a')
    a.href = href
    a.download = 'hspice-formula-review-' + new Date().toISOString().slice(0, 10) + '.json'
    document.body.appendChild(a)
    a.click()
    a.remove()
    setTimeout(() => URL.revokeObjectURL(href), 2000)
  } catch {
    storageMessage.value = '导出失败，请检查浏览器的下载权限。'
  }
}
async function importBackup(event: Event) {
  const input = event.target as HTMLInputElement
  const file = input.files?.[0]
  if (!file) return
  try {
    if (file.size > 250_000) throw new Error('备份文件过大')
    const result = mergeProgressBackup(await file.text(), entries.value.map(x => x.id), progress.value)
    progress.value = result.records
    clock.value = Date.now()
    if (saveProgress()) {
      storageMessage.value = '导入完成：新增 ' + result.added + ' 项，更新 ' +
        result.newer + ' 项，保留本机 ' + result.kept + ' 项；忽略无效条目 ' + result.ignored + ' 项。'
    }
  } catch (error) {
    storageMessage.value = '导入失败：' + (error instanceof Error ? error.message : String(error))
  } finally {
    input.value = ''
  }
}
function onPracticeKeydown(event: KeyboardEvent) {
  const node = event.target as HTMLElement
  if (event.key === 'Escape') {
    event.preventDefault()
    exitSession()
    return
  }
  if (node && ['INPUT', 'TEXTAREA', 'SELECT', 'BUTTON', 'A'].includes(node.tagName)) return
  if (!current.value) {
    return
  } else if (!practiceRevealed.value && event.key === ' ') {
    event.preventDefault()
    revealAnswer()
  } else if (practiceRevealed.value && ['1', '2', '3'].includes(event.key)) {
    event.preventDefault()
    advance(({ '1': 'again', '2': 'hard', '3': 'good' } as const)[event.key as '1' | '2' | '3'])
  } else if (event.key === 'ArrowRight') {
    event.preventDefault()
    advance()
  }
}
async function copyLatex(x: Formula) {
  try {
    await navigator.clipboard.writeText(x.latex)
    copyStatus.value = '已复制「' + x.name + '」的 LaTeX'
  } catch {
    copyStatus.value = '复制失败，请在来源页选择公式文本'
  }
}
function clearProgress() {
  if (!window.confirm('确定清除本机保存的全部公式复习记录？此操作不可撤销。')) return
  progress.value = {}
  clock.value = Date.now()
  savedSession.value = null
  try { localStorage.removeItem(SESSION_KEY) } catch {}
  saveProgress()
}

watch([query, chapter, kind, status], () => {
  showCount.value = 18
  revealed.value = new Set()
  if (!hydrated.value) return
  // Shareable filters without changing the current page or exposing learning progress.
  const url = new URL(window.location.href)
  for (const key of ['q', 'chapter', 'kind', 'status']) url.searchParams.delete(key)
  if (query.value.trim()) url.searchParams.set('q', query.value.trim().slice(0, 120))
  if (chapter.value !== 'all') url.searchParams.set('chapter', chapter.value)
  if (kind.value !== 'all') url.searchParams.set('kind', kind.value)
  if (status.value !== 'all') url.searchParams.set('status', status.value)
  window.history.replaceState(window.history.state, '', url.pathname + url.search + url.hash)
})
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
    clock.value = Date.now()
    clockTimer = setInterval(() => { clock.value = Date.now() }, 60_000)
    try {
      progress.value = decodeProgress(localStorage.getItem(STORAGE_KEY) || '',
        data.entries.map(x => x.id)) as Record<string, ReviewRecord>
    } catch {
      storageMessage.value = '当前浏览器无法读取本地复习记录，本次复习仍可进行。'
    }
    try {
      savedSession.value = decodeSession(localStorage.getItem(SESSION_KEY) || '',
        data.entries.map(x => x.id)) as SavedSession | null
    } catch {
      savedSession.value = null
    }
    const url = new URLSearchParams(window.location.search)
    const q = url.get('q')
    if (q) query.value = q.slice(0, 120)
    const ch = url.get('chapter')
    if (ch && /^(?:[1-9]|10|11)$/.test(ch)) chapter.value = ch
    const k = url.get('kind')
    if (k === 'numbered' || k === 'derived') kind.value = k
    const s = url.get('status')
    if (s && ['new', 'due', 'weak', 'mastered'].includes(s)) status.value = s
    hydrated.value = true
  } catch (e) {
    error.value = e instanceof Error ? e.message : String(e)
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <section class="formula-finder" aria-label="教材公式检索与主动回忆复习">
    <p v-if="loading" role="status">正在加载公式与教材页码……</p>
    <p v-else-if="error" role="alert">{{ error }}。可转到
      <a :href="withBase('/reference/formula-index')">第 1—6 章公式表</a>或
      <a :href="withBase('/reference/formula-index-systems')">第 7—11 章公式表</a>。
    </p>
    <template v-else>
      <div class="review-overview" aria-label="本机学习进度">
        <div><strong>{{ stats.total }}</strong><span>教材公式卡片</span></div>
        <div><strong>{{ stats.reviewed }}</strong><span>已经复习</span></div>
        <div><strong>{{ stats.weak }}</strong><span>仍需巩固</span></div>
        <div><strong>{{ stats.due }}</strong><span>到期待复习</span></div>
      </div>
      <p v-if="storageMessage" class="finder-status" role="status">{{ storageMessage }}</p>

      <template v-if="mode === 'browse'">
        <div class="finder-controls">
          <div class="finder-search">
            <label for="formula-query">搜索名称、式号、用途或页码</label>
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
            <label for="formula-kind">公式出处类型</label>
            <select id="formula-kind" v-model="kind">
              <option value="all">全部类型</option>
              <option value="numbered">教材编号公式</option>
              <option value="derived">图示、例题与推导</option>
            </select>
          </div>
          <div>
            <label for="formula-status">复习进度</label>
            <select id="formula-status" v-model="status">
              <option value="all">全部卡片</option>
              <option value="new">从未复习</option>
              <option value="due">已到期</option>
              <option value="weak">仍需巩固</option>
              <option value="mastered">上次答对</option>
            </select>
          </div>
        </div>
        <div class="finder-toolbar">
          <p role="status">匹配 <strong>{{ matches.length }}</strong> / {{ entries.length }} 项</p>
          <label class="finder-switch">
            <input v-model="hidden" type="checkbox" /> 速查卡片先遮盖公式
          </label>
          <button type="button" :disabled="!query && chapter === 'all' && kind === 'all' && status === 'all'"
            @click="resetFilters">清空筛选</button>
        </div>
        <div v-if="savedSession" class="session-resume" role="status">
          <div>
            <strong>上次练习尚未完成</strong>
            <p>已完成 {{ savedSession.cursor }} / {{ savedSession.ids.length }} 张；
              继续练习不会重新抽卡，已评价的进度已保存。</p>
          </div>
          <button class="primary-button" type="button" @click="resumeSession">继续上次练习</button>
          <button type="button" @click="discardSession">放弃断点</button>
        </div>
        <div class="session-launch">
          <div>
            <strong>主动回忆练习</strong>
            <p>默认优先安排到期题和未学题。根据名称、公式条件先默写，再翻面给出评价。</p>
          </div>
          <label>练习数量
            <select v-model.number="sessionSize" aria-label="每次练习卡片数量">
              <option :value="10">10 张</option>
              <option :value="15">15 张</option>
              <option :value="30">30 张</option>
              <option :value="145">全部匹配</option>
            </select>
          </label>
          <label>练习顺序
            <select v-model="sessionOrder" aria-label="练习顺序">
              <option value="priority">优先到期与新卡</option>
              <option value="shuffle">随机打乱</option>
              <option value="source">教材顺序</option>
            </select>
          </label>
          <button class="primary-button" type="button" :disabled="matches.length === 0"
            @click="startSession">开始默写（{{ Math.min(matches.length, sessionSize) }} 张）</button>
        </div>
        <p v-if="copyStatus" class="finder-status" role="status">{{ copyStatus }}</p>
        <p v-if="matches.length === 0" class="finder-empty">
          当前筛选没有卡片。试试切换章节、清除关键词或选择“全部卡片”。
        </p>
        <div class="formula-grid">
          <article v-for="item in visible" :key="item.id" class="formula-card">
            <div class="formula-header">
              <strong>{{ item.name }}</strong>
              <small>第 {{ item.chapter }} 章</small>
            </div>
            <p class="formula-note">{{ item.note || item.topic }}</p>
            <div class="formula-math">
              <div v-if="isShown(item)" class="formula-svg"
                v-html="item.html" :aria-label="item.name + ' 的数学公式'"></div>
              <button v-else class="formula-reveal" type="button" @click="toggle(item.id)">
                <span>公式已遮盖</span><span>点击揭示答案</span>
              </button>
            </div>
            <div class="formula-meta">
              <span>{{ item.original_label }}</span>
              <span>印刷 p.{{ item.printed_page }} / PDF p.{{ item.pdf_page }}</span>
            </div>
            <p class="formula-progress">{{ ratingLabel(progress[item.id]) }} · {{ dueLabel(progress[item.id]) }}</p>
            <div class="formula-actions">
              <a :href="reviewHref(item)">教材对应页</a>
              <a :href="sourceHref(item)">公式原表</a>
              <button type="button" @click="copyLatex(item)">复制 LaTeX</button>
              <button v-if="hidden && revealed.has(item.id)" type="button" @click="toggle(item.id)">重新遮盖</button>
            </div>
          </article>
        </div>
        <div v-if="remaining > 0" class="finder-more">
          <button type="button" @click="showCount += 18">显示更多（剩余 {{ remaining }} 项）</button>
        </div>
        <details class="review-storage">
          <summary>学习记录与隐私</summary>
          <p>复习评价和未完成练习只保存在当前浏览器，不上传服务器。可以下载 JSON 备份，跨浏览器导入时按单卡最后复习时间合并，较新的记录优先；无效或不属于本教材的条目会被忽略。</p>
          <p>“不会”10 分钟后重学，“模糊”次日巩固，“会了”按 1 / 3 / 7 / 14 / 30 / 60 天递进安排。</p>
          <div class="backup-actions">
            <button type="button" @click="downloadBackup">导出复习记录 JSON</button>
            <label class="backup-file-label">导入记录并合并
              <input type="file" accept=".json,application/json" @change="importBackup" aria-label="导入复习记录 JSON" />
            </label>
            <button type="button" :disabled="stats.reviewed === 0" @click="clearProgress">清除本机复习记录</button>
          </div>
          <p>备份只包含公式卡片 ID、评价和复习日期，不包含原书全文或公式源代码。</p>
        </details>
      </template>

      <section v-else ref="practicePanel" class="practice-panel" tabindex="0"
        aria-label="公式默写练习" @keydown="onPracticeKeydown">
        <div class="practice-topbar">
          <span>默写练习 · {{ Math.min(cursor + 1, sessionIds.length) }} / {{ sessionIds.length }}</span>
          <button type="button" @click="exitSession">返回列表（保留断点）</button>
        </div>
        <progress :value="cursor" :max="sessionIds.length" aria-label="已完成卡片数"></progress>
        <template v-if="current">
          <p class="practice-locator">第 {{ current.chapter }} 章 · {{ current.original_label }} · 印刷 p.{{ current.printed_page }}</p>
          <h2 class="practice-title">{{ current.name }}</h2>
          <p class="practice-note"><strong>回忆提示：</strong>{{ current.note || current.topic }}</p>
          <div v-if="!practiceRevealed" class="practice-obscured">
            <p>请先写出公式，并说出变量意义与适用条件。</p>
            <button class="primary-button" type="button" @click="revealAnswer">
              显示公式答案
            </button>
            <small>聚焦练习区后按空格也可以揭示答案。</small>
          </div>
          <div v-else class="practice-answer">
            <div class="formula-svg" v-html="current.html" :aria-label="current.name + ' 的公式答案'"></div>
            <p class="practice-note">适用条件：{{ current.note || current.topic }}。先核对符号、近似前提，再评价掌握程度。</p>
            <div class="rating-controls" aria-label="评价本题掌握程度">
              <button type="button" @click="advance('again')">1 · 不会（10 分钟后）</button>
              <button type="button" @click="advance('hard')">2 · 模糊（明天）</button>
              <button class="primary-button" type="button" @click="advance('good')">3 · 会了（间隔复习）</button>
            </div>
          </div>
          <div class="practice-bottom">
            <a :href="reviewHref(current)" target="_blank" rel="noopener">教材对应页</a>
            <a :href="sourceHref(current)" target="_blank" rel="noopener">公式原表</a>
            <button type="button" @click="copyLatex(current)">复制 LaTeX</button>
            <button type="button" @click="advance()">跳过本张 →</button>
          </div>
          <p v-if="copyStatus" class="finder-status" role="status">{{ copyStatus }}</p>
          <p class="practice-help">键盘：空格揭示 · 揭示后按 1 / 2 / 3 评价 · → 跳过 · Esc 返回列表并保留断点</p>
        </template>
        <div v-else class="practice-finished">
          <h2>本轮练习完成</h2>
          <p>共 {{ sessionIds.length }} 张：会了 {{ sessionRatings.good }} · 模糊 {{ sessionRatings.hard }} ·
            不会 {{ sessionRatings.again }} · 跳过 {{ sessionRatings.skipped }}。</p>
          <p>评价已经保存到本机；建议先筛选“仍需巩固”，下次再复习到期卡片。</p>
          <button class="primary-button" type="button" @click="exitSession">返回卡片列表</button>
          <button type="button" @click="startSession">再练一轮</button>
        </div>
      </section>

      <p class="finder-footer">
        公式来自当前教材速查表，保留原书式号、条件和页码；“教材对应页”打开可编辑 Typst 校对页，
        不是扫描原图。复习记录不参与教材内容校验；涉及长/短沟道及线性/饱和区时须先核对模型前提。
      </p>
    </template>
  </section>
</template>

<style scoped>
.formula-finder { margin: 1rem 0 2rem; }
.formula-finder button { cursor:pointer; border:1px solid var(--vp-c-divider); border-radius:8px; padding:.5rem .75rem; font-size:.85rem; background:var(--vp-c-bg-soft); color:var(--vp-c-text-1); line-height:1.5; }
.formula-finder button:hover:not(:disabled) { border-color:var(--vp-c-brand-1); }
.formula-finder button:disabled { cursor:not-allowed; opacity:.42; }
.formula-finder :is(button,input,select,summary,a):focus-visible { outline:2px solid var(--vp-c-brand-1); outline-offset:3px; }
.formula-finder .primary-button { background:var(--vp-c-brand-1); border-color:var(--vp-c-brand-1); color:var(--vp-c-white); font-weight:600; }
.formula-finder .primary-button:hover:not(:disabled) { filter:brightness(.96); }
.review-overview { display:grid; grid-template-columns:repeat(4,minmax(0,1fr)); border:1px solid var(--vp-c-divider); border-radius:12px; margin:1rem 0; overflow:hidden; }
.review-overview div { display:flex; flex-direction:column; gap:.1rem; padding:.75rem 1rem; border-right:1px solid var(--vp-c-divider); }
.review-overview div:last-child { border-right:none; }
.review-overview strong { font-size:1.35rem; line-height:1.5; font-variant-numeric:tabular-nums; }
.review-overview span { color:var(--vp-c-text-2); font-size:.77rem; }
.finder-controls { display:grid; grid-template-columns:minmax(190px,2fr) repeat(3,minmax(110px,1fr)); gap:.7rem; margin-bottom:.75rem; }
.finder-controls label,.session-launch label { display:block; font-size:.8rem; color:var(--vp-c-text-2); margin-bottom:.35rem; }
.finder-controls :is(input,select),.session-launch select { width:100%; min-width:0; min-height:40px; margin-top:.2rem; padding:.5rem .6rem; font:inherit; font-size:.86rem; border:1px solid var(--vp-c-divider); border-radius:8px; color:var(--vp-c-text-1); background:var(--vp-c-bg-soft); }
.finder-toolbar { display:flex; flex-wrap:wrap; gap:.7rem; align-items:center; margin-bottom:.85rem; }
.finder-toolbar p { color:var(--vp-c-text-2); margin:0 auto 0 0; font-size:.85rem; }
.finder-switch { display:inline-flex; gap:.4rem; align-items:center; font-size:.83rem; }
.session-resume { display:flex; flex-wrap:wrap; gap:.65rem; align-items:center; padding:.85rem 1rem; margin-bottom:.85rem; border:1px solid var(--vp-c-brand-2); border-radius:12px; }
.session-resume>div { flex:1 1 220px; }
.session-resume strong { font-size:.9rem; }
.session-resume p { margin:.25rem 0; color:var(--vp-c-text-2); font-size:.8rem; line-height:1.6; }
.backup-actions { display:flex; align-items:center; flex-wrap:wrap; gap:.6rem; margin:1rem 0; }
.backup-file-label { position:relative; overflow:hidden; cursor:pointer; padding:.5rem .75rem; border:1px solid var(--vp-c-divider); border-radius:8px; background:var(--vp-c-bg-soft); color:var(--vp-c-text-1); font-size:.85rem; }
.backup-file-label:focus-within { outline:2px solid var(--vp-c-brand-1); outline-offset:2px; }
.backup-file-label input { position:absolute; inset:0; width:100%; height:100%; opacity:0; cursor:pointer; }
.session-launch { display:flex; gap:.65rem; align-items:end; flex-wrap:wrap; padding:1rem; margin-bottom:1.1rem; background:var(--vp-c-bg-soft); border:1px solid var(--vp-c-divider); border-radius:12px; }
.session-launch>div { flex:1 1 220px; }
.session-launch strong { font-size:.93rem; }
.session-launch p { margin:.25rem 0 0; color:var(--vp-c-text-2); font-size:.8rem; line-height:1.65; }
.session-launch label { flex:0 1 125px; }
.formula-grid { display:grid; grid-template-columns:repeat(2,minmax(0,1fr)); gap:.85rem; align-items:stretch; }
.formula-card { display:flex; flex-direction:column; min-width:0; border:1px solid var(--vp-c-divider); border-radius:12px; padding:.95rem 1rem; }
.formula-header { display:flex; gap:.6rem; justify-content:space-between; align-items:flex-start; line-height:1.45; }
.formula-header strong { font-size:.96rem; }
.formula-header small { white-space:nowrap; font-size:.74rem; color:var(--vp-c-text-3); }
.formula-note { color:var(--vp-c-text-2); font-size:.81rem; margin:.4rem 0 .5rem; line-height:1.7; }
.formula-math { display:flex; align-items:center; justify-content:center; flex:1; min-height:112px; max-width:100%; overflow-x:auto; padding:.7rem .2rem; }
.formula-svg { width:100%; max-width:100%; overflow-x:auto; text-align:center; padding:.15rem 0; }
.formula-svg :deep(svg) { max-width:100%; height:auto; }
.formula-reveal { display:flex; flex-direction:column; gap:.3rem; width:100%; min-height:85px; align-items:center; justify-content:center; border-style:dashed !important; }
.formula-reveal span:first-child { font-weight:600; }
.formula-meta { display:flex; flex-wrap:wrap; justify-content:space-between; gap:.25rem .6rem; padding-top:.6rem; border-top:1px solid var(--vp-c-divider); color:var(--vp-c-text-3); font-size:.75rem; }
.formula-progress { margin:.4rem 0 0; color:var(--vp-c-text-2); font-size:.73rem; }
.formula-actions { display:flex; align-items:center; flex-wrap:wrap; gap:.35rem .8rem; margin-top:.65rem; font-size:.8rem; }
.formula-actions a,.practice-bottom a { color:var(--vp-c-brand-1); text-decoration:none; }
.formula-actions a:hover,.practice-bottom a:hover { text-decoration:underline; }
.formula-actions button,.practice-bottom button { border:0; background:none; padding:0; color:var(--vp-c-brand-1); }
.finder-status,.finder-footer,.review-storage { font-size:.82rem; color:var(--vp-c-text-2); line-height:1.7; }
.finder-empty { padding:1.2rem; border:1px dashed var(--vp-c-divider); border-radius:10px; }
.finder-more { display:flex; justify-content:center; margin:1.2rem 0; }
.review-storage { margin:1.5rem 0 1rem; }
.review-storage summary { cursor:pointer; font-weight:600; }
.review-storage button { margin-bottom:.8rem; }
.practice-panel { padding:1rem; border:1px solid var(--vp-c-divider); border-radius:14px; outline-offset:3px; }
.practice-topbar,.practice-bottom { display:flex; gap:.65rem 1.25rem; align-items:center; justify-content:space-between; flex-wrap:wrap; }
.practice-topbar span { font-size:.84rem; color:var(--vp-c-text-2); }
.practice-panel progress { display:block; width:100%; height:.45rem; margin:.9rem 0 1.5rem; accent-color:var(--vp-c-brand-1); }
.practice-locator { font-size:.84rem; color:var(--vp-c-text-2); }
.practice-title { font-size:1.4rem; margin:.5rem 0 1rem; }
.practice-note { font-size:.9rem; line-height:1.75; color:var(--vp-c-text-2); }
.practice-obscured,.practice-answer { display:flex; flex-direction:column; justify-content:center; align-items:center; min-height:185px; padding:1rem; border:1px dashed var(--vp-c-divider); border-radius:12px; margin:1.2rem 0; text-align:center; }
.practice-obscured p { font-weight:500; margin:0 0 1rem; }
.practice-obscured small { display:block; color:var(--vp-c-text-3); margin-top:.6rem; }
.practice-answer .formula-svg { margin:1rem 0; font-size:1.2rem; }
.rating-controls { display:flex; gap:.6rem; flex-wrap:wrap; justify-content:center; }
.practice-bottom { justify-content:flex-start; font-size:.84rem; padding:.7rem 0; border-top:1px solid var(--vp-c-divider); }
.practice-bottom button:last-child { margin-left:auto; }
.practice-help { color:var(--vp-c-text-3); font-size:.76rem; line-height:1.6; }
.practice-finished { text-align:center; padding:2rem .5rem; }
.practice-finished h2 { font-size:1.3rem; }
.practice-finished button { margin:.45rem; }
@media (max-width:900px) { .finder-controls { grid-template-columns:repeat(2,minmax(0,1fr)); } .finder-search { grid-column:1/-1; } }
@media (max-width:760px) { .formula-grid { grid-template-columns:1fr; } .review-overview div { padding:.65rem .7rem; } }
@media (max-width:480px) {
  .review-overview { grid-template-columns:repeat(2,minmax(0,1fr)); }
  .review-overview div:nth-child(2) { border-right:none; }
  .review-overview div:nth-child(-n+2) { border-bottom:1px solid var(--vp-c-divider); }
  .finder-controls { grid-template-columns:1fr; }
  .finder-search { grid-column:auto; }
  .session-launch label { flex:1 1 120px; }
  .session-launch .primary-button { width:100%; }
  .session-resume button { flex:1 1 auto; }
  .rating-controls { flex-direction:column; width:100%; }
  .rating-controls button { width:100%; }
  .practice-bottom button:last-child { margin-left:0; }
}
@media (prefers-reduced-motion:reduce) { .formula-finder * { scroll-behavior:auto; } }
</style>

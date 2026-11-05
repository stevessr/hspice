# 445 页教材 · 原生 Typst 逐页校对工作台

选择本地完整校对工程 ZIP，在浏览器中并排查看原扫描页与可编辑的 Typst 源码。教材与修改**只在本机处理，不上传服务器**。这里提供的是检查与修订工作流，不会把仅有 OCR 的页面标记为完成的 1:1 复刻。

<script setup lang="ts">
import { computed, onBeforeUnmount, ref, shallowRef } from 'vue'
import { unzipSync } from 'fflate'

type PageQuality = { source_pdf_page: number; flags?: string[]; status?: string; editorial_note?: string }
const files = shallowRef<Record<string, Uint8Array>>({})
const quality = ref<PageQuality[]>([])
const loaded = ref(false)
const loading = ref(false)
const error = ref('')
const filename = ref('')
const page = ref(1)
const jump = ref(1)
const scanUrl = ref('')
const original = ref('')
const oldOcr = ref('')
const source = ref('')
const edited = ref<Record<number, string>>({})
const checked = ref<Record<number, boolean>>({})
const decoder = new TextDecoder('utf-8')
const total = 445

function locate(folder: string, n: number, ext: string) {
  const name = 'page-' + String(n).padStart(3, '0') + '.' + ext
  const key = Object.keys(files.value).find(s => s === folder + '/' + name || s.endsWith('/' + folder + '/' + name))
  return key ? files.value[key] : undefined
}
function locateNamed(name: string) {
  const key = Object.keys(files.value).find(s => s === name || s.endsWith('/' + name))
  return key ? files.value[key] : undefined
}
function showPage(n: number) {
  if (!loaded.value || !Number.isInteger(n) || n < 1 || n > total) return
  if (scanUrl.value) URL.revokeObjectURL(scanUrl.value)
  page.value = n
  jump.value = n
  const scan = locate('preview_scans', n, 'jpg')
  scanUrl.value = scan ? URL.createObjectURL(new Blob([scan as BlobPart], {type: 'image/jpeg'})) : ''
  original.value = decoder.decode(locate('editable_pages', n, 'typ') || new Uint8Array())
  oldOcr.value = decoder.decode(locate('raw_text', n, 'txt') || new Uint8Array())
  source.value = edited.value[n] ?? original.value
}
async function loadZip(ev: Event) {
  const input = ev.target as HTMLInputElement
  const file = input.files?.[0]
  if (!file) return
  error.value = ''
  loading.value = true
  try {
    const zip = unzipSync(new Uint8Array(await file.arrayBuffer()))
    const keys = Object.keys(zip).filter(s => /(?:^|\/)editable_pages\/page-\d{3}\.typ$/.test(s))
    const nums = new Set(keys.map(s => Number(s.match(/page-(\d{3})\.typ$/)?.[1])))
    if (keys.length !== total || nums.size !== total ||
        !Array.from({length: total}, (_, i) => nums.has(i + 1)).every(Boolean)) {
      throw Error('需要完整且页码连续的 445 个 Typst 文字页，当前 ZIP 不符合要求。')
    }
    if (scanUrl.value) URL.revokeObjectURL(scanUrl.value)
    scanUrl.value = ''
    files.value = zip
    filename.value = file.name
    edited.value = {}
    checked.value = {}
    const record = locateNamed('quality/pages.json')
    if (record) {
      try {
        const data = JSON.parse(decoder.decode(record))
        quality.value = Array.isArray(data.page_data) ? data.page_data : []
      } catch { quality.value = [] }
    }
    loaded.value = true
    showPage(1)
  } catch (e) {
    error.value = e instanceof Error ? e.message : '无法读取 ZIP'
  } finally {
    loading.value = false
    input.value = ''
  }
}
function recordEdit() {
  if (source.value === original.value) delete edited.value[page.value]
  else edited.value[page.value] = source.value
}
function saveAs(name: string, text: string) {
  const uri = URL.createObjectURL(new Blob([text], {type: 'text/plain;charset=utf-8'}))
  const anchor = document.createElement('a')
  anchor.href = uri
  anchor.download = name
  anchor.click()
  URL.revokeObjectURL(uri)
}
function exportCurrent() {
  saveAs('page-' + String(page.value).padStart(3, '0') + '.typ', source.value)
}
function exportPatch() {
  const patch = {
    kind: 'native-typst-private-review-v1',
    source_zip: filename.value,
    note: '初检不等于整页最终验收',
    edits: Object.entries(edited.value).map(([n, text]) => ({pdf_page: Number(n), typst: text})),
    preliminarily_reviewed: Object.entries(checked.value).filter(([, yes]) => yes).map(([n]) => Number(n))
  }
  saveAs('typst-revision-patch.json', JSON.stringify(patch, null, 2))
}
const flags = computed(() => quality.value[page.value - 1])
const editCount = computed(() => Object.keys(edited.value).length)
const reviewedCount = computed(() => Object.values(checked.value).filter(Boolean).length)
onBeforeUnmount(() => {if (scanUrl.value) URL.revokeObjectURL(scanUrl.value)})
</script>

<div class="book-workbench">
  <div class="book-workbench-input">
    <label>导入本地校对工程 ZIP <input type="file" accept=".zip,application/zip"
      :disabled="loading" @change="loadZip" /></label>
    <span v-if="loading">正在加载扫描与源码……</span>
    <span v-if="loaded">已加载 {{ filename }}</span>
    <p v-if="error" role="alert" class="book-error">{{ error }}</p>
  </div>
  <template v-if="loaded">
    <div class="book-workbench-nav">
      <button @click="showPage(page - 1)" :disabled="page <= 1">上一页</button>
      <label>原 PDF 页码 <input type="number" min="1" max="445"
        v-model.number="jump" @keyup.enter="showPage(jump)" /></label>
      <button @click="showPage(jump)">跳转</button>
      <button @click="showPage(page + 1)" :disabled="page >= 445">下一页</button>
      <span>已修改 {{ editCount }} 页 · 本地初检 {{ reviewedCount }} 页</span>
    </div>
    <div class="book-workbench-columns">
      <section class="book-workbench-scan">
        <h3>原书扫描 · PDF 第 {{ page }} 页</h3>
        <img v-if="scanUrl" :src="scanUrl" :alt="'原书扫描第 ' + page + ' 页" />
        <p v-else>ZIP 缺少该页扫描缩略图。请导入带有 preview_scans 目录的版本。</p>
      </section>
      <section class="book-workbench-code">
        <h3>可编辑 Typst · PDF 第 {{ page }} 页</h3>
        <p class="book-risk">机器风险：{{ flags?.flags?.join('、') || '无风险数据；不代表已核准' }}</p>
        <p v-if="flags?.editorial_note">{{ flags.editorial_note }}</p>
        <textarea v-model="source" @input="recordEdit" spellcheck="false"
          :aria-label="'第 ' + page + ' 页 Typst 源码'"></textarea>
        <div class="book-workbench-actions">
          <button @click="exportCurrent">导出本页 Typst</button>
          <label><input type="checkbox" :checked="checked[page] === true"
            @change="checked[page] = ($event.target as HTMLInputElement).checked" />
            我已人工初检（不代表整页验收）</label>
        </div>
        <details><summary>对比原 OCR 文字</summary><pre>{{ oldOcr }}</pre></details>
        <details><summary>查看修改前 Typst</summary><pre>{{ original }}</pre></details>
      </section>
    </div>
    <div class="book-workbench-actions">
      <button @click="exportPatch">导出全部改动与记录（JSON）</button>
    </div>
  </template>
  <p v-else-if="!loading">需要先导入本地 445 页校对 ZIP。服务器不接收文件，编辑完成后请导出修改记录。</p>
</div>

## 1:1 复刻验收标准

文件覆盖 445 页只是起点。完成一页还需要分别确认：逐字与段落、原生数学式、表格及数值、可编辑电路图、脚注与图号、页内元素位置与尺寸。任何一项缺失都不能将该页标记为正式验收。当前全书最终整页验收进度仍为 **0 / 445**。

你也可以查看已经整理的 [Typst 原生网页选段](/native-typst)，但这些选段不代表已经完成逐页重排。

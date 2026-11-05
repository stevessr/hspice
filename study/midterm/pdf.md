# PDF 分章阅读与资料库

本页提供**整册阅读、逐章阅读、练习与参考解答、教材九章复习精编**以及实验原始 PDF。所有新讲义均从 Typst 源文件编译；其中“教材精编”依据教材的九章结构重新组织知识点，不是教材原文影印件。

使用左侧目录切换文件。较大的 PDF 可以单独打开，移动设备上建议直接使用独立章节阅读。

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { withBase } from 'vitepress'

type PdfItem = {
  id: string
  title: string
  path: string
  group: string
  pages?: number
  format?: string
}
const expNames = ['一','二','三','四','五','六','七','八','九','十']
const experiments: PdfItem[] = expNames.map((ch, i) => ({
  id: 'experiment-' + String(i + 1),
  title: '实验' + ch + '（原始课程 PDF）',
  path: 'experiments/实验' + ch + '.pdf',
  group: '实验原始资料'
}))
const files = ref<PdfItem[]>([])
const loading = ref(true)
const note = ref('')
const query = ref('')
const category = ref('全部')
const current = ref('')
const groups = ['全部','整册','教材精编逐章','教材知识章节','实践训练','参考解答','速查附录','导读','实验原始资料']
const allFiles = computed(() => [...files.value, ...experiments])
const filtered = computed(() => allFiles.value.filter(item =>
  (category.value === '全部' || item.group === category.value) &&
  (item.title + ' ' + item.group).toLowerCase().includes(query.value.trim().toLowerCase())
))
const activeFile = computed(() => allFiles.value.find(item => item.id === current.value))
const activeUrl = computed(() => activeFile.value ? withBase('/' + activeFile.value.path) : '')
const selectedIndex = computed(() => filtered.value.findIndex(item => item.id === current.value))
function choose(item: PdfItem) { current.value = item.id }
function navigate(offset: number) {
  const next = filtered.value[selectedIndex.value + offset]
  if (next) current.value = next.id
}
onMounted(async () => {
  try {
    const resp = await fetch(withBase('/pdf-index.json'), { cache: 'no-store' })
    if (!resp.ok) throw new Error('章节索引尚未发布')
    const payload = await resp.json()
    if (!Array.isArray(payload.items)) throw new Error('章节索引格式错误')
    files.value = payload.items.filter((v: PdfItem) =>
      v && typeof v.id === 'string' && typeof v.title === 'string' &&
      typeof v.path === 'string' && !v.path.startsWith('/') && !v.path.includes('..')
    )
    const requested = new URLSearchParams(window.location.search).get('doc')
    current.value = files.value.find(x => x.id === requested)?.id ||
      files.value.find(x => x.id === 'review-full')?.id || files.value[0]?.id || experiments[0].id
  } catch (error) {
    note.value = '分章讲义尚未发布或暂不可用；以下仍可阅读实验原始 PDF。'
    current.value = experiments[0].id
  } finally {
    loading.value = false
  }
})
</script>

<div class="pdf-library">
  <aside class="pdf-library-sidebar" aria-label="PDF 资料目录">
    <label class="pdf-library-label" for="pdf-search">检索标题</label>
    <input id="pdf-search" type="search" v-model="query" placeholder="例如 MOS、反相器、附录" class="pdf-library-search" />
    <label class="pdf-library-label" for="pdf-group">资料类别</label>
    <select id="pdf-group" v-model="category" class="pdf-library-select">
      <option v-for="group in groups" :key="group" :value="group">{{ group }}</option>
    </select>
    <p v-if="loading" class="pdf-library-status">正在读取章节列表……</p>
    <p v-if="note" class="pdf-library-status" role="status">{{ note }}</p>
    <p class="pdf-library-count">当前显示 {{ filtered.length }} 份资料</p>
    <nav class="pdf-library-list" aria-label="选择 PDF 文件">
      <button v-for="item in filtered" :key="item.id" type="button"
        :class="['pdf-library-item', { 'is-active': current === item.id }]"
        :aria-current="current === item.id ? 'page' : undefined"
        @click="choose(item)">
        <span class="pdf-library-item-name">{{ item.title }}</span>
        <span class="pdf-library-item-meta">{{ item.group }}<template v-if="item.pages"> · {{ item.pages }} 页</template></span>
      </button>
    </nav>
  </aside>

  <section class="pdf-library-main" aria-label="PDF 阅读器">
    <div class="pdf-library-head">
      <strong>{{ activeFile?.title || '请选择 PDF 文件' }}</strong>
      <span v-if="activeFile?.pages" class="pdf-library-count">{{ activeFile.pages }} 页</span>
    </div>
    <div class="pdf-library-toolbar" v-if="activeFile">
      <button type="button" @click="navigate(-1)" :disabled="selectedIndex <= 0">上一份</button>
      <button type="button" @click="navigate(1)" :disabled="selectedIndex < 0 || selectedIndex >= filtered.length-1">下一份</button>
      <a :href="activeUrl" target="_blank" rel="noopener noreferrer">新窗口阅读</a>
      <a :href="activeUrl" download>下载 PDF</a>
    </div>
    <iframe v-if="activeFile" class="pdf-library-frame" :key="activeFile.path"
      :src="activeUrl + '#toolbar=1&navpanes=0&view=FitH'"
      :title="'在线阅读：' + activeFile.title" loading="lazy"></iframe>
    <p v-else class="pdf-library-status">请选择目录中的资料。</p>
    <p class="pdf-library-footnote">阅读器使用浏览器内置 PDF 功能。移动浏览器可能仅提供下载；可选择“新窗口阅读”。章节 PDF 均为独立文件，便于定位、分享与打印。</p>
  </section>
</div>

## 使用说明

**需要系统复习：**选择“教材九章复习精编（全册）”或对应的“教材精编逐章”。**准备期中考试：**优先查看“期中复习完整讲义”，再进入“实践训练”和“参考解答”。**核对原实验：**选择“实验原始资料”。

教材九章知识精编以教材的章节主题为线索重新讲解，并增加公式、概念辨析与练习提示；不包含原书扫描页，也不表示所有拓展章节都属于期中考试范围。正文还可以直接从 [系统复习 Markdown](/content/00-reading-guide) 和 [教材复习结构](/textbook) 阅读。

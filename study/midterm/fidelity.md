# 445 页 1:1 重排验收矩阵

本页面追踪《数字集成电路分析与设计——深亚微米工艺（第三版）》扫描 PDF 的每一页，分别检查可编辑文字、数学公式、表格、图形、图注、脚注、版式和 Typst 网页导出。**OCR 覆盖率不是复刻完成率**；只有提交完整证据并通过全部检查的页面才算验收。

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { withBase } from 'vitepress'
type QA = {
  pdf_page: number
  editorial_state: string
  checks: Record<string, boolean>
  evidence: Record<string, string>
  unresolved: string[]
  notes: string
}
const segments = [
  { key:'all', name:'全部 445 页', first:1,last:445 },
  { key:'front', name:'前置页', first:1,last:19 },
  { key:'1', name:'第 1 章', first:20,last:46 },
  { key:'2', name:'第 2 章', first:47,last:86 },
  { key:'3', name:'第 3 章', first:87,last:126 },
  { key:'4', name:'第 4 章', first:127,last:166 },
  { key:'5', name:'第 5 章', first:167,last:207 },
  { key:'6', name:'第 6 章', first:208,last:253 },
  { key:'7', name:'第 7 章', first:254,last:291 },
  { key:'8', name:'第 8 章', first:292,last:321 },
  { key:'9', name:'第 9 章与后续', first:322,last:445 }
]
const fieldNames: Record<string, string> = {
 text_complete:'正文准确完整',math_complete:'公式及编号准确',
 tables_complete:'表格可编辑',figures_editable:'图形可编辑且忠实',
 captions_references_complete:'图注与交叉引用',
 footnotes_headers_complete:'页眉、脚注与页码',
 layout_compared:'与原页版式比对',
 typst_html_compiled:'Typst 网页编译通过'
}
const pages = ref<QA[]>([])
const loading = ref(true)
const error = ref('')
const group = ref('all')
const current = ref(26)
const filter = ref('all')
const selectedSegment = computed(() => segments.find(x=>x.key===group.value) || segments[0])
const selected = computed(() => pages.value.find(x=>x.pdf_page===current.value))
function accepted(p: QA): boolean {
 const evidence = p.evidence || {}
 return Object.keys(fieldNames).every(k=>p.checks?.[k]===true)
   && Boolean(evidence.reference_scan_sha256 && evidence.typst_source_sha256
     && evidence.reviewer && evidence.reviewed_at && evidence.comparison_notes)
}
const approved = computed(() => pages.value.filter(accepted).length)
const listed = computed(() => pages.value.filter(p=>{
 const matchGroup=p.pdf_page>=selectedSegment.value.first && p.pdf_page<=selectedSegment.value.last
 if(!matchGroup)return false
 if(filter.value==='issues')return p.unresolved?.length>0
 if(filter.value==='accepted')return accepted(p)
 return true
}))
onMounted(async()=>{
 try {
  const response=await fetch(withBase('/native-fidelity.json'),{cache:'no-store'})
  if(!response.ok)throw new Error('页面验收数据不可用')
  const info=await response.json()
  if(info.source_pages!==445 || !Array.isArray(info.pages) || info.pages.length!==445)throw new Error('验收页码映射不完整')
  pages.value=info.pages
 }catch(e){error.value=String(e)}finally{loading.value=false}
})
</script>

<div class="fidelity-panel">
  <div class="fidelity-top">
    <div><strong>严格验收：{{ approved }} / 445 页</strong><p>绿色为八项条件及校对证据全部通过；灰色代表尚未验收。可查看每页待修复项。</p></div>
    <progress :value="approved" max="445" aria-label="已验收原书页数"></progress>
  </div>
  <p v-if="loading" role="status">正在读取逐页验收清单……</p>
  <p v-if="error" role="alert">{{ error }}</p>
  <div v-if="pages.length">
    <div class="fidelity-filters">
      <label>原书范围
        <select v-model="group"><option v-for="section in segments" :key="section.key" :value="section.key">{{ section.name }}</option></select>
      </label>
      <label>过滤
        <select v-model="filter"><option value="all">全部页</option><option value="issues">明确已定位的缺项</option><option value="accepted">验收通过</option></select>
      </label>
    </div>
    <div class="fidelity-grid" role="group" aria-label="选择原书页码">
      <button v-for="page in listed" :key="page.pdf_page" type="button"
        :class="{active:page.pdf_page===current,accepted:accepted(page),issue:page.unresolved?.length}"
        :aria-pressed="page.pdf_page===current" :aria-label="'原 PDF 第 '+page.pdf_page+' 页'"
        @click="current=page.pdf_page">{{ page.pdf_page }}</button>
    </div>
    <div v-if="!listed.length" class="fidelity-empty">当前过滤条件下没有匹配页面。</div>
    <section v-if="selected" class="fidelity-detail">
      <h3>原 PDF 第 {{ selected.pdf_page }} 页</h3>
      <p><strong>编辑状态：</strong>{{ selected.editorial_state }}；<strong>1:1 验收：</strong>{{ accepted(selected)?'已通过':'未完成' }}</p>
      <p>{{ selected.notes }}</p>
      <div class="fidelity-checks">
        <div v-for="(name,key) in fieldNames" :key="key">
          <span :aria-label="selected.checks?.[key] ? '已完成' : '待验证'">{{ selected.checks?.[key] ? '✓' : '○' }}</span> {{ name }}
        </div>
      </div>
      <h4>明确已定位的缺项</h4>
      <ul v-if="selected.unresolved?.length"><li v-for="item in selected.unresolved" :key="item">{{ item }}</li></ul>
      <p v-else>此页尚未逐元素审查，不能因缺项列表为空而视为正确。</p>
      <p>参照已发布的 <a :href="withBase('/native-typst')">Typst 精修选段预览</a>。网站不公开整本第三方教材扫描图；逐页原扫描与机器草稿保存在用户本地校对工程中。</p>
    </section>
  </div>
</div>

## 完整页的验收标准

必须同时确认：文字完整且准确、公式与编号可编辑、表格不是截图、全部电路图和示意图是可编辑图形、图注与交叉引用正确、脚注页眉完整、与原扫描逐页对照、Typst HTML 导出成功。**每页还需记录原扫描与源文件哈希、审校人员和对照记录。**

本页面只呈现质量事实，不会通过“已自动识别”“文件存在”“浏览器能打开”就将页面变成绿色。只有 445 页全部通过才会把整本教材标记为完成。

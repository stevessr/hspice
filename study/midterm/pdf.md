# PDF 在线阅览

可在下方切换**复习讲义 PDF**与仓库中实验一至实验十的原始 PDF。PDF 文件由浏览器原生预览；部分移动端浏览器可能改为直接下载，可使用下方“新窗口打开”。

<script setup lang="ts">
import { ref, computed } from 'vue'
import { withBase } from 'vitepress'
const files = [
  { label: '期中复习讲义（Typst 自动生成）', path: 'midterm-review.pdf' },
  { label: '实验一', path: 'experiments/实验一.pdf' },
  { label: '实验二', path: 'experiments/实验二.pdf' },
  { label: '实验三', path: 'experiments/实验三.pdf' },
  { label: '实验四', path: 'experiments/实验四.pdf' },
  { label: '实验五', path: 'experiments/实验五.pdf' },
  { label: '实验六', path: 'experiments/实验六.pdf' },
  { label: '实验七', path: 'experiments/实验七.pdf' },
  { label: '实验八', path: 'experiments/实验八.pdf' },
  { label: '实验九', path: 'experiments/实验九.pdf' },
  { label: '实验十（原始资料，尚未纳入九项实验复习提纲）', path: 'experiments/实验十.pdf' }
]
const selected = ref(files[0].path)
const currentUrl = computed(() => withBase('/' + selected.value))
</script>

<div class="pdf-controls">
  <label for="pdf-choice">选择文件：</label>
  <select id="pdf-choice" v-model="selected" aria-label="选择要预览的 PDF">
    <option v-for="item in files" :key="item.path" :value="item.path">{{ item.label }}</option>
  </select>
  <a :href="currentUrl" target="_blank" rel="noopener noreferrer">新窗口打开 / 下载 PDF</a>
</div>

<iframe class="pdf-viewer" :src="currentUrl" title="PDF 在线预览" loading="lazy"></iframe>

::: tip 阅读说明
网页端也可使用[系统复习 Markdown](/content/00-reading-guide)和[实践题库](/content/practice/)逐章阅读。网页与 PDF 共用课程知识内容，PDF 为自动构建的打印版。
:::

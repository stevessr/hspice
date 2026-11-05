# 期中复习在线自测

本页提供一组独立编写的概念检测题，涵盖 MOS 工作区域、反相器、逻辑门、锁存器及 HSPICE。选择完成后提交即可显示得分、正确选项与逐题解释。计算题均采用题目明确给定的理想化条件，**不代替真实工艺库仿真或正式考试试题**。

<script setup lang="ts">
import { computed, ref } from 'vue'

type Question = {
  id: number
  stem: string
  options: string[]
  correct: number
  explanation: string
}
const questions: Question[] = [
  {
    id: 1, stem: '若 NMOS 的栅极对地为 1.2 V，源极对地为 0.2 V，则 VGS 为多少？',
    options: ['0.2 V', '1.0 V', '1.2 V', '1.4 V'], correct: 1,
    explanation: 'VGS = VG − VS = 1.2 − 0.2 = 1.0 V。必须以源极为参考。'
  },
  {
    id: 2, stem: '长沟道 NMOS 中，VGS=1.0 V、VTH=0.4 V。进入饱和区的 VDS 条件是？',
    options: ['VDS≥0.2 V', 'VDS≥0.4 V', 'VDS≥0.6 V', 'VDS≥1.4 V'], correct: 2,
    explanation: '饱和边界 VDS = VGS − VTH = 0.6 V；这是长沟道近似，不是任意工艺的精确判据。'
  },
  {
    id: 3, stem: '保持其他条件不变时，将理想长沟道 MOS 的宽度 W 加倍，饱和漏电流如何变化？',
    options: ['约减半', '不变', '约加倍', '一定增至四倍'], correct: 2,
    explanation: '平方律中 ID 与 W/L 成正比，宽度加倍时理想电流约加倍；实际模型可能偏离。'
  },
  {
    id: 4, stem: '为什么 NMOS 传输高电平可能出现阈值电压损失？',
    options: ['源电位升高使 VGS 减小', '栅极没有电容', '漏端电位永远为 0', '沟道宽度不影响电流'], correct: 0,
    explanation: '源端升高使有效栅源电压下降，还可能发生体效应，最终使导通能力减弱。'
  },
  {
    id: 5, stem: '理想 CMOS 反相器在稳定逻辑状态下为什么静态功耗较低？',
    options: ['上下管持续强导通', '没有持续导通的 VDD 至地通路', '所有电流恒为零', '不存在寄生电容'], correct: 1,
    explanation: '在理想稳定的高、低逻辑状态，互补管不会共同建立持续强导通的直流通路。'
  },
  {
    id: 6, stem: '高电平噪声容限 NMH 的定义是哪一个？',
    options: ['VOH − VIH', 'VIL − VOL', 'VIH − VIL', 'VOH − VOL'], correct: 0,
    explanation: 'NMH = VOH − VIH；低电平噪声容限 NML = VIL − VOL。'
  },
  {
    id: 7, stem: '两输入 CMOS NAND 门的 NMOS 下拉网络如何连接？',
    options: ['两支并联', '两支串联', '只有一只', '与输入无关'], correct: 1,
    explanation: 'NAND 仅在两个输入全为 1 时下拉，因此 NMOS 串联；PMOS 对偶并联。'
  },
  {
    id: 8, stem: '两输入 CMOS NOR 门的 PMOS 上拉网络如何连接？',
    options: ['两支串联', '两支并联', '只有一只', '持续截止'], correct: 0,
    explanation: 'NOR 仅在两个输入全为 0 时上拉，因此 PMOS 串联；NMOS 对偶并联。'
  },
  {
    id: 9, stem: '若 2:1 MUX 约定 S=1 选择 A、S=0 选择 B，则其输出为？',
    options: ['A+B', 'AB', 'AS+B·¬S', 'A·¬S+BS'], correct: 2,
    explanation: '按 Shannon 展开：F = AS + B¬S；注意不同教材可能交换输入端编号。'
  },
  {
    id: 10, stem: '低有效 NAND 型 SR 锁存器中，S̅=0、R̅=1 对应什么操作？',
    options: ['复位', '置位', '保持', '不允许'], correct: 1,
    explanation: 'S̅ 拉低激活置位，Q=1；当两输入都为 0 时才是不允许状态。'
  },
  {
    id: 11, stem: 'JK 触发器在 J=K=1、有效触发时，下一状态如何变化？',
    options: ['始终置 0', '保持不变', '翻转', '始终置 1'], correct: 2,
    explanation: '在理想 JK 状态表中 J=K=1 是翻转条件；具体触发沿取决于结构。'
  },
  {
    id: 12, stem: '应使用哪一种 HSPICE 分析获得反相器的静态电压传输曲线？',
    options: ['.tran', '.dc', '.ac', '.measure tran'], correct: 1,
    explanation: '.dc 扫描输入直流电压并读取输出，得到稳态 VTC。'
  },
  {
    id: 13, stem: '测量电压源 I(VDD) 为负，是否一定代表电路有故障？',
    options: ['一定有故障', '不一定，需结合 SPICE 的电流正向定义', '必须将电源反接', '表示交流电压为负'], correct: 1,
    explanation: 'SPICE 的电压源电流通常以流入电源正端为正。供电时记录值可能为负。'
  },
  {
    id: 14, stem: '若其他参数保持不变，理想动态开关功耗与时钟频率的关系是？',
    options: ['与频率成正比', '与频率成反比', '与频率平方成正比', '完全无关'], correct: 0,
    explanation: '常用近似 Pdyn = α C VDD² f；其中 α 为活动因子。'
  }
]

const selected = ref<Record<number, number>>({})
const submitted = ref(false)
const answered = computed(() => Object.keys(selected.value).length)
const score = computed(() => questions.reduce((n, q) => n + (selected.value[q.id] === q.correct ? 1 : 0), 0))
function resetQuiz() {
  selected.value = {}
  submitted.value = false
}
</script>

<div class="review-quiz">
  <p class="review-quiz-progress" aria-live="polite">已作答 {{ answered }} / {{ questions.length }} 题</p>
  <fieldset v-for="q in questions" :key="q.id" class="review-quiz-question">
    <legend><strong>{{ q.id }}. {{ q.stem }}</strong></legend>
    <label v-for="(option, index) in q.options" :key="index" class="review-quiz-option">
      <input type="radio" :name="'question-' + q.id" :value="index" v-model="selected[q.id]" :disabled="submitted" />
      <span>{{ option }}</span>
    </label>
    <p v-if="submitted" :class="selected[q.id] === q.correct ? 'review-correct' : 'review-incorrect'">
      {{ selected[q.id] === q.correct ? '回答正确' : '参考答案：' + q.options[q.correct] }}。
      {{ q.explanation }}
    </p>
  </fieldset>
  <div class="review-quiz-actions">
    <button v-if="!submitted" type="button" :disabled="answered===0" @click="submitted=true">提交并查看解析</button>
    <button v-else type="button" @click="resetQuiz">重新作答</button>
    <strong v-if="submitted" role="status">得分：{{ score }} / {{ questions.length }}</strong>
  </div>
</div>

## 进一步练习

在线自测仅检查核心概念。涉及公式推导、电压传输曲线、HSPICE 网表和实验波形判读时，仍应完成 [五组专题实践题](./content/practice/index.md) 并对照独立的参考解答。原始实验资料可在 [PDF 在线阅读页](./pdf.md) 查阅。

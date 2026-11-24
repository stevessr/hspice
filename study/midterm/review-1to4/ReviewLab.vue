<script setup lang="ts">
import { computed, ref } from 'vue'
import { VDD, rcTauNs, rcOutput, bodyThreshold, mosDrainMicroamps, cmosVout, cmosSwitchingPoint } from './lab-core.mjs'

type Lab = 'rc' | 'mos' | 'cmos'
const mode = ref<Lab>('rc')
const rK = ref(10)
const cF = ref(100)
const vgs = ref(1)
const vsb = ref(0)
const width = ref(2)
const ratio = ref(2)

const xMax = computed(() => mode.value === 'rc' ? 6 : 1.2)
const vt = computed(() => bodyThreshold(vsb.value))
const beta = computed(() => 200 * width.value / 0.2)
const yMax = computed(() => mode.value === 'mos'
  ? Math.max(20, mosDrainMicroamps(vgs.value, 1.2, beta.value, vt.value) * 1.15)
  : VDD)
const samples = computed(() => Array.from({ length: 241 }, (_, i) => {
  const x = xMax.value * i / 240
  const y = mode.value === 'rc' ? rcOutput(x, rK.value, cF.value)
    : mode.value === 'mos' ? mosDrainMicroamps(vgs.value, x, beta.value, vt.value)
    : cmosVout(x, ratio.value)
  return [x, y]
}))
const px = (x: number) => 58 + 612 * x / xMax.value
const py = (y: number) => 271 - 220 * y / yMax.value
const linePoints = computed(() => samples.value.map(([x,y]) => px(x).toFixed(1)+','+py(y).toFixed(1)).join(' '))
const diagonal = computed(() => '58,271 670,51')
const metric = computed(() => {
  if (mode.value === 'rc') return 'τ = ' + rcTauNs(rK.value,cF.value).toFixed(3) + ' ns；t50 ≈ ' + (Math.log(2)*rcTauNs(rK.value,cF.value)).toFixed(3)+' ns'
  if (mode.value === 'mos') return 'VTH = '+vt.value.toFixed(3)+' V；VOV = '+Math.max(0,vgs.value-vt.value).toFixed(3)+' V；ID(1.2V) = '+mosDrainMicroamps(vgs.value,1.2,beta.value,vt.value).toFixed(1)+' µA'
  return 'βp/βn = '+(ratio.value/2).toFixed(2)+'；开关点 VM ≈ '+cmosSwitchingPoint(ratio.value).toFixed(3)+' V'
})
const deck = computed(() => {
  const pre = 'Browser study lab - HSPICE educational deck\n.option post=2 probe\n'
  if (mode.value === 'rc') return pre +
    'VIN in 0 PULSE(0 1.2 0.2n 10p 10p 5n 10n)\n' +
    'R1 in out ' + rK.value + 'k\nC1 out 0 ' + cF.value + 'f\n' +
    '.tran 2p 8n\n.probe tran v(in) v(out)\n.end\n'
  if (mode.value === 'mos') return pre +
    '.model NMOD NMOS (LEVEL=1 VTO=0.4 KP=200u GAMMA=0.45 PHI=0.7 LAMBDA=0.02)\n' +
    'VGS g 0 DC ' + vgs.value + '\nVDS d 0 DC 0\n' +
    'VBODY b 0 DC -' + vsb.value + '\n' +
    'M1 d g 0 b NMOD W=' + width.value + 'u L=0.2u\n' +
    '.dc VDS 0 1.2 0.01\n.probe dc v(d) i(VDS)\n.end\n'
  return pre +
    '.model NMOD NMOS (LEVEL=1 VTO=0.4 KP=200u LAMBDA=0.02)\n' +
    '.model PMOD PMOS (LEVEL=1 VTO=-0.4 KP=100u LAMBDA=0.02)\n' +
    'VDD vdd 0 DC 1.2\nVIN in 0 DC 0\n' +
    'MN out in 0 0 NMOD W=0.4u L=0.2u\n' +
    'MP out in vdd vdd PMOD W='+(0.4*ratio.value).toFixed(3)+'u L=0.2u\n' +
    '.dc VIN 0 1.2 0.005\n.probe dc v(in) v(out) i(VDD)\n.end\n'
})
function downloadDeck() {
  const blob = new Blob([deck.value], { type: 'text/plain;charset=utf-8' })
  const url = URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = 'review-' + mode.value + '.sp'
  a.click()
  URL.revokeObjectURL(url)
}
</script>

<template>
<div class="iclab">
  <div class="iclab-tabs" role="group" aria-label="实验类型">
    <button type="button" :aria-pressed="mode==='rc'" @click="mode='rc'">RC充电与延迟</button>
    <button type="button" :aria-pressed="mode==='mos'" @click="mode='mos'">NMOS输出特性</button>
    <button type="button" :aria-pressed="mode==='cmos'" @click="mode='cmos'">CMOS反相器 VTC</button>
  </div>
  <div class="iclab-controls">
    <template v-if="mode==='rc'">
      <label>电阻 R = {{ rK }} kΩ<input type="range" min="2" max="30" step="1" v-model.number="rK"></label>
      <label>负载 C = {{ cF }} fF<input type="range" min="20" max="300" step="10" v-model.number="cF"></label>
    </template>
    <template v-else-if="mode==='mos'">
      <label>栅源电压 VGS = {{ vgs.toFixed(2) }} V<input type="range" min="0.2" max="1.2" step="0.05" v-model.number="vgs"></label>
      <label>源体偏压 VSB = {{ vsb.toFixed(2) }} V<input type="range" min="0" max="0.7" step="0.05" v-model.number="vsb"></label>
      <label>沟道宽度 W = {{ width.toFixed(1) }} μm<input type="range" min="0.4" max="4" step="0.2" v-model.number="width"></label>
    </template>
    <template v-else>
      <label>PMOS/NMOS 宽度比 Wp/Wn = {{ ratio.toFixed(1) }}<input type="range" min="0.5" max="5" step="0.1" v-model.number="ratio"></label>
      <div class="iclab-hint">固定 Wn=0.4 μm，Ln=Lp=0.2 μm，VDD=1.2 V。宽度比2对应教学模型的 βp=βn。</div>
    </template>
  </div>
  <div class="iclab-metric" role="status">{{ metric }}</div>
  <svg class="iclab-plot" viewBox="0 0 700 310" role="img" :aria-label="mode==='rc'?'RC阶跃曲线':mode==='mos'?'NMOS漏极电流与漏源电压': 'CMOS反相器电压传输曲线'">
    <rect x="58" y="51" width="612" height="220" fill="none" stroke="currentColor" stroke-opacity=".22" />
    <line v-for="i in 5" :key="'gx'+i" :x1="58+(i-1)*153" y1="51" :x2="58+(i-1)*153" y2="271" stroke="currentColor" stroke-opacity=".09"/>
    <line v-for="i in 5" :key="'gy'+i" x1="58" :y1="51+(i-1)*55" x2="670" :y2="51+(i-1)*55" stroke="currentColor" stroke-opacity=".09"/>
    <polyline v-if="mode==='cmos'" :points="diagonal" fill="none" stroke="#a0a0a0" stroke-width="1.5" stroke-dasharray="6,7"/>
    <polyline :points="linePoints" fill="none" stroke="#2689bc" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
    <text x="58" y="31" fill="currentColor" font-size="15">{{ mode==='mos'?'漏电流 ID（µA）':'输出电压（V）' }}</text>
    <text x="364" y="301" fill="currentColor" font-size="14" text-anchor="middle">{{ mode==='rc'?'时间 t（ns）':mode==='mos'?'漏源电压 VDS（V）':'输入电压 Vin（V）' }}</text>
    <text x="50" y="55" fill="currentColor" font-size="13" text-anchor="end">{{ yMax.toFixed(mode==='mos'?0:1) }}</text>
    <text x="50" y="274" fill="currentColor" font-size="13" text-anchor="end">0</text>
    <text x="670" y="289" fill="currentColor" font-size="13" text-anchor="end">{{ xMax.toFixed(1) }}</text>
  </svg>
  <p class="iclab-hint">曲线根据理想化方程即时计算；这不是服务器端 HSPICE、BSIM3 或真实 PDK 仿真。可下载相应 HSPICE 网表到本机进一步验证。</p>
  <details class="iclab-deck">
    <summary>查看当前参数生成的 HSPICE 网表</summary>
    <pre>{{ deck }}</pre>
  </details>
  <button class="iclab-download" type="button" @click="downloadDeck">下载当前参数 .sp 网表</button>
</div>
</template>

<style scoped>
.iclab {border:1px solid var(--vp-c-divider);border-radius:14px;padding:20px;margin:18px 0;background:var(--vp-c-bg-soft);color:var(--vp-c-text-1)}
.iclab-tabs {display:flex;gap:8px;flex-wrap:wrap;margin-bottom:14px}
.iclab-tabs button{border:1px solid var(--vp-c-divider);border-radius:7px;padding:7px 12px;background:var(--vp-c-bg);font-weight:600;cursor:pointer}
.iclab-tabs button[aria-pressed=true]{background:var(--vp-c-brand-soft);border-color:var(--vp-c-brand-1);color:var(--vp-c-brand-1)}
.iclab-controls{display:grid;grid-template-columns:repeat(auto-fit,minmax(190px,1fr));gap:18px;margin:16px 0}
.iclab-controls label{display:flex;flex-direction:column;gap:6px;font-weight:600;font-size:14px}
.iclab-controls input{width:100%;accent-color:#2689bc}
.iclab-metric{font-size:14px;font-weight:600;margin:10px 0;color:var(--vp-c-brand-1)}
.iclab-plot{display:block;width:100%;height:auto;max-height:420px;background:var(--vp-c-bg);border-radius:8px}
.iclab-hint{font-size:13px;line-height:1.65;color:var(--vp-c-text-2)}
.iclab-deck{margin:10px 0}.iclab-deck summary{cursor:pointer;font-weight:600}
.iclab-deck pre{font-size:12px;overflow:auto;max-height:420px;white-space:pre;background:var(--vp-c-bg);border-radius:8px;padding:12px}
.iclab-download{padding:9px 16px;border-radius:8px;background:var(--vp-c-brand-1);color:white;font-weight:600;cursor:pointer}
@media (max-width:600px){.iclab{padding:10px}.iclab-tabs button{flex:1 1 100%}}
</style>

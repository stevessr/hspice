// SOURCE PDF PAGE 403 printed 384, visually checked; native edit selection only, NOT 1:1.
#import "../figures/ch11-clock-timing-native.typ": fig1116,fig1117,fig1118,fig1119,fig1120,fig1121,fig1122,fig1123,fig1124,fig1125,fig1126,fig1127,fig1128
#set document(title:"第11章·时钟、偏斜、抖动、功耗·PDF403")
#set text(size:7.15pt)
#show par: set par(leading:2.2pt,spacing:3pt)
#align(center)[#text(size:7.5pt,weight:"bold")[384　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

#fig1124()
#align(center)[*图11.24　用于降低功耗的门控时钟（可编辑示意）*]

时钟门控需要在合适的时序位置产生使能信号；仅用普通组合与门直接门控时钟，可能在使能变化时产生毛刺。原书强调，门控本身的复杂性、时钟偏斜与功耗收益必须共同评估。

== 11.3.5　时钟发生器

常见的芯片内简单时钟源是环形振荡器，由奇数级反相器首尾相接形成自激振荡。振荡周期取决于单级延迟和级数，频率稳定性可能不足以支持高性能时钟系统。

#fig1125()
#align(center)[*图11.25　环形振荡器构成简单的芯片上时钟发生器（原生示意）*]

更稳定的外部时钟可借助片上缓冲器和调相电路在芯片各处使用。原书图11.26还展示了利用传输门延迟单元产生互补时钟的电路。

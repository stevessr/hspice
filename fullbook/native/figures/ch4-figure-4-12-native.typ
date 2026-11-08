// 图4.12：依据用户提供的原书 PDF 第147页（印刷第128页）重绘。
// 四个子图都使用 Typst 原生线条、路径及文字；不包含扫描页位图。
// 坐标根据原图拓扑和定性趋势校对，尚非逐像素版式验收。
#let fig412-circuit() = html.frame(block(width:224pt,height:174pt)[
  #place(top + left,dx:11pt,dy:4pt,text(size:7.5pt)[(a) CMOS反相器])
  #place(top + left,dx:121pt,dy:11pt,text(size:7.5pt)[$V_("DD")$]))
  #place(top + left,dx:120pt,dy:25pt,line(end:(0pt,24pt),stroke:.8pt))
  #place(top + left,dx:117pt,dy:28pt,circle(radius:2.8pt,fill:black))
  // 上管PMOS：源接VDD、漏接Vout、体端回到源端。
  #place(top + left,dx:120pt,dy:49pt,line(end:(0pt,18pt),stroke:1.2pt))
  #place(top + left,dx:112pt,dy:46pt,line(end:(0pt,24pt),stroke:1.2pt))
  #place(top + left,dx:105pt,dy:56pt,circle(radius:3pt,stroke:.75pt,fill:white))
  #place(top + left,dx:73pt,dy:56pt,line(length:29pt,stroke:.75pt))
  #place(top + left,dx:119pt,dy:67pt,line(end:(0pt,28pt),stroke:.8pt))
  #place(top + left,dx:120pt,dy:82pt,line(length:63pt,stroke:.8pt))
  #place(top + left,dx:185pt,dy:77pt,text(size:7pt)[$V_("out")$]))
  #place(top + left,dx:129pt,dy:31pt,text(size:7pt)[$S$]))
  #place(top + left,dx:129pt,dy:70pt,text(size:7pt)[$D$]))
  #place(top + left,dx:133pt,dy:50pt,text(size:6.5pt)[$B$]))
  #place(top + left,dx:161pt,dy:50pt,text(size:7pt)[$W_P/L_P$]))
  #place(top + left,dx:12pt,dy:43pt,text(size:7pt)[PMOS]))
  // 下管NMOS：源接GND，漏接同一输出节点。
  #place(top + left,dx:120pt,dy:95pt,line(end:(0pt,21pt),stroke:.8pt))
  #place(top + left,dx:112pt,dy:116pt,line(end:(0pt,24pt),stroke:1.2pt))
  #place(top + left,dx:120pt,dy:117pt,line(end:(0pt,23pt),stroke:1.2pt))
  #place(top + left,dx:120pt,dy:141pt,line(end:(0pt,15pt),stroke:.8pt))
  #place(top + left,dx:109pt,dy:156pt,line(length:22pt,stroke:.8pt))
  #place(top + left,dx:113pt,dy:161pt,line(length:14pt,stroke:.8pt))
  #place(top + left,dx:117pt,dy:166pt,line(length:6pt,stroke:.8pt))
  #place(top + left,dx:129pt,dy:102pt,text(size:7pt)[$D$]))
  #place(top + left,dx:129pt,dy:141pt,text(size:7pt)[$S$]))
  #place(top + left,dx:133pt,dy:122pt,text(size:6.5pt)[$B$]))
  #place(top + left,dx:161pt,dy:124pt,text(size:7pt)[$W_N/L_N$]))
  #place(top + left,dx:12pt,dy:127pt,text(size:7pt)[NMOS]))
  // 共栅输入与共漏输出：保持原图的端序及节点拓扑。
  #place(top + left,dx:73pt,dy:56pt,line(end:(0pt,74pt),stroke:.75pt))
  #place(top + left,dx:73pt,dy:128pt,line(length:39pt,stroke:.75pt))
  #place(top + left,dx:73pt,dy:86pt,circle(radius:2.8pt,fill:black))
  #place(top + left,dx:27pt,dy:86pt,line(length:46pt,stroke:.75pt))
  #place(top + left,dx:7pt,dy:79pt,text(size:7pt)[$V_("in")$]))
  #place(top + left,dx:120pt,dy:95pt,circle(radius:2.8pt,fill:black))
])
#let fig412-loadline() = html.frame(block(width:224pt,height:174pt)[
  #place(top + left,dx:8pt,dy:4pt,text(size:7.5pt)[(b) 负载线：$I_("DN")=I_("DP")$]))
  #place(top + left,dx:30pt,dy:144pt,line(length:188pt,stroke:.8pt))
  #place(top + left,dx:30pt,dy:144pt,line(end:(0pt,-119pt),stroke:.8pt))
  // 原图：左端Vout=0、右端Vout=VDD，电流相等的交点依输入变化形成拱形。
  // PDF147 图4.12(b)：左下 NMOS Vin=0、右下 PMOS Vin=VDD；左右上边界条件另注。
  #place(top + left,dx:30pt,dy:144pt,curve(stroke:1.25pt,
     curve.move((0pt,0pt)),
     curve.cubic((20pt,-62pt),(49pt,-97pt),(97pt,-99pt)),
     curve.cubic((143pt,-100pt),(157pt,-63pt),(177pt,0pt))))
  #place(top + left,dx:30pt,dy:45pt,line(length:177pt,stroke:.6pt))
  #place(top + left,dx:12pt,dy:17pt,text(size:7pt)[$I_("DS")$]))
  #place(top + left,dx:195pt,dy:151pt,text(size:7pt)[$V_("out")$]))
  #place(top + left,dx:25pt,dy:148pt,text(size:6pt)[0]))
  #place(top + left,dx:197pt,dy:148pt,text(size:6pt)[$V_("DD")$]))
  #place(top + left,dx:28pt,dy:48pt,text(size:5.8pt)[NMOS: $V_("in")=V_("DD")$]))
  #place(top + left,dx:152pt,dy:45pt,text(size:5.8pt)[PMOS: $V_("in")=0$]))
  #place(top + left,dx:111pt,dy:31pt,text(size:7pt)[III]))
  #place(top + left,dx:67pt,dy:61pt,text(size:7pt)[IV]))
  #place(top + left,dx:151pt,dy:61pt,text(size:7pt)[II]))
  #place(top + left,dx:36pt,dy:129pt,text(size:7pt)[V]))
  #place(top + left,dx:196pt,dy:129pt,text(size:7pt)[I]))
  #place(top + left,dx:38pt,dy:156pt,text(size:6.3pt)[NMOS: $V_("in")=0$]))
  #place(top + left,dx:132pt,dy:156pt,text(size:6.3pt)[PMOS: $V_("in")=V_("DD")$]))
])
#let fig412-vtc() = html.frame(block(width:224pt,height:175pt)[
  #place(top + left,dx:8pt,dy:3pt,text(size:7.5pt)[(c) 电压传输特性])
  #place(top + left,dx:31pt,dy:141pt,line(length:187pt,stroke:.8pt))
  #place(top + left,dx:31pt,dy:141pt,line(end:(0pt,-118pt),stroke:.8pt))
  // VTC: 左右平台+陡直过渡，保留原书的VIL/VIH与五区关系。
  #place(top + left,dx:33pt,dy:43pt,curve(stroke:1.35pt,
    curve.move((0pt,0pt)),
    curve.cubic((33pt,0pt),(62pt,1pt),(68pt,11pt)),
    curve.cubic((83pt,25pt),(69pt,73pt),(94pt,88pt)),
    curve.cubic((110pt,99pt),(157pt,98pt),(178pt,98pt))))
  #place(top + left,dx:103pt,dy:53pt,line(end:(0pt,88pt),stroke:(dash:"dashed",thickness:.55pt)))
  #place(top + left,dx:112pt,dy:112pt,line(end:(0pt,29pt),stroke:(dash:"dashed",thickness:.55pt)))
  #place(top + left,dx:7pt,dy:19pt,text(size:6.8pt)[$V_("out")$]))
  #place(top + left,dx:185pt,dy:149pt,text(size:7pt)[$V_("in")$]))
  #place(top + left,dx:5pt,dy:38pt,text(size:6.5pt)[$V_("DD")$]))
  #place(top + left,dx:13pt,dy:138pt,text(size:6.5pt)[0]))
  #place(top + left,dx:35pt,dy:31pt,text(size:6.5pt)[I]))
  #place(top + left,dx:72pt,dy:53pt,text(size:6.5pt)[II]))
  #place(top + left,dx:121pt,dy:84pt,text(size:6.5pt)[III]))
  #place(top + left,dx:137pt,dy:119pt,text(size:6.5pt)[IV]))
  #place(top + left,dx:180pt,dy:132pt,text(size:6.5pt)[V]))
  #place(top + left,dx:65pt,dy:146pt,text(size:6.3pt)[$V_("TN")$]))
  #place(top + left,dx:91pt,dy:156pt,text(size:6.3pt)[$V_("IL")$]))
  #place(top + left,dx:117pt,dy:146pt,text(size:6.3pt)[$V_("IH")$]))
  #place(top + left,dx:154pt,dy:156pt,text(size:6pt)[$V_("DD")-|V_("TP")|$]))
])
#let fig412-current() = html.frame(block(width:224pt,height:175pt)[
  #place(top + left,dx:8pt,dy:3pt,text(size:7.5pt)[(d) 直流传输电流])
  #place(top + left,dx:31pt,dy:141pt,line(length:186pt,stroke:.8pt))
  #place(top + left,dx:31pt,dy:141pt,line(end:(0pt,-118pt),stroke:.8pt))
  #place(top + left,dx:37pt,dy:141pt,curve(stroke:1.4pt,
     curve.move((0pt,0pt)),
     curve.cubic((33pt,0pt),(54pt,-4pt),(67pt,-55pt)),
     curve.cubic((84pt,-99pt),(100pt,-95pt),(113pt,-55pt)),
     curve.cubic((125pt,-15pt),(128pt,0pt),(160pt,0pt))))
  #place(top + left,dx:6pt,dy:21pt,text(size:7pt)[$I_("DN")$]))
  #place(top + left,dx:6pt,dy:30pt,text(size:7pt)[$I_("DP")$]))
  #place(top + left,dx:184pt,dy:148pt,text(size:7pt)[$V_("in")$]))
  #place(top + left,dx:33pt,dy:146pt,text(size:6.5pt)[0]))
  #place(top + left,dx:43pt,dy:128pt,text(size:6.5pt)[I]))
  #place(top + left,dx:98pt,dy:73pt,text(size:6.8pt)[II]))
  #place(top + left,dx:117pt,dy:37pt,text(size:7pt)[III]))
  #place(top + left,dx:147pt,dy:74pt,text(size:7pt)[IV]))
  #place(top + left,dx:189pt,dy:128pt,text(size:6.5pt)[V]))
  #place(top + left,dx:65pt,dy:156pt,text(size:6.3pt)[$V_("TN")$]))
  #place(top + left,dx:152pt,dy:156pt,text(size:6pt)[$V_("DD")-|V_("TP")|$]))
])

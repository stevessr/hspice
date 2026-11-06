// Native editable figures for scan PDF pages 071–076 (figures 2.15–2.19).
// Curves are schematic transcriptions, not digitized measurement data.

#let alpha-iv() = html.frame(block(width: 352pt,height: 155pt)[
  #place(top + left,dx: 29pt,dy: 124pt,line(length:286pt,stroke:.8pt))
  #place(top + left,dx: 29pt,dy: 124pt,line(end:(0pt,-109pt),stroke:.8pt))
  #place(top + left,dx: 30pt,dy: 124pt,
    curve(stroke:1.1pt,curve.move((0pt,0pt)),
      curve.cubic((43pt,-78pt),(75pt,-88pt),(266pt,-91pt))))
  #place(top + left,dx: 30pt,dy: 124pt,
    curve(stroke:1.1pt,curve.move((0pt,0pt)),
      curve.cubic((31pt,-47pt),(74pt,-58pt),(266pt,-60pt))))
  #place(top + left,dx: 30pt,dy: 124pt,
    curve(stroke:1.1pt,curve.move((0pt,0pt)),
      curve.cubic((24pt,-25pt),(65pt,-30pt),(266pt,-33pt))))
  #place(top + left,dx: 32pt,dy: 125pt,
    curve(stroke:(dash:"dashed",thickness:.9pt),curve.move((0pt,0pt)),
      curve.line((78pt,-93pt)),curve.line((273pt,-93pt))))
  #place(top + left,dx: 241pt,dy: 14pt,text(size:8pt)[$V_("GS3")$]))
  #place(top + left,dx: 241pt,dy: 51pt,text(size:8pt)[$V_("GS2")$]))
  #place(top + left,dx: 241pt,dy: 86pt,text(size:8pt)[$V_("GS1")$]))
  #place(top + left,dx: 8pt,dy: 10pt,text(size:8pt)[$I_("DS")$]))
  #place(top + left,dx: 306pt,dy: 127pt,text(size:8pt)[$V_("DS")$]))
  #place(top + left,dx: 23pt,dy: 141pt,text(size:7pt)[线性区直线近似与饱和区拟合曲线（概念性重绘）])
])

#let subthreshold-curve() = html.frame(block(width:352pt,height:181pt)[
  #place(top + left,dx: 39pt,dy: 143pt,line(length:278pt,stroke:.8pt))
  #place(top + left,dx: 39pt,dy: 143pt,line(end:(0pt,-125pt),stroke:.8pt))
  #place(top + left,dx: 42pt,dy: 140pt,
    curve(stroke:1.25pt,curve.move((0pt,0pt)),
      curve.cubic((45pt,-7pt),(80pt,-36pt),(131pt,-82pt)),
      curve.cubic((177pt,-100pt),(228pt,-102pt),(272pt,-103pt))))
  #place(top + left,dx: 42pt,dy: 140pt,
    curve(stroke:(dash:"dashed",thickness:1.1pt),curve.move((0pt,0pt)),
      curve.cubic((51pt,-2pt),(91pt,-23pt),(137pt,-65pt)),
      curve.cubic((181pt,-81pt),(227pt,-85pt),(271pt,-87pt))))
  #place(top + left,dx: 140pt,dy: 22pt,line(end:(0pt,119pt),stroke:(dash:"dashed",thickness:.7pt)))
  #place(top + left,dx: 212pt,dy: 22pt,line(end:(0pt,119pt),stroke:(dash:"dashed",thickness:.7pt)))
  #place(top + left,dx: 59pt,dy: 23pt,text(size:8pt)[亚阈值区]))
  #place(top + left,dx: 163pt,dy: 23pt,text(size:8pt)[饱和区]))
  #place(top + left,dx: 258pt,dy: 23pt,text(size:8pt)[线性区]))
  #place(top + left,dx: 2pt,dy: 13pt,text(size:8pt)[$log I_("DS")$]))
  #place(top + left,dx: 290pt,dy: 148pt,text(size:8pt)[$V_("GS")$]))
  #place(top + left,dx: 105pt,dy: 156pt,text(size:7pt)[数轴示意；原图半对数刻度与散点尚待量化])
])

#let mos-cap-network() = html.frame(block(width:354pt,height:188pt)[
  #place(top + left,dx: 24pt,dy: 70pt,rect(width:304pt,height:99pt,stroke:.8pt,fill:white))
  #place(top + left,dx: 44pt,dy: 71pt,rect(width:67pt,height:20pt,stroke:.8pt,fill:rgb("ddd")))
  #place(top + left,dx: 247pt,dy: 71pt,rect(width:65pt,height:20pt,stroke:.8pt,fill:rgb("ddd")))
  #place(top + left,dx: 114pt,dy: 47pt,rect(width:132pt,height:22pt,stroke:.8pt,fill:rgb("bbb")))
  #place(top + left,dx: 114pt,dy: 69pt,rect(width:132pt,height:3pt,stroke:.6pt,fill:rgb("eee")))
  #place(top + left,dx: 180pt,dy: 47pt,line(end:(0pt,-33pt),stroke:.8pt))
  #place(top + left,dx: 77pt,dy: 71pt,line(end:(0pt,-33pt),stroke:.8pt))
  #place(top + left,dx: 280pt,dy: 71pt,line(end:(0pt,-33pt),stroke:.8pt))
  #place(top + left,dx: 60pt,dy: 16pt,text(size:8pt)[源 S]))
  #place(top + left,dx: 167pt,dy: 3pt,text(size:8pt)[栅 G]))
  #place(top + left,dx: 271pt,dy: 16pt,text(size:8pt)[漏 D]))
  #place(top + left,dx: 108pt,dy: 86pt,text(size:8pt)[$C_("gs")$]))
  #place(top + left,dx: 228pt,dy: 86pt,text(size:8pt)[$C_("gd")$]))
  #place(top + left,dx: 155pt,dy: 110pt,text(size:8pt)[$C_("gb")$]))
  #place(top + left,dx: 72pt,dy: 119pt,text(size:8pt)[$C_("sb")$]))
  #place(top + left,dx: 271pt,dy: 119pt,text(size:8pt)[$C_("db")$]))
  #place(top + left,dx: 181pt,dy: 155pt,text(size:8pt)[衬底 B]))
  #place(top + left,dx: 19pt,dy: 175pt,text(size:7pt)[图2.17的栅电容、结电容与重叠电容的符号关系，位置未精校])
])

#let gate-cap-variation() = html.frame(block(width:352pt,height:180pt)[
  #place(top + left,dx: 32pt,dy: 140pt,line(length:284pt,stroke:.8pt))
  #place(top + left,dx: 32pt,dy: 140pt,line(end:(0pt,-120pt),stroke:.8pt))
  #place(top + left,dx: 38pt,dy: 29pt,
    curve(stroke:1.2pt,curve.move((0pt,0pt)),
      curve.line((36pt,0pt)),curve.cubic((31pt,70pt),(101pt,112pt),(127pt,108pt))))
  #place(top + left,dx: 167pt,dy: 136pt,
    curve(stroke:1.2pt,curve.move((0pt,0pt)),
      curve.cubic((25pt,-89pt),(31pt,-82pt),(62pt,-84pt)),
      curve.cubic((91pt,-87pt),(102pt,-31pt),(141pt,-35pt))))
  #place(top + left,dx: 38pt,dy: 136pt,
    curve(stroke:(dash:"dashed",thickness:1.1pt),curve.move((0pt,0pt)),
      curve.line((93pt,0pt)),curve.cubic((37pt,-4pt),(58pt,-1pt),(94pt,0pt)),
      curve.line((176pt,0pt))))
  #place(top + left,dx: 44pt,dy: 12pt,text(size:8pt)[$C_("gb")$]))
  #place(top + left,dx: 205pt,dy: 39pt,text(size:8pt)[$C_("gs")$]))
  #place(top + left,dx: 270pt,dy: 107pt,text(size:8pt)[$C_("gd")$]))
  #place(top + left,dx: 6pt,dy: 12pt,text(size:8pt)[$C$]))
  #place(top + left,dx: 304pt,dy: 146pt,text(size:8pt)[$V_("GS")$]))
  #place(top + left,dx: 40pt,dy: 153pt,text(size:7pt)[积累 / 耗尽 / 饱和 / 线性工作区])
  #place(top + left,dx: 40pt,dy: 165pt,text(size:7pt)[定性变化图：未按原图2.18精确标定转折点])
])

#let pn-junction-cap() = html.frame(block(width:352pt,height:173pt)[
  #place(top + left,dx: 37pt,dy: 142pt,line(length:281pt,stroke:.8pt))
  #place(top + left,dx: 151pt,dy: 155pt,line(end:(0pt,-133pt),stroke:.8pt))
  #place(top + left,dx: 51pt,dy: 140pt,
    curve(stroke:1.3pt,curve.move((0pt,0pt)),
      curve.cubic((54pt,-7pt),(85pt,-30pt),(100pt,-50pt)),
      curve.cubic((30pt,-22pt),(47pt,-80pt),(62pt,-112pt))))
  #place(top + left,dx: 222pt,dy: 18pt,line(end:(0pt,122pt),stroke:(dash:"dashed",thickness:.7pt)))
  #place(top + left,dx: 131pt,dy: 85pt,text(size:8pt)[$C_("j0")$]))
  #place(top + left,dx: 227pt,dy: 18pt,text(size:8pt)[$phi_B$]))
  #place(top + left,dx: 6pt,dy: 20pt,text(size:8pt)[$C_j$]))
  #place(top + left,dx: 299pt,dy: 146pt,text(size:8pt)[$V_j$]))
  #place(top + left,dx: 26pt,dy: 158pt,text(size:8pt)[反偏时电容降低；正向接近内建电势时模型失效])
])

// Editable pedagogical reconstructions of source PDF figures 2.11–2.14.
// All vector elements remain in Typst. Curve point sets are NOT digitized source data.

#let short-channel-iv() = html.frame(block(width: 354pt,height: 210pt)[
  #place(top + left,dx: 8pt,dy: 4pt,text(size:8pt)[(a) $I_("DS")$–$V_("DS")$（0.18 μm）])
  #place(top + left,dx: 21pt,dy: 89pt,line(length:308pt,stroke:.8pt))
  #place(top + left,dx: 21pt,dy: 89pt,line(end:(0pt,-66pt),stroke:.8pt))
  #place(top + left,dx: 25pt,dy: 88pt,
    curve(stroke:1.25pt,curve.move((0pt,0pt)),
      curve.cubic((36pt,-55pt),(82pt,-66pt),(300pt,-66pt))))
  #place(top + left,dx: 25pt,dy: 88pt,
    curve(stroke:1.2pt,curve.move((0pt,0pt)),
      curve.cubic((29pt,-35pt),(80pt,-45pt),(300pt,-45pt))))
  #place(top + left,dx: 25pt,dy: 88pt,
    curve(stroke:1.2pt,curve.move((0pt,0pt)),
      curve.cubic((19pt,-17pt),(68pt,-22pt),(300pt,-22pt))))
  #place(top + left,dx: 239pt,dy: 19pt,text(size:7pt)[$V_("GS") = 1.8 "V"$]))
  #place(top + left,dx: 239pt,dy: 40pt,text(size:7pt)[$V_("GS") = 1.35 "V"$]))
  #place(top + left,dx: 239pt,dy: 64pt,text(size:7pt)[$V_("GS") = 0.9 "V"$]))
  #place(top + left,dx: 4pt,dy: 22pt,text(size:7pt)[$I_("DS")$]))
  #place(top + left,dx: 303pt,dy: 92pt,text(size:7pt)[$V_("DS")$]))
  #place(top + left,dx: 8pt,dy: 106pt,text(size:8pt)[(b) $I_("DS")$–$V_("GS")$（0.18 μm）])
  #place(top + left,dx: 21pt,dy: 192pt,line(length:308pt,stroke:.8pt))
  #place(top + left,dx: 21pt,dy: 192pt,line(end:(0pt,-67pt),stroke:.8pt))
  #place(top + left,dx: 25pt,dy: 191pt,
    curve(stroke:1.1pt,curve.move((0pt,0pt)),
      curve.cubic((90pt,1pt),(97pt,-8pt),(147pt,-31pt)),
      curve.line((300pt,-64pt))))
  #place(top + left,dx: 25pt,dy: 191pt,
    curve(stroke:(dash:"dashed",thickness:1pt),curve.move((0pt,0pt)),
      curve.cubic((88pt,0pt),(102pt,-5pt),(151pt,-28pt)),
      curve.line((300pt,-58pt))))
  #place(top + left,dx: 268pt,dy: 134pt,text(size:7pt)[接近线性])
  #place(top + left,dx: 4pt,dy: 125pt,text(size:7pt)[$I_("DS")$]))
  #place(top + left,dx: 301pt,dy: 193pt,text(size:7pt)[$V_("GS")$]))
  #place(top + left,dx: 36pt,dy: 199pt,text(size:7pt)[示意趋势，未逐点数字化原图2.11])
])

#let velocity-saturation() = html.frame(block(width: 350pt,height: 170pt)[
  #place(top + left,dx: 40pt,dy: 139pt,line(length:275pt,stroke:.9pt))
  #place(top + left,dx: 40pt,dy: 139pt,line(end:(0pt,-123pt),stroke:.9pt))
  #place(top + left,dx: 41pt,dy: 138pt,
    curve(stroke:1.3pt,curve.move((0pt,0pt)),
      curve.cubic((33pt,-46pt),(85pt,-104pt),(131pt,-108pt)),
      curve.cubic((155pt,-110pt),(208pt,-110pt),(257pt,-110pt))))
  #place(top + left,dx: 172pt,dy: 139pt,line(end:(0pt,-107pt),stroke:(dash:"dashed",thickness:.7pt)))
  #place(top + left,dx: 40pt,dy: 31pt,line(length:259pt,stroke:(dash:"dashed",thickness:.6pt)))
  #place(top + left,dx: 15pt,dy: 17pt,text(size:7pt)[$v$]))
  #place(top + left,dx: 312pt,dy: 141pt,text(size:8pt)[$E_y$]))
  #place(top + left,dx: 169pt,dy: 145pt,text(size:8pt)[$E_c$]))
  #place(top + left,dx: 1pt,dy: 25pt,text(size:8pt)[$v_("sat")$]))
  #place(top + left,dx: 65pt,dy: 105pt,text(size:8pt)[低场线性漂移])
  #place(top + left,dx: 220pt,dy: 13pt,text(size:8pt)[速度上限])
  #place(top + left,dx: 23pt,dy: 159pt,text(size:7pt)[饱和转变形状是概念性重绘；非原始测量曲线])
])

#let carrier-fields() = html.frame(block(width: 352pt,height: 176pt)[
  #place(top + left,dx: 43pt,dy: 139pt,line(length:286pt,stroke:.8pt))
  #place(top + left,dx: 43pt,dy: 139pt,line(end:(0pt,-121pt),stroke:.8pt))
  #place(top + left,dx: 44pt,dy: 136pt,
    curve(stroke:1.35pt,curve.move((0pt,0pt)),
      curve.cubic((42pt,-48pt),(93pt,-85pt),(151pt,-93pt)),
      curve.cubic((194pt,-100pt),(245pt,-99pt),(282pt,-100pt))))
  #place(top + left,dx: 44pt,dy: 136pt,
    curve(stroke:(dash:"dashed",thickness:1.25pt),curve.move((0pt,0pt)),
      curve.cubic((69pt,-14pt),(120pt,-81pt),(180pt,-93pt)),
      curve.cubic((224pt,-100pt),(252pt,-100pt),(282pt,-100pt))))
  #place(top + left,dx: 188pt,dy: 16pt,line(end:(0pt,120pt),stroke:(dash:"dashed",thickness:.7pt)))
  #place(top + left,dx: 264pt,dy: 16pt,line(end:(0pt,120pt),stroke:(dash:"dashed",thickness:.7pt)))
  #place(top + left,dx: 150pt,dy: 23pt,text(size:7.5pt)[电子]))
  #place(top + left,dx: 188pt,dy: 88pt,text(size:7.5pt)[空穴]))
  #place(top + left,dx: 10pt,dy: 12pt,text(size:8pt)[$v$]))
  #place(top + left,dx: 289pt,dy: 141pt,text(size:8pt)[$E_y$]))
  #place(top + left,dx: 163pt,dy: 145pt,text(size:7pt)[$E_("cn")$]))
  #place(top + left,dx: 249pt,dy: 145pt,text(size:7pt)[$E_("cp")$]))
  #place(top + left,dx: 52pt,dy: 159pt,text(size:7pt)[400 K电子与空穴的趋势示意；坐标采用对数轴的原图意图])
])

#let nmos-pmos-drive() = html.frame(block(width: 352pt,height: 189pt)[
  #place(top + left,dx: 40pt,dy: 152pt,line(length:288pt,stroke:.8pt))
  #place(top + left,dx: 40pt,dy: 152pt,line(end:(0pt,-131pt),stroke:.8pt))
  #place(top + left,dx: 42pt,dy: 151pt,
    curve(stroke:1.35pt,curve.move((0pt,0pt)),
      curve.cubic((38pt,-91pt),(102pt,-106pt),(277pt,-110pt))))
  #place(top + left,dx: 42pt,dy: 151pt,
    curve(stroke:1.35pt,curve.move((0pt,0pt)),
      curve.cubic((45pt,-56pt),(109pt,-97pt),(277pt,-108pt))))
  #place(top + left,dx: 42pt,dy: 151pt,
    curve(stroke:(dash:"dashed",thickness:1.2pt),curve.move((0pt,0pt)),
      curve.cubic((54pt,-48pt),(130pt,-69pt),(277pt,-78pt))))
  #place(top + left,dx: 42pt,dy: 151pt,
    curve(stroke:(dash:"dashed",thickness:1.2pt),curve.move((0pt,0pt)),
      curve.cubic((59pt,-20pt),(150pt,-38pt),(277pt,-41pt))))
  #place(top + left,dx: 220pt,dy: 17pt,text(size:8pt)[1X NMOS]))
  #place(top + left,dx: 220pt,dy: 37pt,text(size:8pt)[3X PMOS]))
  #place(top + left,dx: 220pt,dy: 80pt,text(size:8pt)[2X PMOS]))
  #place(top + left,dx: 220pt,dy: 120pt,text(size:8pt)[1X PMOS]))
  #place(top + left,dx: 4pt,dy: 18pt,text(size:8pt)[$I_("DS")$]))
  #place(top + left,dx: 310pt,dy: 157pt,text(size:8pt)[$V_("DS")$]))
  #place(top + left,dx: 25pt,dy: 174pt,text(size:7pt)[饱和区1X NMOS与3X PMOS电流接近；非原图逐点量化])
])

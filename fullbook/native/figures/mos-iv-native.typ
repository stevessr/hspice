// MOS I-V editable vector figures for source PDF pages 060–062.
// All marks are Typst native. Schematic topology follows figures 2.8–2.10;
// exact print coordinates, tick values, and line widths are not certified.

#let mos-biased-channel() = html.frame(block(width: 352pt, height: 192pt)[
  #place(top + left,dx: 35pt,dy: 64pt,rect(width:280pt,height:100pt,stroke:.85pt,fill:white))
  #place(top + left,dx: 53pt,dy: 65pt,rect(width:72pt,height:25pt,stroke:.85pt,fill:rgb("dddddd")))
  #place(top + left,dx: 225pt,dy: 65pt,rect(width:73pt,height:25pt,stroke:.85pt,fill:rgb("dddddd")))
  #place(top + left,dx: 125pt,dy: 61pt,rect(width:100pt,height:4pt,stroke:.65pt,fill:rgb("eeeeee")))
  #place(top + left,dx: 125pt,dy: 44pt,rect(width:100pt,height:17pt,stroke:.8pt,fill:rgb("bbbbbb")))
  #place(top + left,dx: 127pt,dy: 69pt,line(length:96pt,stroke:2.3pt))
  #place(top + left,dx: 74pt,dy: 65pt,line(end:(0pt,-43pt),stroke:.75pt))
  #place(top + left,dx: 175pt,dy: 44pt,line(end:(0pt,-36pt),stroke:.75pt))
  #place(top + left,dx: 266pt,dy: 65pt,line(end:(0pt,-44pt),stroke:.75pt))
  #place(top + left,dx: 175pt,dy: 164pt,line(end:(0pt,15pt),stroke:.75pt))
  #place(top + left,dx: 165pt,dy: 179pt,line(length:20pt,stroke:.8pt))
  #place(top + left,dx: 169pt,dy: 183pt,line(length:12pt,stroke:.8pt))
  #place(top + left,dx: 173pt,dy: 187pt,line(length:4pt,stroke:.8pt))
  #place(top + left,dx: 42pt,dy: 7pt,text(size:8pt)[$S=0$]))
  #place(top + left,dx: 143pt,dy: 7pt,text(size:8pt)[$V_("GS")$]))
  #place(top + left,dx: 245pt,dy: 7pt,text(size:8pt)[$V_("DS")$]))
  #place(top + left,dx: 67pt,dy: 71pt,text(size:7pt)[$n^+$]))
  #place(top + left,dx: 248pt,dy: 71pt,text(size:7pt)[$n^+$]))
  #place(top + left,dx: 149pt,dy: 51pt,text(size:7pt)[栅极 G]))
  #place(top + left,dx: 129pt,dy: 75pt,text(size:7pt)[$y$]))
  #place(top + left,dx: 164pt,dy: 75pt,text(size:7pt)[$y+dif y$]))
  #place(top + left,dx: 155pt,dy: 120pt,text(size:8pt)[$p$ 型衬底]))
  #place(top + left,dx: 125pt,dy: 99pt,line(length:100pt,stroke:.75pt))
  #place(top + left,dx: 168pt,dy: 100pt,text(size:8pt)[$L$]))
  #place(top + left,dx: 222pt,dy: 100pt,text(size:7pt)[$V(y)$]))
  #place(top + left,dx: 184pt,dy: 167pt,text(size:7pt)[$V_("SB")$]))
])

#let pinch-off-study() = html.frame(block(width: 352pt,height: 173pt)[
  // Left, parabolic I–V extrapolation and dashed nonphysical portion.
  #place(top + left,dx: 18pt,dy: 16pt,text(size:8pt)[(a) 线性区公式超出适用范围])
  #place(top + left,dx: 22pt,dy: 140pt,line(length:148pt,stroke:.8pt))
  #place(top + left,dx: 22pt,dy: 140pt,line(end:(0pt,-99pt),stroke:.8pt))
  #place(top + left,dx: 24pt,dy: 137pt,
    curve(stroke:1.2pt,curve.move((0pt,0pt)),
      curve.cubic((27pt,-70pt),(61pt,-103pt),(84pt,-84pt))))
  #place(top + left,dx: 108pt,dy: 53pt,
    curve(stroke:(dash:"dashed",thickness:1.1pt),curve.move((0pt,0pt)),
      curve.cubic((23pt,13pt),(44pt,46pt),(55pt,86pt))))
  #place(top + left,dx: 107pt,dy: 54pt,line(end:(0pt,86pt),stroke:(dash:"dashed",thickness:.6pt)))
  #place(top + left,dx: 74pt,dy: 147pt,text(size:7pt)[$V_("DSsat")$]))
  #place(top + left,dx: 153pt,dy: 145pt,text(size:7pt)[$V_("DS")$]))
  #place(top + left,dx: 0pt,dy: 28pt,text(size:7pt)[$I_("DS")$]))
  #place(top + left,dx: 193pt,dy: 16pt,text(size:8pt)[(b) 漏端夹断示意])
  #place(top + left,dx: 195pt,dy: 72pt,rect(width:151pt,height:81pt,stroke:.7pt,fill:white))
  #place(top + left,dx: 200pt,dy: 75pt,rect(width:34pt,height:17pt,stroke:.6pt,fill:rgb("ddd")))
  #place(top + left,dx: 309pt,dy: 75pt,rect(width:34pt,height:17pt,stroke:.6pt,fill:rgb("ddd")))
  #place(top + left,dx: 233pt,dy: 63pt,rect(width:76pt,height:9pt,stroke:.6pt,fill:rgb("bbb")))
  #place(top + left,dx: 234pt,dy: 74pt,
    curve(stroke:2.5pt,curve.move((0pt,0pt)),
      curve.cubic((36pt,-1pt),(54pt,-1pt),(70pt,10pt))))
  #place(top + left,dx: 248pt,dy: 105pt,text(size:8pt)[夹断点]))
  #place(top + left,dx: 256pt,dy: 134pt,text(size:8pt)[$p$ 型衬底]))
  #place(top + left,dx: 193pt,dy: 159pt,text(size:7pt)[漏端沟道电荷趋于零，而非改变电荷极性])
])

#let mos-output-curves() = html.frame(block(width: 352pt,height: 220pt)[
  #place(top + left,dx: 47pt,dy: 190pt,line(length:283pt,stroke:.8pt))
  #place(top + left,dx: 47pt,dy: 190pt,line(end:(0pt,-174pt),stroke:.8pt))
  #place(top + left,dx: 5pt,dy: 8pt,text(size:8pt)[$I_("DS")$]))
  #place(top + left,dx: 305pt,dy: 194pt,text(size:8pt)[$V_("DS")$]))
  // Three editable traces with finite saturation-region slope (lambda illustrative).
  #place(top + left,dx: 47pt,dy: 190pt,
    curve(stroke:1.25pt,curve.move((0pt,0pt)),
      curve.cubic((16pt,-29pt),(47pt,-48pt),(70pt,-53pt)),
      curve.cubic((128pt,-63pt),(195pt,-80pt),(273pt,-98pt))))
  #place(top + left,dx: 47pt,dy: 190pt,
    curve(stroke:1.25pt,curve.move((0pt,0pt)),
      curve.cubic((24pt,-61pt),(64pt,-91pt),(98pt,-102pt)),
      curve.cubic((155pt,-116pt),(215pt,-130pt),(273pt,-145pt))))
  #place(top + left,dx: 47pt,dy: 190pt,
    curve(stroke:1.25pt,curve.move((0pt,0pt)),
      curve.cubic((34pt,-86pt),(85pt,-120pt),(124pt,-126pt)),
      curve.cubic((182pt,-139pt),(233pt,-157pt),(273pt,-177pt))))
  // Dash point for pinch boundary Vds = Vgs - Vt.
  #place(top + left,dx: 70pt,dy: 150pt,
    curve(stroke:(dash:"dashed",thickness:.75pt),curve.move((0pt,0pt)),
      curve.cubic((28pt,-12pt),(51pt,-53pt),(101pt,-108pt))))
  #place(top + left,dx: 76pt,dy: 91pt,text(size:8pt)[线性区]))
  #place(top + left,dx: 225pt,dy: 85pt,text(size:8pt)[饱和区]))
  #place(top + left,dx: 162pt,dy: 8pt,text(size:7pt)[$V_("DS")=V_("GS")-V_T$]))
  #place(top + left,dx: 267pt,dy: 28pt,text(size:7pt)[$V_("GS3")$]))
  #place(top + left,dx: 278pt,dy: 71pt,text(size:7pt)[$V_("GS2")$]))
  #place(top + left,dx: 282pt,dy: 118pt,text(size:7pt)[$V_("GS1")$]))
  #place(top + left,dx: 47pt,dy: 203pt,text(size:7pt)[图形表示长沟道趋势；比例、截距和实际参数需校对])
])

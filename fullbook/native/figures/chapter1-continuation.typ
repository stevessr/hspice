// Native Typst figures for textbook PDF source pages 030–034.
// Educational tracings from the user-supplied scans. All strokes and text remain editable.
// Fidelity is a working candidate; line positions require visual review.

#let step-delay() = html.frame(block(width: 366pt,height: 194pt)[
  // Input axis and reference high/low
  #place(top + left,dx: 24pt,dy: 88pt,line(length: 326pt,stroke: .8pt))
  #place(top + left,dx: 24pt,dy: 88pt,line(end:(0pt,-78pt),stroke:.8pt))
  #place(top + left,dx: 25pt,dy: 80pt,
    curve(stroke:1.1pt,curve.move((0pt,0pt)),
      curve.line((48pt,0pt)),curve.line((48pt,-60pt)),
      curve.line((112pt,-60pt)),curve.line((112pt,0pt)),
      curve.line((186pt,0pt)),curve.line((186pt,-60pt)),
      curve.line((243pt,-60pt)),curve.line((243pt,0pt)),
      curve.line((300pt,0pt))))
  // Cycle interval upper arrow
  #place(top + left,dx: 73pt,dy: 13pt,line(length: 186pt,stroke:.7pt))
  #place(top + left,dx: 73pt,dy: 10pt,line(end:(0pt,10pt),stroke:.7pt))
  #place(top + left,dx: 259pt,dy: 10pt,line(end:(0pt,10pt),stroke:.7pt))
  #place(top + left,dx: 155pt,dy: 3pt,text(size:8pt)[$t_("cycle")$])
  #place(top + left,dx: 2pt,dy: 9pt,text(size:8pt)[$V_("in")$])
  #place(top + left,dx: 4pt,dy: 76pt,text(size:8pt)[$V_("OL")$])
  #place(top + left,dx: 218pt,dy: 19pt,text(size:8pt)[$V_("OH")$])
  // lower waveform
  #place(top + left,dx: 24pt,dy: 180pt,line(length: 326pt,stroke:.8pt))
  #place(top + left,dx: 24pt,dy: 180pt,line(end:(0pt,-80pt),stroke:.8pt))
  #place(top + left,dx: 25pt,dy: 110pt,
    curve(stroke:1.4pt,curve.move((0pt,0pt)),
      curve.line((63pt,0pt)),
      curve.cubic((89pt,0pt),(92pt,70pt),(111pt,70pt)),
      curve.line((180pt,70pt)),
      curve.cubic((205pt,70pt),(198pt,0pt),(220pt,0pt)),
      curve.line((279pt,0pt)),
      curve.cubic((293pt,0pt),(300pt,70pt),(310pt,70pt))))
  #place(top + left,dx: 4pt,dy: 111pt,text(size:8pt)[$V_("out")$])
  #place(top + left,dx: 280pt,dy: 111pt,text(size:7pt)[$V_("OH")$])
  #place(top + left,dx: 143pt,dy: 172pt,text(size:7pt)[$V_("OL")$])
  #place(top + left,dx: 97pt,dy: 139pt,line(length: 226pt,stroke:(dash:"dashed",thickness:.5pt)))
  #place(top + left,dx: 271pt,dy: 138pt,text(size:7pt)[50%])
  #place(top + left,dx: 67pt,dy: 78pt,line(end:(0pt,52pt),stroke:(dash:"dashed",thickness:.6pt)))
  #place(top + left,dx: 118pt,dy: 79pt,line(end:(0pt,52pt),stroke:(dash:"dashed",thickness:.6pt)))
  #place(top + left,dx: 209pt,dy: 80pt,line(end:(0pt,51pt),stroke:(dash:"dashed",thickness:.6pt)))
  #place(top + left,dx: 237pt,dy: 79pt,line(end:(0pt,51pt),stroke:(dash:"dashed",thickness:.6pt)))
  #place(top + left,dx: 79pt,dy: 94pt,text(size:7pt)[$t_("pHL")$])
  #place(top + left,dx: 235pt,dy: 94pt,text(size:7pt)[$t_("pLH")$])
  #place(top + left,dx: 130pt,dy: 141pt,text(size:7pt)[$t_("cycle")$])
])

#let mos-cross() = html.frame(block(width: 330pt,height: 206pt)[
  // P-type body, n+ source/drain and thin gate oxide
  #place(top + left,dx: 37pt,dy: 78pt,rect(width:262pt,height:98pt,stroke:.9pt,fill:white))
  #place(top + left,dx: 53pt,dy: 79pt,rect(width:70pt,height:24pt,stroke:.9pt,fill:rgb("e3e3e3")))
  #place(top + left,dx: 214pt,dy: 79pt,rect(width:70pt,height:24pt,stroke:.9pt,fill:rgb("e3e3e3")))
  #place(top + left,dx: 121pt,dy: 74pt,rect(width:95pt,height:5pt,stroke:.7pt,fill:rgb("e8e8e8")))
  #place(top + left,dx: 121pt,dy: 56pt,rect(width:95pt,height:18pt,stroke:.9pt,fill:rgb("d4d4d4")))
  // power connections and grounded body
  #place(top + left,dx: 82pt,dy: 63pt,line(end:(0pt,-24pt),stroke:.8pt))
  #place(top + left,dx: 166pt,dy: 56pt,line(end:(0pt,-36pt),stroke:.8pt))
  #place(top + left,dx: 250pt,dy: 63pt,line(end:(0pt,-24pt),stroke:.8pt))
  #place(top + left,dx: 167pt,dy: 176pt,line(end:(0pt,12pt),stroke:.8pt))
  #place(top + left,dx: 155pt,dy: 188pt,line(length:24pt,stroke:.8pt))
  #place(top + left,dx: 159pt,dy: 192pt,line(length:16pt,stroke:.8pt))
  #place(top + left,dx: 163pt,dy: 196pt,line(length:8pt,stroke:.8pt))
  #place(top + left,dx: 82pt,dy: 25pt,text(size:8pt)[$S$：源])
  #place(top + left,dx: 161pt,dy: 7pt,text(size:8pt)[$V_("GS")$])
  #place(top + left,dx: 245pt,dy: 25pt,text(size:8pt)[$D$：漏])
  #place(top + left,dx: 257pt,dy: 7pt,text(size:8pt)[$V_("DS")$])
  #place(top + left,dx: 141pt,dy: 59pt,text(size:8pt)[栅])
  #place(top + left,dx: 135pt,dy: 80pt,text(size:7pt)[$t_("ox")$])
  #place(top + left,dx: 64pt,dy: 84pt,text(size:8pt)[$n^+$])
  #place(top + left,dx: 236pt,dy: 84pt,text(size:8pt)[$n^+$])
  #place(top + left,dx: 131pt,dy: 144pt,text(size:9pt)[$p$ 型衬底])
  #place(top + left,dx: 121pt,dy: 108pt,line(length:95pt,stroke:.7pt))
  #place(top + left,dx: 166pt,dy: 110pt,text(size:8pt)[$L$])
  #place(top + left,dx: 8pt,dy: 66pt,text(size:8pt)[半导体])
  #place(top + left,dx: 6pt,dy: 80pt,text(size:7pt)[氧化物])
])

#let cmos-inverter() = html.frame(block(width: 256pt,height: 225pt)[
  #place(top + left,dx: 120pt,dy: 7pt,line(length:27pt,stroke:1pt))
  #place(top + left,dx: 134pt,dy: 7pt,line(end:(0pt,39pt),stroke:1pt))
  #place(top + left,dx: 134pt,dy: 47pt,line(end:(0pt,30pt),stroke:1pt))
  #place(top + left,dx: 134pt,dy: 116pt,line(end:(0pt,48pt),stroke:1pt))
  #place(top + left,dx: 134pt,dy: 165pt,line(end:(0pt,28pt),stroke:1pt))
  #place(top + left,dx: 121pt,dy: 193pt,line(length:26pt,stroke:1pt))
  #place(top + left,dx: 126pt,dy: 198pt,line(length:16pt,stroke:1pt))
  #place(top + left,dx: 130pt,dy: 203pt,line(length:8pt,stroke:1pt))
  // PMOS top gate and inversion bubble
  #place(top + left,dx: 125pt,dy: 49pt,line(end:(0pt,27pt),stroke:1pt))
  #place(top + left,dx: 112pt,dy: 47pt,line(end:(0pt,29pt),stroke:1pt))
  #place(top + left,dx: 106pt,dy: 59pt,circle(radius:3pt,stroke:.9pt,fill:white))
  #place(top + left,dx: 75pt,dy: 62pt,line(length:28pt,stroke:1pt))
  // NMOS bottom
  #place(top + left,dx: 125pt,dy: 124pt,line(end:(0pt,32pt),stroke:1pt))
  #place(top + left,dx: 112pt,dy: 125pt,line(end:(0pt,29pt),stroke:1pt))
  #place(top + left,dx: 75pt,dy: 139pt,line(length:36pt,stroke:1pt))
  // input connection and output/load
  #place(top + left,dx: 75pt,dy: 62pt,line(end:(0pt,77pt),stroke:1pt))
  #place(top + left,dx: 24pt,dy: 101pt,line(length:51pt,stroke:1pt))
  #place(top + left,dx: 134pt,dy: 101pt,line(length:57pt,stroke:1pt))
  #place(top + left,dx: 191pt,dy: 101pt,circle(radius:2.4pt,stroke:1pt,fill:white))
  #place(top + left,dx: 175pt,dy: 101pt,line(end:(0pt,28pt),stroke:.9pt))
  #place(top + left,dx: 165pt,dy: 129pt,line(length:20pt,stroke:.9pt))
  #place(top + left,dx: 165pt,dy: 135pt,line(length:20pt,stroke:.9pt))
  #place(top + left,dx: 175pt,dy: 135pt,line(end:(0pt,15pt),stroke:.9pt))
  #place(top + left,dx: 165pt,dy: 150pt,line(length:20pt,stroke:.8pt))
  #place(top + left,dx: 169pt,dy: 155pt,line(length:12pt,stroke:.8pt))
  #place(top + left,dx: 173pt,dy: 160pt,line(length:4pt,stroke:.8pt))
  #place(top + left,dx: 17pt,dy: 88pt,text(size:9pt)[$V_("in")$])
  #place(top + left,dx: 197pt,dy: 93pt,text(size:9pt)[$V_("out")$])
  #place(top + left,dx: 139pt,dy: 1pt,text(size:8pt)[$V_("DD")$])
  #place(top + left,dx: 136pt,dy: 202pt,text(size:8pt)[Gnd])
  #place(top + left,dx: 181pt,dy: 129pt,text(size:8pt)[$C$])
  #place(top + left,dx: 147pt,dy: 51pt,text(size:8pt)[PMOS])
  #place(top + left,dx: 147pt,dy: 143pt,text(size:8pt)[NMOS])
])

#let resistor-inverter() = html.frame(block(width:255pt,height:177pt)[
  #place(top + left,dx: 113pt,dy: 7pt,line(length:39pt,stroke:.9pt))
  #place(top + left,dx: 132pt,dy: 7pt,line(end:(0pt,20pt),stroke:.9pt))
  #place(top + left,dx: 132pt,dy: 27pt,rect(width:9pt,height:38pt,stroke:.9pt,fill:white))
  #place(top + left,dx: 132pt,dy: 65pt,line(end:(0pt,39pt),stroke:.9pt))
  #place(top + left,dx: 132pt,dy: 104pt,line(end:(0pt,42pt),stroke:.9pt))
  #place(top + left,dx: 119pt,dy: 106pt,line(end:(0pt,29pt),stroke:.9pt))
  #place(top + left,dx: 108pt,dy: 108pt,line(end:(0pt,27pt),stroke:.9pt))
  #place(top + left,dx: 63pt,dy: 121pt,line(length:45pt,stroke:.9pt))
  #place(top + left,dx: 132pt,dy: 147pt,line(end:(0pt,15pt),stroke:.9pt))
  #place(top + left,dx: 118pt,dy: 162pt,line(length:28pt,stroke:.9pt))
  #place(top + left,dx: 122pt,dy: 167pt,line(length:20pt,stroke:.9pt))
  #place(top + left,dx: 126pt,dy: 172pt,line(length:12pt,stroke:.9pt))
  #place(top + left,dx: 132pt,dy: 86pt,line(length:58pt,stroke:.9pt))
  #place(top + left,dx: 177pt,dy: 86pt,line(end:(0pt,19pt),stroke:.9pt))
  #place(top + left,dx: 169pt,dy: 105pt,line(length:16pt,stroke:.9pt))
  #place(top + left,dx: 169pt,dy: 111pt,line(length:16pt,stroke:.9pt))
  #place(top + left,dx: 177pt,dy: 111pt,line(end:(0pt,11pt),stroke:.9pt))
  #place(top + left,dx: 169pt,dy: 122pt,line(length:16pt,stroke:.9pt))
  #place(top + left,dx: 173pt,dy: 127pt,line(length:8pt,stroke:.9pt))
  #place(top + left,dx: 0pt,dy: 111pt,text(size:9pt)[$V_("in") = V_("DD")$])
  #place(top + left,dx: 145pt,dy: 3pt,text(size:8pt)[$V_("DD")$])
  #place(top + left,dx: 142pt,dy: 36pt,text(size:8pt)[$R_L$])
  #place(top + left,dx: 196pt,dy: 78pt,text(size:8pt)[$V_("out")$ = 低])
  #place(top + left,dx: 143pt,dy: 107pt,text(size:8pt)[$I_("DC")$])
])

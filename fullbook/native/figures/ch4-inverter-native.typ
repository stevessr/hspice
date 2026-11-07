// Native geometry for chapter 4 inverter VTC and noise margins, source PDF127–136.
// Editorial figures for teaching: the geometries are editable Typst shapes.
// These are qualitative redrawings, not digitized measurements or 1:1 facsimiles.
#let inverter-vtc(ideal: false, title: "") = html.frame(block(width: 345pt, height: 159pt)[
  #place(top + left, dx: 10pt, dy: 3pt, text(size: 7pt)[#title])
  #place(top + left, dx: 38pt, dy: 140pt, line(length: 271pt, stroke: .8pt))
  #place(top + left, dx: 38pt, dy: 140pt, line(end: (0pt,-113pt), stroke: .8pt))
  #place(top + left, dx: 11pt, dy: 20pt, text(size: 8pt)[$V_("out")$]))
  #place(top + left, dx: 294pt, dy: 141pt, text(size: 8pt)[$V_("in")$]))
  #place(top + left, dx: 39pt, dy: 27pt, text(size: 7pt)[$V_("OH")$]))
  #place(top + left, dx: 39pt, dy: 122pt, text(size: 7pt)[$V_("OL")$]))
  #if ideal [
    #place(top + left, dx: 42pt, dy: 31pt, line(length: 116pt, stroke: 1.2pt))
    #place(top + left, dx: 158pt, dy: 31pt, line(end: (0pt,103pt), stroke: 1.2pt))
    #place(top + left, dx: 158pt, dy: 134pt, line(length: 143pt, stroke: 1.2pt))
    #place(top + left, dx: 142pt, dy: 145pt, text(size: 7pt)[$V_("DD")/2$]))
  ] else [
    #place(top + left, dx: 40pt, dy: 31pt,
      curve(stroke: 1.3pt, curve.move((0pt,0pt)),
            curve.cubic((121pt,0pt),(107pt,101pt),(259pt,103pt))))
    #place(top + left, dx: 39pt, dy: 137pt, line(end:(264pt,-103pt),stroke:(dash:"dashed",thickness:.55pt)))
  ]
])
#let noise-chain() = html.frame(block(width: 345pt, height: 140pt)[
  #place(top + left, dx: 7pt, dy: 4pt, text(size: 8pt)[输入噪声沿六级反相器传播的示意])
  #for i in range(6) [
    #let x = 18pt + i*51pt
    #place(top + left, dx:x,dy:47pt, polygon((0pt,0pt),(30pt,16pt),(0pt,32pt),
       stroke:.75pt,fill:rgb("eeeeee")))
    #place(top + left, dx:x + 25pt,dy:47pt,circle(radius:2pt,stroke:.7pt,fill:white))
    #place(top + left, dx:x + 16pt,dy:72pt,text(size:7pt)[#(i + 1)])
    #if i < 5 [
      #place(top + left,dx:x + 29pt,dy:47pt,line(length:18pt,stroke:.8pt))
    ]
  ]
  #place(top + left,dx:8pt,dy:110pt,text(size:7.5pt)[级联VTC的噪声传播由相邻级的增益和输入/输出容限决定])
])
#let noise-margins() = html.frame(block(width: 345pt, height: 172pt)[
  #place(top + left, dx: 32pt, dy: 145pt, line(length: 280pt, stroke:.8pt))
  #place(top + left, dx: 32pt, dy: 145pt, line(end:(0pt,-126pt),stroke:.8pt))
  #place(top + left, dx: 34pt, dy: 33pt,
    curve(stroke: 1.2pt, curve.move((0pt,0pt)),
      curve.cubic((119pt,0pt),(95pt,103pt),(256pt,107pt))))
  #for x in (97pt,171pt) [
    #place(top + left,dx:x,dy:39pt,line(end:(0pt,103pt),stroke:(dash:"dashed",thickness:.6pt)))
  ]
  #place(top + left,dx:31pt,dy:151pt,text(size:7pt)[$V_("OL")$]))
  #place(top + left,dx:84pt,dy:151pt,text(size:7pt)[$V_("IL")$]))
  #place(top + left,dx:155pt,dy:151pt,text(size:7pt)[$V_("IH")$]))
  #place(top + left,dx:272pt,dy:151pt,text(size:7pt)[$V_("OH")$]))
  #place(top + left,dx:45pt,dy:15pt,text(size:7pt)[两个单位斜率点定义输入高/低电平边界])
  #place(top + left,dx:30pt,dy:167pt,text(size:7pt)[$"NM_L"=V_("IL")-V_("OL"), quad "NM_H"=V_("OH")-V_("IH")$]))
])
#let resistor-load-nmos() = html.frame(block(width: 346pt, height: 171pt)[
  #place(top + left,dx:10pt,dy:4pt,text(size:8pt)[电阻负载 NMOS 反相器])
  #place(top + left,dx:98pt,dy:27pt,line(end:(0pt,35pt),stroke:.8pt))
  #place(top + left,dx:91pt,dy:31pt,text(size:7pt)[$V_("DD")$]))
  #place(top + left,dx:91pt,dy:39pt,rect(width:14pt,height:26pt,stroke:.8pt,fill:rgb("eeeeee")))
  #place(top + left,dx:108pt,dy:45pt,text(size:8pt)[$R_L$]))
  #place(top + left,dx:98pt,dy:64pt,line(end:(0pt,34pt),stroke:.8pt))
  #place(top + left,dx:98pt,dy:75pt,circle(radius:2.4pt,fill:rgb("333333")))
  #place(top + left,dx:100pt,dy:77pt,line(length:54pt,stroke:.8pt))
  #place(top + left,dx:165pt,dy:72pt,text(size:8pt)[$V_("out")$]))
  #place(top + left,dx:98pt,dy:97pt,line(end:(0pt,28pt),stroke:.8pt))
  #place(top + left,dx:87pt,dy:96pt,line(end:(0pt,31pt),stroke:1.4pt))
  #place(top + left,dx:63pt,dy:111pt,line(length:23pt,stroke:.8pt))
  #place(top + left,dx:18pt,dy:105pt,text(size:8pt)[$V_("in")$]))
  #place(top + left,dx:98pt,dy:125pt,line(end:(0pt,27pt),stroke:.8pt))
  #place(top + left,dx:85pt,dy:153pt,line(length:25pt,stroke:.8pt))
  #place(top + left,dx:90pt,dy:158pt,line(length:15pt,stroke:.8pt))
  #place(top + left,dx:95pt,dy:163pt,line(length:5pt,stroke:.8pt))
  #place(top + left,dx:207pt,dy:58pt,text(size:8pt)[$I_R = (V_("DD")-V_("out"))/R_L$]))
  #place(top + left,dx:207pt,dy:82pt,text(size:8pt)[$I_D = I_R$]))
  #place(top + left,dx:207pt,dy:105pt,text(size:8pt)[$C_T$：输出负载])
])
#let iv-load-line() = html.frame(block(width: 346pt, height: 183pt)[
  #place(top + left,dx:30pt,dy:159pt,line(length:285pt,stroke:.8pt))
  #place(top + left,dx:30pt,dy:159pt,line(end:(0pt,-143pt),stroke:.8pt))
  #place(top + left,dx:35pt,dy:22pt, text(size:7pt)[$I_D$]))
  #place(top + left,dx:294pt,dy:160pt,text(size:7pt)[$V_("DS")=V_("out")$]))
  #place(top + left,dx:31pt,dy:39pt,line(end:(267pt,119pt),stroke:(dash:"dashed",thickness:1pt)))
  #for i in range(3) [
    #let rise = 100pt-i*30pt
    #place(top + left,dx:31pt,dy:158pt,
      curve(stroke:1.0pt,curve.move((0pt,0pt)),
        curve.cubic((37pt,-rise),(98pt,-rise-8pt),(259pt,-rise-6pt))))
  ]
  #place(top + left,dx:174pt,dy:96pt,text(size:7pt)[负载线]))
  #place(top + left,dx:137pt,dy:12pt,text(size:7pt)[不同 $V_("GS")$ 的漏电流族])
])

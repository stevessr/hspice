// PDF357–364 source-guided native RC ladder, accurate distinct L/π/T topologies, waveforms and buffer figures.
// Editable schematics, but original physical placement not strictly accepted.
#import "ch7-domino-continuation-native.typ": w,t,b,inv,cap,gnd
#let ladder(n:5)=html.frame(block(width:388pt,height:134pt)[
  #t(7pt,10pt,"输入")
  #w(42pt,53pt,56pt,53pt)
  #for i in range(n) [
    #let x=58pt+i*59pt
    #b(x,42pt,37pt,22pt,"R")
    #w(x+37pt,53pt,x+55pt,53pt)
    #w(x+46pt,53pt,x+46pt,87pt)
    #cap(x+38pt,87pt)
    #gnd(x+46pt,109pt)
  ]
  #t(354pt,49pt,"输出")
])
// Two side-by-side decaying output waveforms, preserving the source's 0..70ps
// horizontal axis and v=1 to 0 direction. Approximate editable polylines:
// only the qualitative curve shapes come from the scan, not digitized data.
#let characteristic()=html.frame(block(width:388pt,height:171pt)[
  #for k in range(2) [
    #let xx=9pt+k*193pt
    #t(xx+31pt,0pt,if k==0 {"Rwire"} else {"Rint"})
    #b(xx+62pt,7pt,43pt,19pt,if k==0 {"Rwire"} else {"Rint"})
    #w(xx+20pt,16pt,xx+62pt,16pt)
    #w(xx+105pt,16pt,xx+130pt,16pt)
    #w(xx+129pt,16pt,xx+129pt,33pt)
    #cap(xx+121pt,33pt)
    #gnd(xx+129pt,42pt)
    #t(xx+138pt,33pt,if k==0 {"Cwire"} else {"Cint"})
    #w(xx+17pt,142pt,xx+184pt,142pt)
    #w(xx+17pt,142pt,xx+17pt,58pt)
    #t(xx+1pt,52pt,"1")
    #t(xx+5pt,133pt,"0")
    #t(xx+164pt,146pt,"70")
    #t(xx+87pt,146pt,"t(ps)")
    #let voltages=if k==0 {
      (1.0,0.81,0.67,0.54,0.44,0.36,0.29,0.24,0.19,0.16,0.13,0.10,0.08,0.07,0.06)
    } else {
      (1.0,0.70,0.44,0.24,0.11,0.04,0.015,0.005,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
    }
    #for i in range(14) [
      #let x1=xx+17pt+i*11pt
      #let x2=xx+17pt+(i+1)*11pt
      #let y1=58pt+(1.0 - voltages.at(i))*84pt
      #let y2=58pt+(1.0 - voltages.at(i+1))*84pt
      #w(x1,y1,x2,y2)
    ]
    #t(xx+41pt,161pt,if k==0 {"(a) 集总 RC 波形"} else {"(b) 分布式 RC 波形"})
  ]
])

#let elmore()=html.frame(block(width:388pt,height:148pt)[
  #t(5pt,7pt,"电源")
  #w(39pt,59pt,58pt,59pt)
  #for i in range(3) [
    #let x=66pt+i*92pt
    #b(x,49pt,55pt,21pt,"R"+str(i+1))
    #w(x+55pt,59pt,x+81pt,59pt)
    #w(x+72pt,59pt,x+72pt,93pt)
    #cap(x+64pt,92pt)
    #gnd(x+72pt,110pt)
    #t(x+65pt,122pt,"C"+str(i+1))
  ]
  #t(354pt,55pt,"OUT")
])
#let branched()=html.frame(block(width:388pt,height:151pt)[
  #t(5pt,59pt,"IN")
  #b(45pt,57pt,57pt,23pt,"R1")
  #w(102pt,68pt,165pt,68pt)
  #w(165pt,68pt,165pt,20pt)
  #w(165pt,68pt,165pt,118pt)
  #b(184pt,18pt,63pt,25pt,"R3")
  #b(184pt,107pt,63pt,25pt,"R2")
  #w(165pt,31pt,184pt,31pt)
  #w(165pt,119pt,184pt,119pt)
  #t(266pt,21pt,"节点3 / C3")
  #t(266pt,113pt,"节点2 / C2")
  #t(113pt,81pt,"节点1 / C1")
])
#let driven-wire()=html.frame(block(width:388pt,height:143pt)[
  #inv(6pt,53pt)
  #w(32pt,53pt,45pt,53pt)
  #for i in range(5) [
    #let x=45pt+i*63pt
    #b(x,42pt,39pt,22pt,"Rw")
    #w(x+39pt,53pt,x+62pt,53pt)
    #w(x+49pt,53pt,x+49pt,88pt)
    #cap(x+41pt,88pt)
    #gnd(x+49pt,110pt)
  ]
  #t(348pt,45pt,"OUT")
  #t(129pt,128pt,"Cw × n：均匀分布 RC")
])
// Distinct actual RC topologies: L has one output shunt, pi two half-caps,
// T two half-resistors and a middle shunt. The old version drew 3 identical R+C.
#let shunt(x,top-y,tag)={
  w(x,top-y,x,top-y+18pt)
  cap(x - 7pt,top-y+18pt)
  w(x,top-y+23pt,x,top-y+29pt)
  gnd(x,top-y+29pt)
  t(x+7pt,top-y+14pt,tag)
}
#let models()=html.frame(block(width:388pt,height:138pt)[
  #for k in range(3) [
    #let x=5pt+127pt*k
    #t(x+38pt,4pt,("L 型","π 型","T 型").at(k))
    #w(x+6pt,42pt,x+119pt,42pt)
    #if k==0 [
      #b(x+30pt,31pt,45pt,21pt,"Rwire")
      #shunt(x+98pt,42pt,"Cwire")
      #t(x+14pt,119pt,"(a) 单末端电容")
    ] else if k==1 [
      #b(x+43pt,31pt,41pt,21pt,"Rwire")
      #shunt(x+22pt,42pt,"C/2")
      #shunt(x+102pt,42pt,"C/2")
      #t(x+15pt,119pt,"(b) 两端各 C/2")
    ] else [
      #b(x+18pt,31pt,36pt,21pt,"R/2")
      #b(x+74pt,31pt,36pt,21pt,"R/2")
      #shunt(x+64pt,42pt,"Cwire")
      #t(x+19pt,119pt,"(c) 中点 Cwire")
    ]
  ]
])

#let fanout()=html.frame(block(width:388pt,height:147pt)[
  #t(5pt,27pt,"In")
  #inv(25pt,51pt)
  #w(51pt,51pt,184pt,51pt)
  #t(84pt,35pt,"20 μm 导线")
  #for k in range(4) [
    #let y=4pt+k*35pt
    #w(184pt,51pt,234pt,y+12pt)
    #inv(234pt,y+12pt)
    #t(276pt,y+5pt,("a","b","c","d").at(k))
  ]
  #t(12pt,138pt,"四个相同反相器负载")
])
// Source horizontal axis is TECHNOLOGY (nm), not line length.
// Reproduce ONLY grounded nodes from printed p344: 350/130/65 nm, with
// FO4=150/40/25ps and L=1/2/3mm wire values from the text. Interpolating
// connected strokes convey trend; the chart is not a digitized data plot.
#let length-trends()=html.frame(block(width:388pt,height:176pt)[
  #let y(v)=144pt - v * 0.094pt
  #let x350=120pt
  #let x130=235pt
  #let x65=307pt
  #w(47pt,144pt,368pt,144pt)
  #w(47pt,144pt,47pt,24pt)
  #t(1pt,4pt,"延迟(ps)")
  #t(6pt,22pt,"1200")
  #t(8pt,88pt,"600")
  #t(27pt,137pt,"0")
  #t(107pt,151pt,"350")
  #t(225pt,151pt,"130")
  #t(300pt,151pt,"65")
  #t(337pt,151pt,"nm")
  #t(129pt,165pt,"工艺尺寸（从大到小）")
  // 1 mm: 3 / 27 / 116 ps
  #w(x350,y(3),x130,y(27))
  #w(x130,y(27),x65,y(116))
  // 2 mm: 12 / 110 / 460 ps
  #w(x350,y(12),x130,y(110))
  #w(x130,y(110),x65,y(460))
  // 3 mm: 30 / 240 / 1035 ps
  #w(x350,y(30),x130,y(240))
  #w(x130,y(240),x65,y(1035))
  // FO4: 150 / 40 / 25 ps; falling technology-scaled gate delays
  #w(x350,y(150),x130,y(40))
  #w(x130,y(40),x65,y(25))
  #for item in ((3,27,116),(12,110,460),(30,240,1035),(150,40,25)) [
    #let v350=item.at(0)
    #let v130=item.at(1)
    #let v65=item.at(2)
    #place(top+left,dx:x350 - 2pt,dy:y(v350) - 2pt,circle(radius:2pt,fill:black))
    #place(top+left,dx:x130 - 2pt,dy:y(v130) - 2pt,circle(radius:2pt,fill:black))
    #place(top+left,dx:x65 - 2pt,dy:y(v65) - 2pt,circle(radius:2pt,fill:black))
  ]
  #t(310pt,y(1035)-10pt,"3 mm")
  #t(310pt,y(460)-10pt,"2 mm")
  #t(310pt,y(116)-12pt,"1 mm")
  #t(177pt,y(110)+7pt,"FO4")
])

// Restore all Fig10.10 parts (a) chain, (b) stage and (c) complete π RC
// segment with Reqn/M, Rint L/N, two half-wire capacitances and fanout CgM.
#let inserted-buffers()=html.frame(block(width:388pt,height:204pt)[
  #t(5pt,0pt,"(a) 长为 L 的线插入 N 个等尺寸缓冲器")
  #for i in range(3) [
    #let x=30pt+i*121pt
    #inv(x,30pt)
    #w(x+25pt,30pt,x+119pt,30pt)
    #t(x+53pt,13pt,"L/N")
  ]
  #t(5pt,58pt,"(b) 缓冲器与连线的一段")
  #inv(21pt,89pt)
  #w(46pt,89pt,85pt,89pt)
  #b(85pt,79pt,77pt,20pt,"Rint L/N")
  #w(162pt,89pt,331pt,89pt)
  #w(202pt,89pt,202pt,100pt)
  #cap(195pt,100pt)
  #gnd(202pt,111pt)
  #t(209pt,98pt,"Cint L/N")
  #t(327pt,75pt,"Cload")
  #t(5pt,133pt,"(c) 单段 π 模型：两端各 Cint L/(2N)")
  #b(12pt,153pt,51pt,19pt,"Reqn/M")
  #w(63pt,162pt,95pt,162pt)
  #w(95pt,162pt,130pt,162pt)
  #w(111pt,162pt,111pt,171pt)
  #cap(104pt,171pt)
  #gnd(111pt,182pt)
  #b(130pt,153pt,63pt,19pt,"Rint L/N")
  #w(193pt,162pt,225pt,162pt)
  #w(225pt,162pt,358pt,162pt)
  #w(245pt,162pt,245pt,171pt)
  #cap(238pt,171pt)
  #gnd(245pt,182pt)
  #t(91pt,190pt,"Cint L/2N")
  #t(223pt,190pt,"Cint L/2N")
  #t(298pt,147pt,"Cg M(1+β)")
])

#let figure10more(n)={
  if n==4 {ladder(n:5)}
  else if n==5 {characteristic()}
  else if n==6 {elmore()}
  else if n==7 {driven-wire()}
  else if n==8 {models()}
  else if n==9 {length-trends()}
  else if n==10 {inserted-buffers()}
  else {branched()}
}
#let fig-example102()=fanout()
#let fig-example101()=branched()

// PDF285–291 / printed266–272. Native editable topology drafts,
// pending transistor-by-transistor and geometry fidelity review.
#import "ch7-domino-continuation-native.typ": w, t, b, inv, cap, gnd
#let tg(x,y,label:"TG")={
  b(x,y,30pt,23pt,label)
  w(x+15pt,y,x+15pt,y-11pt)
  w(x+15pt,y+23pt,x+15pt,y+34pt)
}
#let chain(n:3)=html.frame(block(width:372pt,height:118pt)[
  #for row in range(3) [
    #t(4pt,15pt + row*34pt,("1.2V","0V","VDD").at(row))
    #for k in range(n) [
      #tg(59pt + k*62pt,6pt + row*34pt)
      #if k<n-1 {w(89pt+k*62pt,18pt+row*34pt,121pt+k*62pt,18pt+row*34pt)}
    ]
    #t(266pt,17pt + row*34pt,"Q"+str(row))
  ]
])
#let mux(topology:"series")=html.frame(block(width:365pt,height:111pt)[
  #t(8pt,4pt,"传输门结构："+topology)
  #tg(38pt,28pt,label:"A")
  #tg(95pt,28pt,label:"B")
  #w(68pt,39pt,95pt,39pt)
  #w(125pt,39pt,174pt,39pt)
  #tg(38pt,72pt,label:"C")
  #tg(95pt,72pt,label:"D")
  #w(68pt,83pt,95pt,83pt)
  #w(125pt,83pt,174pt,39pt)
  #t(189pt,35pt,"OUT")
])
#let figP72()=grid(columns:(1fr,1fr),column-gutter:5pt,
 [#mux(topology:"(a) 串联")],[#mux(topology:"(b) 并联")],
 [#mux(topology:"(c) 两支")],[#mux(topology:"(d) 组合")])
#let figP73()=grid(columns:(1fr,1fr),column-gutter:8pt,
 [#html.frame(block(width:180pt,height:105pt)[
   #t(4pt,4pt,"(a) 单 NMOS")
   #b(23pt,32pt,45pt,27pt,"N W")
   #w(68pt,45pt,84pt,45pt)
   #inv(84pt,45pt)
   #t(127pt,38pt,"Q̄")
   #t(12pt,75pt,"D = VDD")
 ])],
 [#html.frame(block(width:180pt,height:105pt)[
   #t(4pt,4pt,"(b) CMOS TG")
   #tg(23pt,32pt)
   #w(53pt,43pt,84pt,43pt)
   #inv(84pt,43pt)
   #t(127pt,38pt,"Q̄")
   #t(12pt,75pt,"CLK / CLK̅")
 ])])
#let figP75()=grid(columns:(1fr,1fr),column-gutter:8pt,
 [#html.frame(block(width:180pt,height:114pt)[
   #t(4pt,4pt,"(a) (A+B)·C")
   #b(53pt,24pt,69pt,34pt,"A | B")
   #b(53pt,64pt,69pt,26pt,"C")
   #w(87pt,58pt,87pt,64pt)
   #gnd(87pt,91pt)
 ])],
 [#html.frame(block(width:180pt,height:114pt)[
   #t(4pt,4pt,"(b) (A+B)(C+D+E)")
   #b(53pt,24pt,69pt,34pt,"A | B")
   #b(53pt,64pt,69pt,26pt,"C|D|E")
   #w(87pt,58pt,87pt,64pt)
   #gnd(87pt,91pt)
 ])])
#let figP77()=grid(columns:(1fr,1fr),column-gutter:8pt,
 [#mux(topology:"(a) 双传输门")],[#mux(topology:"(b) 反相器加TG")])
#let figP78()=html.frame(block(width:367pt,height:110pt)[
  #t(3pt,17pt,"A")
  #inv(22pt,28pt)
  #w(48pt,28pt,92pt,28pt)
  #tg(92pt,16pt,label:"sel")
  #t(3pt,81pt,"B")
  #inv(22pt,79pt)
  #w(48pt,79pt,92pt,79pt)
  #tg(92pt,67pt,label:"selB")
  #w(122pt,28pt,165pt,53pt)
  #w(122pt,79pt,165pt,53pt)
  #inv(165pt,53pt)
  #t(206pt,44pt,"OUT / C")
  #t(240pt,91pt,"输出反相器尺寸 f")
])
#let figP79()=figP75()
#let figP710()=html.frame(block(width:363pt,height:135pt)[
  #t(5pt,5pt,"互补传输门复杂组合逻辑")
  #for k in range(3) [
    #tg(21pt,18pt+k*38pt,label:("B","C","A").at(k))
    #tg(93pt,18pt+k*38pt,label:"TG")
    #w(51pt,29pt+k*38pt,93pt,29pt+k*38pt)
    #w(123pt,29pt+k*38pt,161pt,67pt)
  ]
  #tg(188pt,43pt)
  #w(161pt,67pt,188pt,55pt)
  #w(218pt,55pt,274pt,55pt)
  #t(281pt,47pt,"OUT")
])
#let figP711()=grid(columns:(1fr,1fr),column-gutter:8pt,
 [#html.frame(block(width:180pt,height:120pt)[
   #t(12pt,4pt,"1.2 V")
   #b(56pt,20pt,68pt,22pt,"预充P")
   #b(56pt,47pt,68pt,26pt,"a，b")
   #b(56pt,77pt,68pt,22pt,"时钟N")
   #t(2pt,54pt,"F")
   #t(129pt,53pt,"X")
   #t(129pt,87pt,"Y")
 ])],
 [#html.frame(block(width:180pt,height:120pt)[
   #for i in range(3) [
     #w(8pt,27pt+i*27pt,165pt,27pt+i*27pt)
     #t(8pt,6pt+i*27pt,("φ","a","b").at(i))
   ]
   #t(7pt,104pt,"时序线：仅结构重绘")
 ])])
#let figP713()=html.frame(block(width:365pt,height:115pt)[
  #t(144pt,2pt,"VDD")
  #b(106pt,20pt,125pt,24pt,"PMOS 预充")
  #b(106pt,51pt,125pt,33pt,"a,b,c,d,e NMOS")
  #w(168pt,44pt,168pt,51pt)
  #w(231pt,67pt,262pt,67pt)
  #inv(262pt,67pt)
  #t(305pt,61pt,"OUT")
  #b(148pt,90pt,42pt,21pt,"CLK")
])
#let figP714()=grid(columns:(1fr,1fr),column-gutter:8pt,
 [#html.frame(block(width:180pt,height:108pt)[
    #t(3pt,2pt,"(a) EN 控制 CMOS")
    #b(53pt,20pt,75pt,27pt,"P ×2")
    #b(53pt,58pt,75pt,26pt,"N ×2")
    #w(91pt,47pt,91pt,58pt)
    #t(132pt,40pt,"OUT")
 ])],
 [#html.frame(block(width:180pt,height:108pt)[
    #t(3pt,2pt,"(b) EN 控制 CMOS")
    #b(53pt,20pt,75pt,27pt,"P ×2")
    #b(53pt,58pt,75pt,26pt,"N ×2")
    #w(91pt,47pt,91pt,58pt)
    #t(132pt,40pt,"OUT")
 ])])
#let figP715()=html.frame(block(width:363pt,height:121pt)[
  #t(139pt,2pt,"VDD")
  #b(128pt,16pt,47pt,24pt,"M3")
  #t(184pt,35pt,"X")
  #w(151pt,40pt,151pt,56pt)
  #cap(144pt,56pt)
  #gnd(151pt,72pt)
  #b(228pt,17pt,47pt,24pt,"M2")
  #b(228pt,63pt,47pt,24pt,"M1")
  #w(175pt,40pt,228pt,29pt)
  #w(251pt,41pt,251pt,63pt)
  #w(275pt,40pt,303pt,40pt)
  #t(307pt,35pt,"Vout")
  #t(12pt,52pt,"Cb / Cx")
  #gnd(251pt,88pt)
])

// SOURCE PDF253–260 (printed 234–241).
// Editable, scan-guided Typst geometry for chapter 6 tail / chapter 7 opener.
// Engineering diagrams are PROVISIONAL: exact node geometry is not 1:1 certified.
#let wire(x1,y1,x2,y2) = place(top+left, dx:x1, dy:y1,
  line(end:(x2 - x1,y2 - y1),stroke:.75pt))
#let dot(x,y) = place(top+left, dx:x,dy:y,circle(radius:1.4pt,fill:black))
#let cap(x,y,label:"") = {
  place(top+left,dx:x,dy:y,line(length:13pt,stroke:.7pt))
  place(top+left,dx:x,dy:y+5pt,line(length:13pt,stroke:.7pt))
  if label!="" {place(top+left,dx:x+16pt,dy:y-5pt,text(size:7pt)[#label])}
}
#let gnd(x,y) = {
  wire(x,y,x,y+5pt)
  place(top+left,dx:x-9pt,dy:y+5pt,line(length:18pt,stroke:.7pt))
  place(top+left,dx:x-6pt,dy:y+8pt,line(length:12pt,stroke:.7pt))
  place(top+left,dx:x-3pt,dy:y+11pt,line(length:6pt,stroke:.7pt))
}
#let pass(x,y,p:false) = {
  wire(x,y,x+17pt,y)
  wire(x+38pt,y,x+55pt,y)
  place(top+left,dx:x+17pt,dy:y-3pt,rect(width:21pt,height:6pt,stroke:.8pt))
  wire(x+27pt,y-21pt,x+27pt,y-6pt)
  if p {place(top+left,dx:x+27pt,dy:y-8pt,circle(radius:2pt,fill:white,stroke:.7pt))}
}
#let gate(x,y,name:"NOR",width:44pt) = {
  place(top+left,dx:x,dy:y-13pt,rect(width:width,height:27pt,radius:9pt,stroke:.75pt))
  place(top+left,dx:x+5pt,dy:y-5pt,text(size:7pt)[#name])
}
#let inv(x,y) = {
  wire(x,y-12pt,x,y+12pt)
  wire(x,y-12pt,x+25pt,y)
  wire(x,y+12pt,x+25pt,y)
  place(top+left,dx:x+27pt,dy:y-2pt,circle(radius:2pt,stroke:.75pt,fill:white))
}
#let fig-p612()=html.frame(block(width:390pt,height:178pt)[
  #wire(6pt,52pt,36pt,52pt)
  #inv(36pt,52pt)
  #wire(66pt,52pt,81pt,52pt)
  #gate(81pt,52pt,name:"NAND")
  #wire(125pt,52pt,144pt,52pt)
  #dot(144pt,52pt)
  #wire(144pt,52pt,144pt,133pt)
  #for (i,y) in (25pt,58pt,91pt,124pt).enumerate() [
    #wire(144pt,y,189pt,y)
    #gate(189pt,y,name:"NOR")
    #wire(233pt,y,274pt,y)
  ]
  #gate(284pt,58pt,name:"NAND")
  #wire(328pt,58pt,355pt,58pt)
  #cap(352pt,84pt,label:"1000 Cinv")
  #cap(15pt,79pt,label:"Cinv")
  #gnd(20pt,88pt)
  #place(top+left,dx:7pt,dy:11pt,text(size:8pt)[输入]))
])
#let fig-p613()=html.frame(block(width:390pt,height:199pt)[
  #wire(4pt,94pt,35pt,94pt)
  #inv(35pt,94pt)
  #wire(65pt,94pt,83pt,94pt)
  #gate(83pt,94pt,name:"NAND")
  #wire(127pt,94pt,149pt,94pt)
  #gate(149pt,94pt,name:"NOR")
  #wire(193pt,94pt,223pt,94pt)
  #dot(223pt,94pt)
  #wire(223pt,94pt,223pt,160pt)
  #for (i,y) in (19pt,57pt,95pt,133pt).enumerate() [
    #wire(223pt,y,255pt,y)
    #gate(255pt,y,name:"NOR")
  ]
  #wire(299pt,95pt,314pt,95pt)
  #gate(314pt,95pt,name:"NAND")
  #wire(358pt,95pt,378pt,95pt)
  #cap(364pt,118pt,label:"8000 Cinv")
  #cap(207pt,114pt,label:"500 Cinv")
  #cap(9pt,120pt,label:"Cinv")
  #place(top+left,dx:3pt,dy:36pt,text(size:8pt)[输入]))
])
#let pass-panel(kind:"n",state:"on",vin:"0 V",vout:"0 V")=
  html.frame(block(width:187pt,height:97pt)[
    #pass(41pt,45pt,p:kind=="p")
    #wire(96pt,45pt,124pt,45pt)
    #cap(113pt,65pt,label:"CL")
    #gnd(119pt,78pt)
    #place(top+left,dx:5pt,dy:31pt,text(size:7pt)[#vin]))
    #place(top+left,dx:121pt,dy:29pt,text(size:7pt)[#vout]))
    #place(top+left,dx:52pt,dy:4pt,text(size:7pt)[#if state=="off" [截止，高阻] else [#if kind=="p" [$G=0$] else [$G=V_("DD")$]]]))
  ])
#let fig71()=grid(columns:(1fr,1fr),column-gutter:8pt,row-gutter:5pt,
  [#pass-panel(kind:"n",vin:"0 V",vout:"0 V")],
  [#pass-panel(kind:"p",vin:"VDD",vout:"VDD")],
  [#pass-panel(kind:"n",vin:"VDD",vout:"VDD−VTn")],
  [#pass-panel(kind:"p",vin:"0 V",vout:"|VTp|")],
  [#pass-panel(kind:"n",state:"off",vin:"VDD",vout:"高阻")],
  [#pass-panel(kind:"p",state:"off",vin:"0 V",vout:"高阻")])
#let series-panel(p:false,count:1,descending:false)=
  html.frame(block(width:121pt,height:99pt)[
    #for i in range(count) [
      #pass(3pt+i*24pt,49pt,p:p)
      #wire(31pt+i*24pt,27pt+i*5pt,31pt+i*24pt,34pt+i*5pt)
    ]
    #place(top+left,dx:5pt,dy:5pt,text(size:7pt)[#if p [$V_("out")=abs(V_("TP"))$] else [$V_("out")=V_("DD")-V_("TN")$]]))
    #cap(75pt,69pt,label:"CL")
  ])
#let fig72()=grid(columns:(1fr,1fr,1fr),column-gutter:8pt,
  [#series-panel(count:1)], [#series-panel(count:3)], [#series-panel(count:3,descending:true)])
#let fig73()=grid(columns:(1fr,1fr,1fr),column-gutter:8pt,
  [#series-panel(p:true,count:1)], [#series-panel(p:true,count:3)], [#series-panel(p:true,count:3,descending:true)])
#let feedthrough-panel()=html.frame(block(width:365pt,height:151pt)[
  #pass(95pt,72pt)
  #wire(150pt,72pt,193pt,72pt)
  #cap(179pt,94pt,label:"Cgnd")
  #gnd(185pt,106pt)
  #wire(123pt,51pt,123pt,30pt)
  #cap(135pt,39pt,label:"Cf")
  #wire(135pt,44pt,185pt,44pt)
  #wire(185pt,44pt,185pt,72pt)
  #place(top+left,dx:10pt,dy:61pt,text(size:8pt)[$V_("in")$]))
  #place(top+left,dx:203pt,dy:62pt,text(size:8pt)[$V_("out")$]))
  #place(top+left,dx:94pt,dy:9pt,text(size:8pt)[G: VDD → 0]))
])
#let divider-panel(sign:"+")=html.frame(block(width:181pt,height:120pt)[
  #wire(53pt,13pt,53pt,27pt)
  #cap(47pt,28pt,label:"Cf")
  #wire(53pt,33pt,53pt,53pt)
  #dot(53pt,53pt)
  #cap(47pt,68pt,label:"Cgnd")
  #wire(53pt,74pt,53pt,91pt)
  #gnd(53pt,91pt)
  #place(top+left,dx:64pt,dy:10pt,text(size:7pt)[$V_1$]))
  #place(top+left,dx:64pt,dy:48pt,text(size:7pt)[$V_2$]))
  #place(top+left,dx:90pt,dy:77pt,text(size:7pt)[#if sign=="+" [正馈通] else [负馈通]]))
])
#let fig75()=grid(columns:(1fr,1fr),column-gutter:7pt,
  [#divider-panel(sign:"+")],[#divider-panel(sign:"-")])
#let charge-panel(after:false)=html.frame(block(width:182pt,height:125pt)[
  #pass(36pt,37pt)
  #wire(36pt,37pt,18pt,37pt)
  #wire(91pt,37pt,131pt,37pt)
  #cap(12pt,71pt,label:"C1")
  #cap(129pt,71pt,label:"C2")
  #gnd(18pt,84pt)
  #gnd(135pt,84pt)
  #place(top+left,dx:19pt,dy:13pt,text(size:8pt)[#if after [$V^*$] else [$V_1$]]))
  #place(top+left,dx:123pt,dy:13pt,text(size:8pt)[#if after [$V^*$] else [$V_2$]]))
  #place(top+left,dx:47pt,dy:101pt,text(size:7pt)[#if after [（b）接通后] else [（a）接通前]]))
])
#let fig76()=grid(columns:(1fr,1fr),column-gutter:6pt,
  [#charge-panel()], [#charge-panel(after:true)])

// Source PDF253–260, originally printed pages 234–241.
// Editable Typst geometric illustrations. Electrical labels are source-grounded;
// fine line geometry, device arrow symbols and all depicted bias polarities
// remain subject to strict schematic-by-schematic review.
#let wire(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2-x1,y2-y1),stroke:.75pt))
#let point(x,y)=place(top+left,dx:x,dy:y,circle(radius:1.5pt,fill:black))
#let capacitor(x,y,mark:"")={
  wire(x,y,x,y+10pt)
  place(top+left,dx:x-8pt,dy:y+10pt,line(length:16pt,stroke:.8pt))
  place(top+left,dx:x-8pt,dy:y+15pt,line(length:16pt,stroke:.8pt))
  wire(x,y+15pt,x,y+27pt)
  if mark!="" {place(top+left,dx:x+10pt,dy:y+12pt,text(size:7pt)[#mark])}
}
#let mos(x,y,kind:"n",label:"")={
  wire(x,y,x,y+29pt)
  wire(x-5pt,y,x-5pt,y+29pt)
  wire(x-27pt,y+15pt,x-5pt,y+15pt)
  if kind=="p" {place(top+left,dx:x-8pt,dy:y+13pt,circle(radius:2.3pt,stroke:.7pt,fill:white))}
  if label!="" {place(top+left,dx:x+6pt,dy:y+12pt,text(size:7pt)[#label])}
}
#let logic(x,y,name:"NOR")={
  place(top+left,dx:x,dy:y,rect(width:50pt,height:29pt,radius:8pt,stroke:.75pt))
  place(top+left,dx:x+6pt,dy:y+10pt,text(size:7pt)[#name])
}
#let inverter(x,y)={
  wire(x,y,x,y+26pt)
  wire(x,y,x+32pt,y+13pt)
  wire(x,y+26pt,x+32pt,y+13pt)
  place(top+left,dx:x+34pt,dy:y+11pt,circle(radius:2pt,stroke:.75pt,fill:white))
}
#let fig-p612()=html.frame(block(width:396pt,height:118pt)[
  #wire(8pt,44pt,30pt,44pt)
  #inverter(30pt,31pt)
  #wire(66pt,44pt,91pt,44pt)
  #logic(91pt,29pt,name:"NAND")
  #wire(141pt,44pt,165pt,44pt)
  #wire(165pt,17pt,165pt,94pt)
  #for k in (0,1,2,3) [
    #let y=10pt+k*27pt
    #wire(165pt,y+13pt,191pt,y+13pt)
    #logic(191pt,y,name:"NOR")
  ]
  #wire(241pt,23pt,273pt,23pt)
  #logic(273pt,10pt,name:"NAND")
  #wire(323pt,23pt,357pt,23pt)
  #capacitor(355pt,31pt,mark:"1000 C_inv")
  #capacitor(16pt,55pt,mark:"C_inv")
])
#let fig-p613()=html.frame(block(width:405pt,height:156pt)[
  #wire(5pt,74pt,21pt,74pt)
  #inverter(21pt,61pt)
  #wire(57pt,74pt,70pt,74pt)
  #logic(70pt,59pt,name:"NAND")
  #wire(120pt,74pt,137pt,74pt)
  #for k in (0,1) [
    #let y=53pt+k*39pt
    #wire(137pt,74pt,151pt,y+14pt)
    #logic(151pt,y,name:"NOR")
  ]
  #wire(201pt,67pt,211pt,67pt)
  #wire(211pt,18pt,211pt,130pt)
  #for k in (0,1,2,3) [
    #let y=7pt+k*38pt
    #wire(211pt,y+14pt,224pt,y+14pt)
    #logic(224pt,y,name:"NOR")
  ]
  #wire(274pt,59pt,302pt,59pt)
  #logic(302pt,44pt,name:"NAND")
  #wire(352pt,59pt,391pt,59pt)
  #capacitor(391pt,70pt,mark:"8000 C_inv")
  #capacitor(207pt,78pt,mark:"500 C_inv")
])
#let fig71one(kind:"n",state:"on",high:false)=html.frame(block(width:195pt,height:80pt)[
  #place(top+left,dx:14pt,dy:14pt,text(size:7pt)[#if high [$V_("DD")$] else [0 V]]))
  #wire(42pt,35pt,82pt,35pt)
  #mos(82pt,20pt,kind:kind)
  #wire(82pt,35pt,137pt,35pt)
  #capacitor(139pt,45pt)
  #place(top+left,dx:136pt,dy:14pt,text(size:7pt)[#if high [$V_("DD")-V_T$] else [0 V]]))
  #place(top+left,dx:66pt,dy:55pt,text(size:7pt)[#kind #state]))
#let fig71()=grid(columns:(1fr,1fr),row-gutter:1pt,column-gutter:4pt,
  [#fig71one(kind:"n",state:"传低")],[#fig71one(kind:"p",state:"传高",high:true)],
  [#fig71one(kind:"n",state:"传高",high:true)],[#fig71one(kind:"p",state:"传低")],
  [#fig71one(kind:"n",state:"关闭")],[#fig71one(kind:"p",state:"关闭")])
#let fig72()=grid(columns:(1fr,1fr,1fr),column-gutter:4pt,
  [#block(width:128pt,height:121pt)[
    #mos(66pt,11pt)
    #capacitor(93pt,30pt,mark:"VDD−VT")
    #place(top+left,dx:30pt,dy:89pt,text(size:7pt)[（a）单管]))
  ]],
  [#block(width:128pt,height:121pt)[
    #for i in (0,1,2) [#mos(64pt,5pt+i*35pt)]
    #place(top+left,dx:16pt,dy:108pt,text(size:7pt)[（b）串联]))
  ]],
  [#block(width:128pt,height:121pt)[
    #for i in (0,1,2) [#mos(64pt,5pt+i*35pt)]
    #place(top+left,dx:16pt,dy:108pt,text(size:7pt)[（c）逐级阈值]))
  ]])
#let fig73()=fig72()
#let fig74()=html.frame(block(width:320pt,height:123pt)[
  #wire(12pt,64pt,112pt,64pt)
  #mos(112pt,46pt,kind:"n",label:"G")
  #wire(112pt,64pt,213pt,64pt)
  #capacitor(187pt,18pt,mark:"C_f")
  #capacitor(231pt,77pt,mark:"C_gnd")
  #place(top+left,dx:8pt,dy:35pt,text(size:8pt)[$V_("in")$]))
  #place(top+left,dx:210pt,dy:45pt,text(size:8pt)[$V_("out")$]))
  #place(top+left,dx:93pt,dy:10pt,text(size:8pt)[$V_("clk")$]))
])
#let fig75()=grid(columns:(1fr,1fr),column-gutter:10pt,
  [#block(width:190pt,height:122pt)[
    #capacitor(88pt,43pt,mark:"C_f")
    #capacitor(88pt,83pt,mark:"C_gnd")
    #wire(43pt,43pt,88pt,43pt)
    #place(top+left,dx:14pt,dy:14pt,text(size:8pt)[（a）正馈通]))
  ]],
  [#block(width:190pt,height:122pt)[
    #capacitor(88pt,43pt,mark:"C_f")
    #capacitor(88pt,83pt,mark:"C_gnd")
    #wire(43pt,43pt,88pt,43pt)
    #place(top+left,dx:14pt,dy:14pt,text(size:8pt)[（b）负馈通]))
  ]])
#let fig76()=grid(columns:(1fr,1fr),column-gutter:14pt,
  [#block(width:190pt,height:114pt)[
    #mos(86pt,36pt)
    #capacitor(43pt,71pt,mark:"C_1")
    #capacitor(137pt,71pt,mark:"C_2")
    #place(top+left,dx:23pt,dy:13pt,text(size:8pt)[（a）开关关闭]))
  ]],
  [#block(width:190pt,height:114pt)[
    #mos(86pt,36pt)
    #capacitor(43pt,71pt,mark:"C_1")
    #capacitor(137pt,71pt,mark:"C_2")
    #wire(56pt,53pt,86pt,53pt)
    #wire(86pt,53pt,127pt,53pt)
    #place(top+left,dx:23pt,dy:13pt,text(size:8pt)[（b）电荷共享]))
  ]])

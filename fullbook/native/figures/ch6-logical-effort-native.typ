// SOURCE PDF237–244 logical effort source-guided native Typst figure components.
// Geometry, device labels and gate wiring remain independently editable.
// These schematic sketches are NOT per-figure 1:1 verified.
#let seg(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.8pt))
#let cap(x,y,label:"")={
  place(top+left,dx:x,dy:y,line(length:13pt,stroke:.7pt))
  place(top+left,dx:x,dy:y + 5pt,line(length:13pt,stroke:.7pt))
  if label!="" {place(top+left,dx:x + 16pt,dy:y - 4pt,text(size:7pt)[#label])}
}
#let mos(x,y,p:false,label:"")={
  seg(x,y,x,y + 29pt)
  seg(x - 4pt,y,x - 4pt,y + 29pt)
  seg(x - 20pt,y + 15pt,x - 4pt,y + 15pt)
  if p {place(top+left,dx:x - 7pt,dy:y + 13pt,circle(radius:2.3pt,stroke:.65pt,fill:white))}
  if label!="" {place(top+left,dx:x + 5pt,dy:y + 11pt,text(size:7pt)[#label])}
}
#let le-panel(kind:"INV",up:"2",down:"1",le:"1")=html.frame(block(width:120pt,height:200pt)[
  #place(top+left,dx:27pt,dy:6pt,text(size:8pt)[$V_("DD")$])
  #seg(58pt,24pt,58pt,40pt)
  #mos(58pt,40pt,p:true,label:up)
  #seg(58pt,69pt,58pt,82pt)
  #if kind=="INV" [
    #mos(58pt,86pt,label:down)
    #seg(58pt,115pt,58pt,127pt)
  ] else if kind=="NAND" [
    #mos(58pt,80pt,label:down)
    #seg(58pt,109pt,58pt,111pt)
    #mos(58pt,111pt,label:down)
    #seg(58pt,140pt,58pt,150pt)
  ] else [
    #mos(58pt,86pt,label:down)
    #seg(58pt,115pt,58pt,128pt)
    #place(top+left,dx:76pt,dy:96pt,text(size:7pt)[并联NMOS])
  ]
  #seg(58pt,78pt,96pt,78pt)
  #place(top+left,dx:6pt,dy:166pt,text(size:8pt)[#kind])
  #place(top+left,dx:6pt,dy:184pt,text(size:8pt)[#("LE = "+le)])
])
#let fig627()=grid(columns:(1fr,1fr,1fr),column-gutter:8pt,
  [#le-panel(kind:"INV",up:"2",down:"1",le:"1")],
  [#le-panel(kind:"NAND",up:"2",down:"2",le:"4/3")],
  [#le-panel(kind:"NOR",up:"4",down:"1",le:"5/3")])
#let fig628()=grid(columns:(1fr,1fr,1fr),column-gutter:8pt,
  [#le-panel(kind:"INV",up:"2",down:"1",le:"1")],
  [#le-panel(kind:"NAND",up:"3/2",down:"3/2",le:"4/3")],
  [#le-panel(kind:"NOR",up:"12/5",down:"3/5",le:"5/3")])
#let fig629()=html.frame(block(width:334pt,height:207pt)[
  #seg(36pt,176pt,294pt,176pt)
  #seg(36pt,176pt,36pt,18pt)
  #place(top+left,dx:4pt,dy:10pt,text(size:8pt)[$D$])
  #place(top+left,dx:292pt,dy:177pt,text(size:8pt)[$"FO"$])
  #for i in (0,1,2,3,4,5) [
    #let x=36pt + i * 42pt
    #seg(x,176pt,x,179pt)
    #place(top+left,dx:x - 3pt,dy:182pt,text(size:7pt)[#str(i)])
  ]
  #seg(37pt,155pt,269pt,39pt)
  #seg(37pt,131pt,231pt,16pt)
  #seg(37pt,115pt,183pt,18pt)
  #place(top+left,dx:182pt,dy:50pt,text(size:7pt)[反相器 $1$])
  #place(top+left,dx:210pt,dy:15pt,text(size:7pt)[NAND $4/3$])
  #place(top+left,dx:110pt,dy:16pt,text(size:7pt)[NOR $5/3$])
  #place(top+left,dx:6pt,dy:92pt,text(size:7pt)[寄生延迟截距])
])
#let gate(x,y,kind:"NAND",wide:60pt)={
  place(top+left,dx:x,dy:y,rect(width:wide,height:31pt,radius:9pt,stroke:.85pt))
  place(top+left,dx:x + 5pt,dy:y + 10pt,text(size:8pt)[#kind])
}
#let inverter(x,y)={
  seg(x,y,x,y + 29pt)
  seg(x,y,x + 37pt,y + 14pt)
  seg(x,y + 29pt,x + 37pt,y + 14pt)
  place(top+left,dx:x + 38pt,dy:y + 12pt,circle(radius:2pt,stroke:.75pt,fill:white))
}
#let fig613path()=html.frame(block(width:390pt,height:100pt)[
  #seg(6pt,40pt,33pt,40pt)
  #inverter(33pt,26pt)
  #seg(74pt,40pt,103pt,40pt)
  #gate(104pt,25pt,kind:"NOR")
  #seg(164pt,40pt,188pt,40pt)
  #gate(188pt,25pt,kind:"NAND")
  #seg(248pt,40pt,271pt,40pt)
  #inverter(272pt,26pt)
  #seg(313pt,40pt,360pt,40pt)
  #cap(343pt,54pt,label:"20")
  #cap(6pt,54pt,label:"10")
  #place(top+left,dx:120pt,dy:70pt,text(size:7pt)[$X$])
  #place(top+left,dx:201pt,dy:70pt,text(size:7pt)[$Y$])
  #place(top+left,dx:280pt,dy:70pt,text(size:7pt)[$Z$])
])
#let fig614a()=html.frame(block(width:389pt,height:134pt)[
  #gate(40pt,14pt,kind:"NAND4")
  #gate(40pt,73pt,kind:"NAND4")
  #inverter(111pt,14pt)
  #inverter(111pt,73pt)
  #seg(152pt,30pt,226pt,30pt)
  #seg(152pt,90pt,226pt,90pt)
  #seg(226pt,30pt,226pt,57pt)
  #seg(226pt,90pt,226pt,57pt)
  #gate(229pt,44pt,kind:"NAND2")
  #inverter(298pt,45pt)
  #seg(340pt,60pt,368pt,60pt)
])
#let fig614b()=html.frame(block(width:390pt,height:148pt)[
  #for k in (0,1,2,3) [
    #gate(18pt,8pt + k * 32pt,kind:"NAND2",wide:62pt)
  ]
  #gate(129pt,21pt,kind:"NOR2")
  #gate(129pt,86pt,kind:"NOR2")
  #seg(80pt,23pt,129pt,35pt)
  #seg(80pt,55pt,129pt,35pt)
  #seg(80pt,88pt,129pt,100pt)
  #seg(80pt,120pt,129pt,100pt)
  #gate(231pt,51pt,kind:"NAND2")
  #seg(189pt,35pt,231pt,67pt)
  #seg(189pt,100pt,231pt,67pt)
  #inverter(303pt,52pt)
  #seg(344pt,67pt,375pt,67pt)
])

#let skew-inverter-panel(up:"1",down:"1")=html.frame(block(width:290pt,height:139pt)[
  // One CMOS inverter: shared A gate, joined drain/output, body-free schematic.
  #place(top+left,dx:158pt,dy:3pt,text(size:8pt)[$V_("DD")$]))
  #seg(171pt,17pt,171pt,32pt)
  #mos(171pt,32pt,p:true,label:up)
  #seg(171pt,61pt,171pt,74pt)
  #seg(171pt,74pt,171pt,86pt)
  #mos(171pt,86pt,label:down)
  #seg(171pt,115pt,171pt,128pt)
  #seg(158pt,128pt,184pt,128pt)
  #seg(161pt,133pt,181pt,133pt)
  #seg(167pt,137pt,175pt,137pt)
  #seg(108pt,47pt,151pt,47pt)
  #seg(108pt,101pt,151pt,101pt)
  #seg(108pt,47pt,108pt,101pt)
  #seg(73pt,74pt,108pt,74pt)
  #seg(171pt,74pt,243pt,74pt)
  #place(top+left,dx:55pt,dy:64pt,text(size:8pt)[$A$]))
  #place(top+left,dx:244pt,dy:64pt,text(size:8pt)[$V_("out")$]))
])

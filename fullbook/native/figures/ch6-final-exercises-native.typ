// Chapter 6 exercise figures P6.12 and P6.13: native editable logic.
#let segment(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.8pt))
#let label(x,y,s)=place(top+left,dx:x,dy:y,text(size:7pt)[#s])
#let dot(x,y)=place(top+left,dx:x,dy:y,circle(radius:1.7pt,fill:black))
#let capacitor(x,y,s:"")={
  segment(x+6pt,y-10pt,x+6pt,y)
  segment(x,y,x+12pt,y)
  segment(x,y+5pt,x+12pt,y+5pt)
  segment(x+6pt,y+5pt,x+6pt,y+17pt)
  if s!="" {label(x+14pt,y-2pt,s)}
}
#let gate(x,y,kind:"NOR",h:22pt)={
  place(top+left,dx:x,dy:y,rect(width:41pt,height:h,radius:10pt,stroke:.75pt))
  label(x+6pt,y+7pt,kind)
  segment(x-14pt,y+6pt,x,y+6pt)
  segment(x-14pt,y+16pt,x,y+16pt)
  segment(x+41pt,y+11pt,x+54pt,y+11pt)
}
#let inverter(x,y)={
  segment(x,y,x,y+23pt)
  segment(x,y,x+27pt,y+12pt)
  segment(x,y+23pt,x+27pt,y+12pt)
  place(top+left,dx:x+29pt,dy:y+10pt,circle(radius:2pt,stroke:.75pt,fill:white))
}
#let figure-p612()=html.frame(block(width:400pt,height:150pt)[
  #label(5pt,9pt,"输入")
  #segment(17pt,39pt,51pt,39pt)
  #dot(38pt,39pt)
  #capacitor(31pt,66pt,s:"Cinv")
  #segment(38pt,39pt,38pt,56pt)
  #inverter(54pt,28pt)
  #segment(85pt,39pt,115pt,39pt)
  #gate(115pt,28pt,kind:"NAND")
  #segment(169pt,39pt,192pt,39pt)
  #dot(192pt,39pt)
  #segment(192pt,39pt,192pt,124pt)
  #for i in range(4) [
    #let y=12pt+i*29pt
    #segment(192pt,y+12pt,223pt,y+12pt)
    #gate(223pt,y,kind:"NOR")
  ]
  #segment(277pt,23pt,319pt,23pt)
  #gate(319pt,12pt,kind:"NAND")
  #segment(373pt,23pt,390pt,23pt)
  #capacitor(373pt,57pt,s:"1000 Cinv")
  #segment(383pt,23pt,383pt,47pt)
])
#let figure-p613()=html.frame(block(width:400pt,height:190pt)[
  #label(5pt,45pt,"输入")
  #segment(18pt,63pt,52pt,63pt)
  #dot(38pt,63pt)
  #capacitor(30pt,88pt,s:"Cinv")
  #segment(38pt,63pt,38pt,78pt)
  #inverter(54pt,52pt)
  #segment(85pt,63pt,111pt,63pt)
  #gate(111pt,52pt,kind:"NAND")
  #segment(165pt,63pt,181pt,63pt)
  #dot(181pt,63pt)
  #for i in range(2) [
    #let yy=32pt+i*42pt
    #segment(181pt,yy+11pt,198pt,yy+11pt)
    #gate(198pt,yy,kind:"NOR")
  ]
  #segment(251pt,43pt,268pt,43pt)
  #segment(268pt,16pt,268pt,136pt)
  #dot(268pt,43pt)
  #capacitor(260pt,144pt,s:"500 Cinv")
  #for i in range(4) [
    #let yy=8pt+i*34pt
    #segment(268pt,yy+11pt,293pt,yy+11pt)
    #gate(293pt,yy,kind:"NOR")
  ]
  #segment(347pt,19pt,356pt,19pt)
  #gate(356pt,8pt,kind:"NAND",h:22pt)
  #capacitor(370pt,57pt,s:"8000 Cinv")
])

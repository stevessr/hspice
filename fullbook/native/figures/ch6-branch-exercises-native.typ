// SOURCE PDF245–252 native diagram building blocks: editable timing-path
// schematics with source-grounded labels. NOT full original topology/geometry QA.
#let seg(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.85pt))
#let cap(x,y,label:"")={
  place(top+left,dx:x,dy:y,line(length:14pt,stroke:.75pt))
  place(top+left,dx:x,dy:y + 5pt,line(length:14pt,stroke:.75pt))
  if label!="" {place(top+left,dx:x + 17pt,dy:y - 5pt,text(size:8pt)[#label])}
}
#let inv(x,y,label:"")={
  seg(x,y,x,y + 32pt)
  seg(x,y,x + 41pt,y + 16pt)
  seg(x,y + 32pt,x + 41pt,y + 16pt)
  place(top+left,dx:x + 43pt,dy:y + 14pt,circle(radius:2.1pt,stroke:.8pt,fill:white))
  if label!="" {place(top+left,dx:x + 12pt,dy:y - 12pt,text(size:8pt)[#label])}
}
#let gate(x,y,label:"NAND",width:51pt)={
  place(top+left,dx:x,dy:y,rect(width:width,height:33pt,radius:9pt,stroke:.8pt))
  place(top+left,dx:x + 7pt,dy:y + 11pt,text(size:7pt)[#label])
}
#let mos(x,y,p:false,label:"")={
  seg(x,y,x,y + 26pt)
  seg(x - 4pt,y,x - 4pt,y + 26pt)
  seg(x - 24pt,y + 13pt,x - 4pt,y + 13pt)
  if p {place(top+left,dx:x - 7pt,dy:y + 11pt,circle(radius:2.2pt,stroke:.7pt,fill:white))}
  if label!="" {place(top+left,dx:x + 6pt,dy:y + 11pt,text(size:7pt)[#label])}
}
#let fig630()=html.frame(block(width:385pt,height:133pt)[
  #seg(12pt,66pt,40pt,66pt)
  #inv(40pt,50pt,label:"5")
  #seg(87pt,66pt,139pt,66pt)
  #seg(139pt,34pt,139pt,97pt)
  #seg(139pt,34pt,186pt,34pt)
  #seg(139pt,97pt,186pt,97pt)
  #inv(186pt,18pt,label:"15")
  #inv(186pt,81pt,label:"15")
  #seg(233pt,34pt,289pt,34pt)
  #seg(233pt,97pt,289pt,97pt)
  #cap(281pt,46pt,label:"90")
  #cap(281pt,108pt,label:"90")
  #place(top+left,dx:100pt,dy:111pt,text(size:7.5pt)[分支强度 BE=2]))
])
#let fig-example616()=html.frame(block(width:370pt,height:112pt)[
  #seg(5pt,47pt,35pt,47pt)
  #inv(35pt,31pt,label:"w")
  #seg(82pt,47pt,131pt,47pt)
  #inv(131pt,31pt,label:"x")
  #seg(178pt,47pt,225pt,47pt)
  #inv(225pt,31pt,label:"y")
  #seg(272pt,47pt,305pt,47pt)
  #cap(13pt,67pt,label:"1")
  #cap(167pt,67pt,label:"A")
  #cap(304pt,67pt,label:"B")
  #place(top+left,dx:163pt,dy:93pt,text(size:7pt)[固定旁路负载]))
])
#let fig-p64()=grid(columns:(1fr,1fr),column-gutter:11pt,
  [#block(height:150pt)[
    #place(top+left,dx:20pt,dy:5pt,text(size:8pt)[(a) A 后到达]))
    #for i in (0,1,2) [
      #mos(68pt,20pt+i*37pt,p:false,label:"3W")
    ]
    #place(top+left,dx:105pt,dy:127pt,text(size:7pt)[VDD→0]))
  ]],
  [#block(height:150pt)[
    #place(top+left,dx:20pt,dy:5pt,text(size:8pt)[(b) B 后到达]))
    #for i in (0,1,2) [
      #mos(68pt,20pt+i*37pt,label:"3W")
    ]
    #place(top+left,dx:105pt,dy:127pt,text(size:7pt)[VDD→0]))
  ]])
#let fig-p65()=html.frame(block(width:360pt,height:138pt)[
  #mos(89pt,36pt,label:"4λ")
  #seg(89pt,62pt,89pt,81pt)
  #cap(112pt,17pt,label:"CL")
  #for i in (0,1,2) [
    #mos(231pt,15pt+i*37pt,label:"12λ")
  ]
  #place(top+left,dx:77pt,dy:121pt,text(size:8pt)[(a)]))
  #place(top+left,dx:223pt,dy:121pt,text(size:8pt)[(b)]))
])
#let fig-p66()=html.frame(block(width:390pt,height:108pt)[
  #seg(7pt,53pt,25pt,53pt)
  #cap(8pt,66pt,label:"C_in")
  #for i in (0,1,2,3) [
    #let x=27pt+i*84pt
    #inv(x,37pt,label:""+str(i+1))
    #seg(x + 46pt,53pt,x + 81pt,53pt)
  ]
  #cap(360pt,66pt,label:"1200 C_in")
])
#let fig-p68()=html.frame(block(width:355pt,height:139pt)[
  #seg(146pt,14pt,146pt,29pt)
  #mos(146pt,29pt,p:true,label:"W")
  #seg(146pt,55pt,146pt,69pt)
  #for i in (0,1,2) [
    #mos(101pt+i*55pt,77pt,label:"W")
  ]
  #seg(101pt,103pt,211pt,103pt)
  #seg(146pt,68pt,286pt,68pt)
  #place(top+left,dx:34pt,dy:75pt,text(size:8pt)[A、B、C]))
  #place(top+left,dx:287pt,dy:57pt,text(size:8pt)[$F$]))
])
#let fig-p69()=grid(columns:(1fr,1fr),column-gutter:10pt,
  [#block(height:180pt)[
    #for i in (0,1) [
      #mos(71pt,28pt+i*53pt,p:true,label:"8λ")
    ]
    #seg(71pt,134pt,71pt,142pt)
    #mos(69pt,144pt,label:"2λ")
    #place(top+left,dx:21pt,dy:10pt,text(size:8pt)[(a)]))
  ]],
  [#block(height:180pt)[
    #for i in (0,1,2) [
      #mos(72pt,18pt+i*43pt,p:i==0,label:"6λ")
    ]
    #place(top+left,dx:21pt,dy:10pt,text(size:8pt)[(b)]))
  ]])
#let fig-p611()=html.frame(block(width:375pt,height:108pt)[
  #seg(10pt,49pt,27pt,49pt)
  #inv(27pt,33pt,label:"A")
  #seg(74pt,49pt,108pt,49pt)
  #gate(108pt,32pt,label:"NAND2")
  #seg(159pt,49pt,196pt,49pt)
  #gate(196pt,32pt,label:"NOR2")
  #seg(247pt,49pt,276pt,49pt)
  #inv(276pt,33pt,label:"D")
  #seg(323pt,49pt,359pt,49pt)
  #cap(343pt,65pt,label:"1000 C_in")
  #cap(10pt,65pt,label:"C_in")
])

// Source PDF254–260: editable circuit geometry, not a raster scan.
// All schematic drawings are provisional until every original connection
// and figure-caption position is compared with the source image.
#let seg(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.75pt))
#let cap(x,y,name:"")={
  place(top+left,dx:x,dy:y,line(length:12pt,stroke:.75pt))
  place(top+left,dx:x,dy:y+5pt,line(length:12pt,stroke:.75pt))
  if name!="" {place(top+left,dx:x+14pt,dy:y-3pt,text(size:7pt)[#name])}
}
#let mos(x,y,p:false)={
  seg(x,y,x+36pt,y)
  seg(x+14pt,y-6pt,x+23pt,y-6pt)
  seg(x+18pt,y-25pt,x+18pt,y-7pt)
  if p {place(top+left,dx:x+16pt,dy:y-11pt,circle(radius:2.2pt,stroke:.8pt,fill:white))}
}
#let pass-case(a:"0 V",b:"0 V",gate:"VDD",p:false)=html.frame(block(width:181pt,height:117pt)[
  #seg(12pt,61pt,45pt,61pt)
  #mos(45pt,61pt,p:p)
  #seg(81pt,61pt,131pt,61pt)
  #cap(132pt,76pt,name:"C")
  #seg(138pt,81pt,138pt,96pt)
  #place(top+left,dx:8pt,dy:43pt,text(size:7pt)[#a])
  #place(top+left,dx:125pt,dy:43pt,text(size:7pt)[#b])
  #place(top+left,dx:59pt,dy:3pt,text(size:7pt)[#gate])
  #place(top+left,dx:13pt,dy:101pt,text(size:7pt)[#if p [PMOS] else [NMOS]])
])
#let fig71()=grid(columns:(1fr,1fr),column-gutter:7pt,row-gutter:3pt,
  [#pass-case(a:"0 V",b:"0 V")],
  [#pass-case(a:"VDD",b:"VDD",gate:"0 V",p:true)],
  [#pass-case(a:"VDD",b:"VDD−VTn")],
  [#pass-case(a:"0 V",b:"|VTp|",gate:"0 V",p:true)],
  [#pass-case(a:"VDD",b:"高阻态",gate:"0 V")],
  [#pass-case(a:"0 V",b:"高阻态",gate:"VDD",p:true)])
#let stack-case(n:1,low:false,p:false)=html.frame(block(width:119pt,height:139pt)[
  #seg(23pt,31pt,44pt,31pt)
  #for i in range(n) [
    #mos(44pt+i*13pt,31pt+i*22pt,p:p)
  ]
  #seg(44pt+(n-1)*13pt+36pt,31pt+(n-1)*22pt,110pt,31pt+(n-1)*22pt)
  #cap(88pt,85pt,name:"C")
  #place(top+left,dx:7pt,dy:10pt,text(size:7pt)[#if p [PMOS] else [NMOS]])
  #place(top+left,dx:6pt,dy:112pt,text(size:7pt)[#if low [级联降栅压] else [同栅压]])
])
#let fig72()=grid(columns:(1fr,1fr,1fr),column-gutter:5pt,
  [#stack-case(n:1)],[#stack-case(n:3)],[#stack-case(n:3,low:true)])
#let fig73()=grid(columns:(1fr,1fr,1fr),column-gutter:5pt,
  [#stack-case(n:1,p:true)],[#stack-case(n:3,p:true)],
  [#stack-case(n:3,p:true,low:true)])
#let fig74()=html.frame(block(width:330pt,height:146pt)[
  #seg(8pt,77pt,76pt,77pt)
  #mos(76pt,77pt)
  #seg(112pt,77pt,225pt,77pt)
  #cap(149pt,90pt,name:"C_f")
  #cap(223pt,90pt,name:"C_gnd")
  #seg(229pt,95pt,229pt,117pt)
  #place(top+left,dx:7pt,dy:59pt,text(size:8pt)[$V_("in")$]))
  #place(top+left,dx:227pt,dy:60pt,text(size:8pt)[$V_("out")$]))
  #place(top+left,dx:94pt,dy:19pt,text(size:7pt)[$"Clock": V_("DD") arrow 0$]))
  #place(top+left,dx:94pt,dy:35pt,text(size:7pt)[栅−源重叠电容导致输出电位下冲]))
])
#let fig75-panel(positive:true)=html.frame(block(width:186pt,height:137pt)[
  #seg(34pt,24pt,34pt,46pt)
  #cap(28pt,46pt,name:"Cf")
  #seg(34pt,52pt,34pt,75pt)
  #cap(28pt,75pt,name:"Cgnd")
  #seg(34pt,81pt,34pt,112pt)
  #place(top+left,dx:3pt,dy:7pt,text(size:7pt)[$V_1$]))
  #place(top+left,dx:40pt,dy:63pt,text(size:7pt)[$V_2$]))
  #place(top+left,dx:84pt,dy:28pt,text(size:8pt)[#if positive [正馈通] else [负馈通]])
  #place(top+left,dx:84pt,dy:65pt,text(size:7pt)[$Delta V_2$]))
])
#let fig75()=grid(columns:(1fr,1fr),column-gutter:7pt,
  [#fig75-panel()],[#fig75-panel(positive:false)])
#let fig76()=grid(columns:(1fr,1fr),column-gutter:8pt,
  [#block(width:170pt)[
    #seg(13pt,44pt,51pt,44pt)
    #mos(51pt,44pt)
    #seg(87pt,44pt,135pt,44pt)
    #cap(19pt,64pt,name:"C1")
    #cap(118pt,64pt,name:"C2")
    #place(top+left,dx:10pt,dy:5pt,text(size:7pt)[$V_1$]))
    #place(top+left,dx:113pt,dy:5pt,text(size:7pt)[$V_2$]))
    #place(top+left,dx:33pt,dy:101pt,text(size:7pt)[（a）之前]))
  ]],
  [#block(width:170pt)[
    #seg(13pt,44pt,51pt,44pt)
    #mos(51pt,44pt)
    #seg(87pt,44pt,135pt,44pt)
    #cap(19pt,64pt,name:"C1")
    #cap(118pt,64pt,name:"C2")
    #place(top+left,dx:10pt,dy:5pt,text(size:7pt)[$V^*$]))
    #place(top+left,dx:113pt,dy:5pt,text(size:7pt)[$V^*$]))
    #place(top+left,dx:33pt,dy:101pt,text(size:7pt)[（b）之后]))
  ]])

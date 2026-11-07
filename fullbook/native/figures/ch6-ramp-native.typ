// Editable source-guided CMOS timing figures for PDF221–228.
// Diagrams preserve topology and event labels; pixel-precise curve and lettering
// remain unverified against the printed source.
#let seg(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.8pt))
#let cap(x,y,label:"")={
  place(top+left,dx:x,dy:y,line(length:16pt,stroke:.7pt))
  place(top+left,dx:x,dy:y+5pt,line(length:16pt,stroke:.7pt))
  if label!="" {place(top+left,dx:x+18pt,dy:y-3pt,text(size:7.5pt)[#label])}
}
#let mos(x,y,label:"")={
  place(top+left,dx:x,dy:y,line(end:(0pt,28pt),stroke:.9pt))
  place(top+left,dx:x-5pt,dy:y,line(end:(0pt,28pt),stroke:.9pt))
  place(top+left,dx:x-26pt,dy:y+14pt,line(length:21pt,stroke:.9pt))
  if label!="" {place(top+left,dx:x+6pt,dy:y+8pt,text(size:7.5pt)[#label])}
}
#let fig612()=html.frame(block(width:300pt,height:170pt)[
  #seg(122pt,13pt,122pt,29pt)
  #mos(122pt,29pt,label:"MA")
  #seg(122pt,57pt,122pt,70pt)
  #mos(122pt,70pt,label:"MB")
  #seg(122pt,98pt,122pt,111pt)
  #mos(122pt,111pt,label:"MC")
  #seg(122pt,139pt,122pt,158pt)
  #seg(122pt,13pt,210pt,13pt)
  #seg(122pt,68pt,210pt,68pt)
  #seg(122pt,110pt,210pt,110pt)
  #cap(205pt,25pt,label:"CL")
  #cap(205pt,78pt,label:"CX")
  #cap(205pt,118pt,label:"CY")
  #place(top+left,dx:103pt,dy:60pt,text(size:7pt)[$X$]))
  #place(top+left,dx:103pt,dy:102pt,text(size:7pt)[$Y$]))
  #place(top+left,dx:82pt,dy:40pt,text(size:7.5pt)[$A$]))
  #place(top+left,dx:82pt,dy:82pt,text(size:7.5pt)[$B$]))
  #place(top+left,dx:82pt,dy:121pt,text(size:7.5pt)[$C$]))
])
#let fig613()=html.frame(block(width:320pt,height:133pt)[
  #seg(128pt,12pt,128pt,33pt)
  #mos(128pt,33pt,label:"PMOS")
  #seg(128pt,61pt,128pt,71pt)
  #mos(128pt,71pt,label:"NMOS")
  #seg(128pt,99pt,128pt,116pt)
  #seg(128pt,68pt,215pt,68pt)
  #cap(208pt,84pt,label:"CL")
  #place(top+left,dx:23pt,dy:62pt,text(size:7.5pt)[$V_("in")$]))
  #place(top+left,dx:220pt,dy:59pt,text(size:7.5pt)[$V_("out")$]))
  #place(top+left,dx:145pt,dy:18pt,text(size:7.5pt)[$i_("PMOS")$]))
  #place(top+left,dx:145pt,dy:91pt,text(size:7.5pt)[$i_("NMOS")$]))
  #place(top+left,dx:233pt,dy:94pt,text(size:7pt)[$i_("out")$]))
])
#let fig614()=html.frame(block(width:290pt,height:200pt)[
  #seg(47pt,165pt,256pt,165pt)
  #seg(47pt,165pt,47pt,17pt)
  #place(top+left,dx:259pt,dy:163pt,text(size:7pt)[$V_("in")$]))
  #place(top+left,dx:24pt,dy:7pt,text(size:7pt)[$V_("out")$]))
  #for off in (0pt,14pt,28pt,42pt,56pt,70pt,84pt) [
    #seg(52pt,30pt+off,98pt+off/2,30pt+off)
    #seg(98pt+off/2,30pt+off,105pt+off/2,122pt+off/2)
    #seg(105pt+off/2,122pt+off/2,249pt,129pt+off/2)
  ]
  #place(top+left,dx:134pt,dy:32pt,text(size:8pt)[$i_("out")=0$ VTC]))
  #place(top+left,dx:73pt,dy:179pt,text(size:7.5pt)[充电电流]))
  #place(top+left,dx:188pt,dy:179pt,text(size:7.5pt)[放电电流]))
])
#let fig615()=grid(columns:(1fr,1fr),column-gutter:7pt,
  [#block(width:190pt)[
    #fig614()
    #align(center)[*（a）阶跃输入轨迹*]
  ]],
  [#block(width:190pt)[
    #fig614()
    #align(center)[*（b）斜坡输入轨迹*]
  ]])
#let fig616()=html.frame(block(width:390pt,height:162pt)[
  #place(top+left,dx:11pt,dy:4pt,text(size:8pt)[斜坡输入下的四级反相器链及累计延迟]))
  #seg(8pt,62pt,35pt,62pt)
  #for idx in (0,1,2,3) [
    #let x=40pt+idx*82pt
    #place(top+left,dx:x,dy:42pt,rect(width:57pt,height:40pt,stroke:.7pt))
    #place(top+left,dx:x+21pt,dy:53pt,text(size:9pt)[#(idx+1)]))
    #seg(x+57pt,62pt,x+82pt,62pt)
  ]
  #place(top+left,dx:19pt,dy:105pt,text(size:8pt)[$t_("total") = t_("in")/2 + t_("pHL1") + t_("in1")/2 + dots$]))
  #place(top+left,dx:19pt,dy:131pt,text(size:8pt)[$"Total_delay" approx sum_i R_i C_i$]))
])
#let fig-inverter-4()=html.frame(block(width:390pt,height:120pt)[
  #seg(12pt,56pt,45pt,56pt)
  #for idx in (0,1,2,3) [
    #let x=49pt+idx*86pt
    #place(top+left,dx:x,dy:29pt,rect(width:61pt,height:59pt,stroke:.7pt))
    #place(top+left,dx:x+4pt,dy:41pt,text(size:8pt)[$W_P$]))
    #place(top+left,dx:x+4pt,dy:64pt,text(size:8pt)[4λ]))
    #seg(x+61pt,56pt,x+86pt,56pt)
  ]
  #place(top+left,dx:33pt,dy:105pt,text(size:7pt)[所有NMOS为4λ，比较PMOS 8λ、10λ与约6.2λ的延迟]))
])

// Source PDF261–268, printed 242–249.
// Reconstructed editable CMOS transmission-gate/switch-level circuit diagrams.
// Electrical connections and transistor body/well contacts are pending strict
// source-by-source schematic verification; never auto-certify them as 1:1.
#let wire(x1,y1,x2,y2)=place(top+left,dx:x1,dy:y1,line(end:(x2 - x1,y2 - y1),stroke:.8pt))
#let dot(x,y)=place(top+left,dx:x,dy:y,circle(radius:1.5pt,fill:black))
#let mos(x,y,p:false)={
  wire(x,y,x,y + 23pt)
  wire(x - 4pt,y,x - 4pt,y + 23pt)
  wire(x - 25pt,y + 11pt,x - 4pt,y + 11pt)
  if p {place(top+left,dx:x - 7pt,dy:y + 9pt,circle(radius:2pt,stroke:.6pt,fill:white))}
}
#let pass-symbol(x,y,size:28pt)={
  place(top+left,dx:x,dy:y,rect(width:size,height:size,stroke:.75pt))
  wire(x,y,x + size,y + size)
  wire(x,y + size,x + size,y)
  wire(x - 14pt,y + size / 2,x,y + size / 2)
  wire(x + size,y + size / 2,x + size + 14pt,y + size / 2)
}
#let cap(x,y,mark:"")={
  wire(x,y,x,y + 7pt)
  place(top+left,dx:x - 6pt,dy:y + 7pt,line(length:12pt,stroke:.75pt))
  place(top+left,dx:x - 6pt,dy:y + 12pt,line(length:12pt,stroke:.75pt))
  wire(x,y + 12pt,x,y + 28pt)
  if mark!="" {place(top+left,dx:x + 8pt,dy:y + 11pt,text(size:7pt)[#mark])}
}
#let fig77()=html.frame(block(width:355pt,height:95pt)[
  #pass-symbol(86pt,29pt)
  #wire(29pt,43pt,72pt,43pt)
  #wire(128pt,43pt,163pt,43pt)
  #place(top+left,dx:39pt,dy:22pt,text(size:8pt)[$A$]))
  #place(top+left,dx:162pt,dy:22pt,text(size:8pt)[$B$]))
  #place(top+left,dx:99pt,dy:7pt,text(size:7pt)[$C$]))
  #place(top+left,dx:95pt,dy:66pt,text(size:7pt)[$overline(C)$]))
  #pass-symbol(263pt,29pt)
  #place(top+left,dx:220pt,dy:13pt,text(size:8pt)[等效开关]))
])
#let fig78()=grid(columns:(1fr,1fr),column-gutter:7pt,
  [#block(width:190pt,height:150pt)[
    #pass-symbol(69pt,52pt)
    #place(top+left,dx:12pt,dy:29pt,text(size:7pt)[（a）0 V / VDD传输]))
    #wire(30pt,66pt,56pt,66pt)
    #wire(111pt,66pt,156pt,66pt)
    #place(top+left,dx:14pt,dy:93pt,text(size:7pt)[NMOS强0，PMOS强1]))
  ]],
  [#block(width:190pt,height:150pt)[
    #pass-symbol(69pt,52pt)
    #place(top+left,dx:12pt,dy:29pt,text(size:7pt)[（b）反向电平转换]))
    #wire(30pt,66pt,56pt,66pt)
    #wire(111pt,66pt,156pt,66pt)
    #place(top+left,dx:14pt,dy:93pt,text(size:7pt)[输出可恢复完整摆幅]))
  ]])
#let fig79()=html.frame(block(width:340pt,height:122pt)[
  #pass-symbol(105pt,20pt)
  #pass-symbol(105pt,77pt)
  #wire(14pt,34pt,91pt,34pt)
  #wire(14pt,91pt,91pt,91pt)
  #wire(147pt,34pt,189pt,34pt)
  #wire(147pt,91pt,189pt,91pt)
  #wire(189pt,34pt,189pt,91pt)
  #wire(189pt,64pt,280pt,64pt)
  #place(top+left,dx:13pt,dy:17pt,text(size:8pt)[$A$]))
  #place(top+left,dx:13pt,dy:75pt,text(size:8pt)[$B$]))
  #place(top+left,dx:277pt,dy:46pt,text(size:8pt)[$F=A S + B overline(S)$]))
  #place(top+left,dx:112pt,dy:6pt,text(size:7pt)[$S$]))
])
#let fig710()=grid(columns:(1fr,1fr),column-gutter:5pt,
  [#block(height:138pt)[
    #pass-symbol(48pt,20pt)
    #pass-symbol(48pt,87pt)
    #wire(90pt,34pt,149pt,34pt)
    #wire(90pt,101pt,149pt,101pt)
    #place(top+left,dx:22pt,dy:123pt,text(size:7pt)[（a）XOR异或门]))
  ]],
  [#block(height:138pt)[
    #pass-symbol(48pt,20pt)
    #pass-symbol(48pt,87pt)
    #wire(90pt,34pt,149pt,34pt)
    #wire(90pt,101pt,149pt,101pt)
    #place(top+left,dx:22pt,dy:123pt,text(size:7pt)[（b）XNOR同或门]))
  ]])
#let fig711()=grid(columns:(1fr,1fr),column-gutter:4pt,
  [#block(height:175pt)[
    #for i in (0,1,2,3) [
      #let yy=9pt+i * 38pt
      #pass-symbol(57pt,yy,size:23pt)
      #wire(80pt,yy + 11pt,127pt,yy + 11pt)
    ]
    #place(top+left,dx:10pt,dy:164pt,text(size:7pt)[（a）两级 4:1 多路器]))
  ]],
  [#block(height:175pt)[
    #for i in (0,1,2,3) [
      #let yy=9pt+i * 38pt
      #pass-symbol(57pt,yy,size:23pt)
      #wire(80pt,yy + 11pt,127pt,yy + 11pt)
    ]
    #place(top+left,dx:10pt,dy:164pt,text(size:7pt)[（b）单级 4:1 多路器]))
  ]])
#let fig712()=grid(columns:(1fr,1fr,1fr),column-gutter:5pt,
  [#block(height:160pt)[
    #pass-symbol(40pt,26pt)
    #pass-symbol(40pt,79pt)
    #place(top+left,dx:12pt,dy:132pt,text(size:7pt)[（a）输出冲突]))
  ]],
  [#block(height:160pt)[
    #pass-symbol(40pt,26pt)
    #pass-symbol(40pt,79pt)
    #place(top+left,dx:12pt,dy:132pt,text(size:7pt)[（b）高阻态]))
  ]],
  [#block(height:160pt)[
    #pass-symbol(40pt,26pt)
    #pass-symbol(40pt,79pt)
    #place(top+left,dx:12pt,dy:132pt,text(size:7pt)[（c）电荷共享]))
  ]])
#let fig713()=grid(columns:(1fr,1fr),column-gutter:6pt,
  [#block(height:118pt)[
    #pass-symbol(45pt,17pt)
    #pass-symbol(45pt,69pt)
    #wire(87pt,31pt,149pt,31pt)
    #wire(87pt,83pt,149pt,83pt)
    #place(top+left,dx:13pt,dy:103pt,text(size:7pt)[（a）OR / A+B]))
  ]],
  [#block(height:118pt)[
    #pass-symbol(45pt,17pt)
    #pass-symbol(107pt,17pt)
    #wire(87pt,31pt,93pt,31pt)
    #place(top+left,dx:13pt,dy:103pt,text(size:7pt)[（b）AND / AB]))
  ]])
#let fig-example73(reduced:false)=html.frame(block(width:374pt,height:174pt)[
  // Example 7.3: A/B control a set of C, Cbar, and VDD data paths.
  #place(top+left,dx:6pt,dy:8pt,text(size:7pt)[#if reduced [优化结构] else [真值表直接实现]]))
  #if reduced [
    #pass-symbol(84pt,35pt,size:26pt)
    #pass-symbol(84pt,94pt,size:26pt)
    #place(top+left,dx:30pt,dy:47pt,text(size:7pt)[$C$]))
    #place(top+left,dx:22pt,dy:105pt,text(size:7pt)[$overline(C)$]))
    #wire(110pt,48pt,172pt,48pt)
    #wire(110pt,107pt,172pt,107pt)
  ] else [
    #for i in (0,1,2,3) [
      #let yy=22pt+i*34pt
      #pass-symbol(84pt,yy,size:25pt)
      #wire(51pt,yy+12pt,70pt,yy+12pt)
      #wire(109pt,yy+12pt,167pt,yy+12pt)
    ]
    #place(top+left,dx:18pt,dy:30pt,text(size:7pt)[$V_("DD")$]))
    #place(top+left,dx:18pt,dy:64pt,text(size:7pt)[$C$]))
    #place(top+left,dx:18pt,dy:98pt,text(size:7pt)[$overline(C)$]))
    #place(top+left,dx:18pt,dy:132pt,text(size:7pt)[$overline(C)$]))
  ]
  #pass-symbol(225pt,50pt,size:29pt)
  #pass-symbol(225pt,105pt,size:29pt)
  #wire(167pt,77pt,211pt,64pt)
  #wire(167pt,116pt,211pt,119pt)
  #wire(254pt,64pt,289pt,64pt)
  #wire(254pt,119pt,289pt,119pt)
  #wire(289pt,64pt,289pt,119pt)
  #wire(289pt,91pt,328pt,91pt)
  #place(top+left,dx:337pt,dy:81pt,text(size:8pt)[$F$]))
  #place(top+left,dx:231pt,dy:25pt,text(size:7pt)[$A$]))
  #place(top+left,dx:229pt,dy:143pt,text(size:7pt)[$overline(A)$]))
])
#let fig714()=grid(columns:(1fr,1fr),column-gutter:8pt,
  [#block(height:157pt)[
    #pass-symbol(54pt,38pt)
    #wire(16pt,52pt,40pt,52pt)
    #wire(82pt,52pt,135pt,52pt)
    #place(top+left,dx:11pt,dy:18pt,text(size:7pt)[$A$]))
    #place(top+left,dx:59pt,dy:17pt,text(size:7pt)[$B$]))
    #place(top+left,dx:111pt,dy:42pt,text(size:7pt)[$F$]))
    #place(top+left,dx:13pt,dy:130pt,text(size:7pt)[（a）传输门与CMOS反相器组合]))
  ]],
  [#block(height:157pt)[
    #pass-symbol(18pt,30pt)
    #pass-symbol(18pt,92pt)
    #wire(46pt,44pt,100pt,44pt)
    #wire(46pt,106pt,100pt,106pt)
    #wire(100pt,44pt,100pt,106pt)
    #place(top+left,dx:118pt,dy:58pt,rect(width:57pt,height:29pt,radius:8pt,stroke:.8pt))
    #place(top+left,dx:128pt,dy:67pt,text(size:7pt)[NAND]))
    #place(top+left,dx:9pt,dy:130pt,text(size:7pt)[（b）传输门与标准CMOS门组合]))
  ]])

#let fig715()=html.frame(block(width:373pt,height:128pt)[
  #pass-symbol(22pt,20pt)
  #wire(64pt,34pt,123pt,34pt)
  #cap(124pt,40pt,mark:"C_1")
  #place(top+left,dx:152pt,dy:24pt,text(size:8pt)[$R_("TG")$]))
  #wire(191pt,34pt,251pt,34pt)
  #cap(252pt,40pt,mark:"C_2")
  #place(top+left,dx:16pt,dy:103pt,text(size:8pt)[等效: $R_N slash R_P$ 与输出寄生电容]))
])
#let fig716()=html.frame(block(width:379pt,height:146pt)[
  #for k in (0,1) [
    #let dx=5pt+k * 192pt
    #wire(dx + 30pt,125pt,dx + 174pt,125pt)
    #wire(dx + 30pt,125pt,dx + 30pt,14pt)
    #wire(dx + 38pt,110pt,dx + 84pt,65pt)
    #wire(dx + 84pt,65pt,dx + 154pt,77pt)
    #wire(dx + 38pt,39pt,dx + 84pt,64pt)
    #wire(dx + 84pt,64pt,dx + 154pt,100pt)
    #place(top+left,dx:dx + 45pt,dy:130pt,text(size:7pt)[#if k==0 [$V_("out")$: 0→VDD] else [$V_("out")$: VDD→0]]))
  ]
])
#let fig717()=grid(columns:(1fr,1fr),column-gutter:5pt,
  [#block(height:116pt)[
    #pass-symbol(75pt,27pt)
    #cap(33pt,56pt,mark:"C_g W")
    #cap(142pt,56pt,mark:"C_g W")
    #place(top+left,dx:10pt,dy:101pt,text(size:7pt)[（a）关断状态]))
  ]],
  [#block(height:116pt)[
    #pass-symbol(75pt,27pt)
    #cap(33pt,56pt,mark:"C_g W")
    #cap(142pt,56pt,mark:"C_g W")
    #place(top+left,dx:10pt,dy:101pt,text(size:7pt)[（b）导通状态]))
  ]])

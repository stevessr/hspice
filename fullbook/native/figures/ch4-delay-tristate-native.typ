// Native editable figures for chapter 4 ending, PDF157–166.
#let inverter-delay() = html.frame(block(width:349pt,height:157pt)[
 #place(top + left,dx:10pt,dy:4pt,text(size:8pt)[图4.15(a) 反相器时序：50%传播延迟])
 #place(top + left,dx:27pt,dy:25pt,line(length:307pt,stroke:.7pt))
 #place(top + left,dx:27pt,dy:25pt,line(end:(0pt,100pt),stroke:.7pt))
 #place(top + left,dx:35pt,dy:44pt,line(length:68pt,stroke:1.0pt))
 #place(top + left,dx:103pt,dy:44pt,line(end:(0pt,70pt),stroke:1pt))
 #place(top + left,dx:103pt,dy:114pt,line(length:113pt,stroke:1pt))
 #place(top + left,dx:216pt,dy:114pt,line(end:(0pt,-70pt),stroke:1pt))
 #place(top + left,dx:216pt,dy:44pt,line(length:90pt,stroke:1pt))
 #place(top + left,dx:35pt,dy:114pt,line(length:77pt,stroke:.9pt))
 #place(top + left,dx:112pt,dy:114pt,curve(stroke:1.2pt,curve.move((0pt,0pt)),
  curve.cubic((14pt,-1pt),(21pt,-67pt),(66pt,-67pt))))
 #place(top + left,dx:220pt,dy:47pt,curve(stroke:1.2pt,curve.move((0pt,0pt)),
  curve.cubic((25pt,0pt),(25pt,67pt),(80pt,67pt))))
 #place(top + left,dx:11pt,dy:37pt,text(size:7pt)[$V_("in")$]))
 #place(top + left,dx:11pt,dy:109pt,text(size:7pt)[$V_("out")$]))
 #place(top + left,dx:120pt,dy:136pt,text(size:7pt)[$t_("PHL")$]))
 #place(top + left,dx:230pt,dy:136pt,text(size:7pt)[$t_("PLH")$]))
])
#let tri-state() = html.frame(block(width:348pt,height:191pt)[
 #place(top + left,dx:10pt,dy:5pt,text(size:8pt)[图4.16 三态缓冲器（两串联开关+CMOS反相）])
 #place(top + left,dx:83pt,dy:25pt,line(end:(0pt,21pt),stroke:.85pt))
 #place(top + left,dx:66pt,dy:18pt,text(size:7pt)[$V_("DD")$]))
 #for y in (48pt,77pt,108pt,137pt) [
  #place(top + left,dx:83pt,dy:y,line(end:(0pt,25pt),stroke:.85pt))
  #place(top + left,dx:74pt,dy:y+2pt,line(end:(0pt,20pt),stroke:1.2pt))
 ]
 #place(top + left,dx:83pt,dy:162pt,line(end:(0pt,18pt),stroke:.85pt))
 #place(top + left,dx:72pt,dy:182pt,line(length:23pt,stroke:.85pt))
 #place(top + left,dx:83pt,dy:98pt,line(length:65pt,stroke:.85pt))
 #place(top + left,dx:154pt,dy:91pt,text(size:8pt)[OUT]))
 #place(top + left,dx:11pt,dy:66pt,text(size:8pt)[$overline("EN")$]))
 #place(top + left,dx:11pt,dy:93pt,text(size:8pt)[IN]))
 #place(top + left,dx:11pt,dy:128pt,text(size:8pt)[EN]))
 #place(top + left,dx:184pt,dy:26pt,text(size:7.5pt)[使能真值表]))
 #place(top + left,dx:185pt,dy:45pt,
  table(columns:(27pt,30pt,40pt),inset:2pt,
  [*IN*],[*EN*],[*OUT*],
  [0],[0],[Z],[1],[0],[Z],
  [0],[1],[1],[1],[1],[0]))
 #place(top + left,dx:191pt,dy:163pt,text(size:7pt)[EN=0：高阻态Z]))
])
#let inverter-chain() = html.frame(block(width:350pt,height:98pt)[
 #place(top + left,dx:7pt,dy:5pt,text(size:8pt)[图P4.6(a) 多级反相器链])
 #for i in range(8) [
  #place(top + left,dx:12pt+i*42pt,dy:26pt,polygon((0pt,0pt),(28pt,15pt),(0pt,30pt),stroke:.8pt))
  #place(top + left,dx:39pt+i*42pt,dy:41pt,circle(radius:2pt,stroke:.6pt,fill:white))
 ]
 #place(top + left,dx:11pt,dy:70pt,text(size:8pt)[IN]))
 #place(top + left,dx:312pt,dy:70pt,text(size:8pt)[OUT]))
])
#let exercise-vtc() = html.frame(block(width:350pt,height:168pt)[
 #place(top + left,dx:33pt,dy:138pt,line(length:294pt,stroke:.85pt))
 #place(top + left,dx:33pt,dy:138pt,line(end:(0pt,-117pt),stroke:.85pt))
 #place(top + left,dx:35pt,dy:42pt,line(length:40pt,stroke:1.2pt))
 #place(top + left,dx:75pt,dy:42pt,line(end:(255pt,90pt),stroke:1.2pt))
 #place(top + left,dx:285pt,dy:133pt,line(length:35pt,stroke:1.2pt))
 #place(top + left,dx:11pt,dy:17pt,text(size:7pt)[$V_("out")$]))
 #place(top + left,dx:306pt,dy:145pt,text(size:7pt)[$V_("in")$]))
 #place(top + left,dx:55pt,dy:153pt,text(size:7pt)[0.3V]))
 #place(top + left,dx:284pt,dy:153pt,text(size:7pt)[2V]))
 #place(top + left,dx:16pt,dy:49pt,text(size:7pt)[1V]))
 #place(top + left,dx:12pt,dy:131pt,text(size:7pt)[0V]))
])
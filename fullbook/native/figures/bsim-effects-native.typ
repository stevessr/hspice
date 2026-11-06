// Editable conceptual curves for figures 3.13–3.17.
// Physical trends match textbook descriptions; NOT digitized HSPICE data.
#let short-channel-threshold() = html.frame(block(width:355pt,height:165pt)[
  #place(top + left,dx:12pt,dy:7pt,text(size:8pt)[图3.13　短沟道效应（SCE）与反短沟道效应（RSCE）])
  #place(top + left,dx:29pt,dy:132pt,line(length:134pt,stroke:.8pt))
  #place(top + left,dx:29pt,dy:132pt,line(end:(0pt,-110pt),stroke:.8pt))
  #place(top + left,dx:33pt,dy:117pt,curve(stroke:1.2pt,curve.move((0pt,0pt)),
    curve.cubic((38pt,-80pt),(75pt,-65pt),(123pt,-61pt))))
  #place(top + left,dx:189pt,dy:132pt,line(length:144pt,stroke:.8pt))
  #place(top + left,dx:189pt,dy:132pt,line(end:(0pt,-110pt),stroke:.8pt))
  #place(top + left,dx:193pt,dy:61pt,curve(stroke:1.2pt,curve.move((0pt,0pt)),
    curve.cubic((31pt,-13pt),(75pt,19pt),(128pt,20pt))))
  #place(top + left,dx:12pt,dy:16pt,text(size:7pt)[$V_T$]))
  #place(top + left,dx:164pt,dy:134pt,text(size:7pt)[$L_("eff")$]))
  #place(top + left,dx:333pt,dy:134pt,text(size:7pt)[$L_("eff")$]))
  #place(top + left,dx:54pt,dy:145pt,text(size:7pt)[(a) SCE]))
  #place(top + left,dx:236pt,dy:145pt,text(size:7pt)[(b) RSCE]))
])
#let dibl-threshold() = html.frame(block(width:353pt,height:154pt)[
  #place(top + left,dx:41pt,dy:129pt,line(length:273pt,stroke:.8pt))
  #place(top + left,dx:41pt,dy:129pt,line(end:(0pt,-110pt),stroke:.8pt))
  #place(top + left,dx:43pt,dy:36pt,line(length:251pt,stroke:(dash:"dashed",thickness:1pt)))
  #place(top + left,dx:43pt,dy:37pt,curve(stroke:1.2pt,curve.move((0pt,0pt)),
    curve.cubic((58pt,1pt),(169pt,30pt),(251pt,42pt))))
  #place(top + left,dx:4pt,dy:18pt,text(size:8pt)[$V_T$]))
  #place(top + left,dx:303pt,dy:132pt,text(size:8pt)[$V_("DS")$]))
  #place(top + left,dx:165pt,dy:19pt,text(size:7pt)[长沟道阈值]))
  #place(top + left,dx:165pt,dy:82pt,text(size:7pt)[短沟道DIBL]))
  #place(top + left,dx:51pt,dy:145pt,text(size:7pt)[图3.14 漏感应势垒降低：阈值随漏源电压降低])
])
#let iv-simulation() = html.frame(block(width:354pt,height:190pt)[
  #place(top + left,dx:13pt,dy:4pt,text(size:8pt)[SPICE I–V 多栅压扫描（示意，非原始测点）])
  #place(top + left,dx:39pt,dy:161pt,line(length:290pt,stroke:.9pt))
  #place(top + left,dx:39pt,dy:161pt,line(end:(0pt,-130pt),stroke:.9pt))
  #place(top + left,dx:42pt,dy:159pt,curve(stroke:1.2pt,curve.move((0pt,0pt)),
    curve.cubic((48pt,-90pt),(120pt,-100pt),(280pt,-108pt))))
  #place(top + left,dx:42pt,dy:159pt,curve(stroke:1.2pt,curve.move((0pt,0pt)),
    curve.cubic((50pt,-66pt),(127pt,-73pt),(280pt,-76pt))))
  #place(top + left,dx:42pt,dy:159pt,curve(stroke:1.2pt,curve.move((0pt,0pt)),
    curve.cubic((48pt,-25pt),(120pt,-30pt),(280pt,-31pt))))
  #place(top + left,dx:285pt,dy:43pt,text(size:7pt)[$V_("GS3")$]))
  #place(top + left,dx:285pt,dy:81pt,text(size:7pt)[$V_("GS2")$]))
  #place(top + left,dx:285pt,dy:128pt,text(size:7pt)[$V_("GS1")$]))
  #place(top + left,dx:3pt,dy:31pt,text(size:7pt)[$I_("DS")$]))
  #place(top + left,dx:302pt,dy:167pt,text(size:7pt)[$V_("DS")$]))
])
#let temperature-current() = html.frame(block(width:354pt,height:195pt)[
  #place(top + left,dx:9pt,dy:4pt,text(size:8pt)[温度对漏电流的影响：截止区与导通区趋势对照])
  #place(top + left,dx:40pt,dy:153pt,line(length:292pt,stroke:.8pt))
  #place(top + left,dx:40pt,dy:153pt,line(end:(0pt,-124pt),stroke:.8pt))
  #place(top + left,dx:42pt,dy:151pt,curve(stroke:1.1pt,curve.move((0pt,0pt)),
    curve.cubic((94pt,3pt),(212pt,-5pt),(283pt,-107pt))))
  #place(top + left,dx:42pt,dy:151pt,curve(stroke:(dash:"dashed",thickness:1.1pt),curve.move((0pt,0pt)),
    curve.cubic((93pt,4pt),(205pt,-5pt),(282pt,-67pt))))
  #place(top + left,dx:81pt,dy:164pt,text(size:7pt)[低温]))
  #place(top + left,dx:181pt,dy:164pt,text(size:7pt)[常温]))
  #place(top + left,dx:271pt,dy:164pt,text(size:7pt)[高温]))
  #place(top + left,dx:5pt,dy:25pt,text(size:7pt)[$I_("DS")$]))
  #place(top + left,dx:307pt,dy:160pt,text(size:7pt)[$T$]))
  #place(top + left,dx:48pt,dy:184pt,text(size:7pt)[不代表图3.7的量测曲线；仅用于公式和实验任务位置指示])
])
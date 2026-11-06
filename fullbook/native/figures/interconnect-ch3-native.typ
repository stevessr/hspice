// Editable native interconnect and parasitic concepts from source PDF 93–96.
// Original figure numbers 3.3–3.5; geometries are source-grounded but not traced.

#let metal-steps() = html.frame(block(width:359pt,height:235pt)[
  #for i in range(4) [
    #let y=12pt + i*53pt
    #place(top + left,dx:8pt,dy:y+8pt,text(size:8pt)[步骤 #(i + 1)])
    #place(top + left,dx:54pt,dy:y+17pt,rect(width:188pt,height:28pt,stroke:.6pt,fill:rgb("eee")))
    #place(top + left,dx:76pt,dy:y+22pt,rect(width:45pt,height:23pt,stroke:.6pt,fill:rgb("ccc")))
    #place(top + left,dx:179pt,dy:y+22pt,rect(width:43pt,height:23pt,stroke:.6pt,fill:rgb("bbb")))
    #place(top + left,dx:248pt,dy:y+9pt,rect(width:96pt,height:37pt,stroke:.65pt))
    #place(top + left,dx:259pt,dy:y+17pt,rect(width:22pt,height:22pt,fill:rgb("ccc")))
    #place(top + left,dx:310pt,dy:y+17pt,rect(width:22pt,height:22pt,fill:rgb("bbb")))
  ]
  #place(top + left,dx:54pt,dy:8pt,rect(width:188pt,height:8pt,fill:rgb("ddd")))
  #place(top + left,dx:87pt,dy:81pt,rect(width:9pt,height:8pt,fill:rgb("777")))
  #place(top + left,dx:196pt,dy:81pt,rect(width:9pt,height:8pt,fill:rgb("777")))
  #place(top + left,dx:58pt,dy:121pt,rect(width:181pt,height:6pt,fill:rgb("888")))
  #place(top + left,dx:146pt,dy:160pt,rect(width:9pt,height:14pt,fill:rgb("777")))
  #place(top + left,dx:57pt,dy:177pt,rect(width:181pt,height:5pt,fill:rgb("999")))
  #place(top + left,dx:29pt,dy:225pt,text(size:7pt)[绝缘层 → 钨接触填充 → 金属层1 → 介质/通孔与金属层2，右列为平面图])
])

#let metal-stack() = html.frame(block(width:360pt,height:235pt)[
  #place(top + left,dx:28pt,dy:205pt,rect(width:234pt,height:23pt,stroke:.8pt,fill:rgb("eeeeee")))
  #for i in range(6) [
    #let y = 175pt - i*31pt
    #let w = if i < 2 { 138pt } else if i < 4 { 166pt } else { 216pt }
    #let x = if i >= 4 {44pt} else {64pt}
    #place(top + left,dx:x,dy:y,rect(width:w,height:9pt,stroke:.7pt,fill:rgb("c6c6c6")))
    #place(top + left,dx:284pt,dy:y - 2pt,text(size:8pt)[M#(i + 1)])
    #if i < 5 [
      #place(top + left,dx:119pt,dy:y - 22pt,rect(width:11pt,height:22pt,stroke:.6pt,fill:rgb("aaaaaa")))
      #place(top + left,dx:302pt,dy:y - 18pt,text(size:6.8pt)[通孔#(i + 1)])
    ]
  ]
  #place(top + left,dx:87pt,dy:191pt,rect(width:12pt,height:14pt,fill:rgb("888")))
  #place(top + left,dx:166pt,dy:191pt,rect(width:12pt,height:14pt,fill:rgb("888")))
  #place(top + left,dx:13pt,dy:208pt,text(size:8pt)[硅])
  #place(top + left,dx:14pt,dy:6pt,text(size:8pt)[顶层宽金属 / 全球互连])
  #place(top + left,dx:16pt,dy:217pt,text(size:7pt)[触点 W])
  #place(top + left,dx:17pt,dy:233pt,text(size:7pt)[层间金属与通孔示意；图3.3 原始比例、厚度需进一步核验])
])

#let planar-cap-res() = html.frame(block(width:360pt,height:158pt)[
  #place(top + left,dx:12pt,dy:10pt,text(size:8pt)[(a) 平行板模型]))
  #place(top + left,dx:23pt,dy:58pt,rect(width:142pt,height:7pt,stroke:.7pt,fill:rgb("ccc")))
  #place(top + left,dx:36pt,dy:90pt,rect(width:142pt,height:7pt,stroke:.7pt,fill:rgb("ccc")))
  #place(top + left,dx:167pt,dy:69pt,line(end:(0pt,19pt),stroke:.8pt))
  #place(top + left,dx:170pt,dy:75pt,text(size:8pt)[$t$]))
  #place(top + left,dx:55pt,dy:35pt,text(size:8pt)[$L$]))
  #place(top + left,dx:23pt,dy:113pt,text(size:8pt)[$C = k epsilon_0 W L / t$]))
  #place(top + left,dx:201pt,dy:10pt,text(size:8pt)[(b) 均匀导体]))
  #place(top + left,dx:208pt,dy:50pt,rect(width:136pt,height:52pt,stroke:.7pt,fill:rgb("ddd")))
  #place(top + left,dx:211pt,dy:57pt,line(length:130pt,stroke:.65pt))
  #place(top + left,dx:231pt,dy:38pt,text(size:8pt)[$L$]))
  #place(top + left,dx:206pt,dy:107pt,text(size:8pt)[$W$]))
  #place(top + left,dx:334pt,dy:110pt,text(size:8pt)[$T$]))
  #place(top + left,dx:201pt,dy:135pt,text(size:8pt)[$R = rho L / (T W)$]))
])

#let interconnect-cap-layout() = html.frame(block(width:360pt,height:186pt)[
  #place(top + left,dx:20pt,dy:167pt,line(length:324pt,stroke:1pt))
  #place(top + left,dx:18pt,dy:170pt,text(size:7.5pt)[地平面])
  #place(top + left,dx:32pt,dy:105pt,rect(width:72pt,height:28pt,stroke:.75pt,fill:rgb("ddd")))
  #place(top + left,dx:127pt,dy:105pt,rect(width:72pt,height:28pt,stroke:.75pt,fill:rgb("ddd")))
  #place(top + left,dx:223pt,dy:105pt,rect(width:72pt,height:28pt,stroke:.75pt,fill:rgb("ddd")))
  #place(top + left,dx:26pt,dy:22pt,rect(width:299pt,height:19pt,stroke:.75pt,fill:rgb("aaa")))
  #place(top + left,dx:149pt,dy:78pt,line(end:(0pt,26pt),stroke:.8pt))
  #place(top + left,dx:152pt,dy:76pt,text(size:8pt)[$H_2$]))
  #place(top + left,dx:58pt,dy:135pt,line(end:(0pt,30pt),stroke:.8pt))
  #place(top + left,dx:61pt,dy:143pt,text(size:8pt)[$H_1$]))
  #place(top + left,dx:106pt,dy:116pt,line(length:20pt,stroke:.8pt))
  #place(top + left,dx:104pt,dy:96pt,text(size:8pt)[$S_1$]))
  #place(top + left,dx:45pt,dy:20pt,text(size:8pt)[金属层2 · $L_2$ · $T_2$]))
  #place(top + left,dx:40pt,dy:91pt,text(size:8pt)[金属层1 · $W_1$ · $T_1$]))
  #place(top + left,dx:11pt,dy:178pt,text(size:7pt)[图3.5 的层间/同层耦合：H1、H2、S1、T1、T2、W1、L2均为可编辑标注])
])

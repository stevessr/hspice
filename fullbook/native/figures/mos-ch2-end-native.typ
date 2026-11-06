// Native, editable reconstruction studies for source PDF pages 077–085.
// These diagrams preserve topology/labels, not photographic or pixel-level likeness.
// No scanned PDF-page bitmap is embedded.

#let junction-plan() = html.frame(block(width: 350pt,height: 247pt)[
  #place(top + left,dx: 12pt,dy: 9pt,text(size: 8pt)[(a) 版图顶视图：扩散区域与多晶硅栅])
  #place(top + left,dx: 65pt,dy: 32pt,rect(width:222pt,height:122pt,stroke:.8pt,fill:rgb("ececec")))
  #place(top + left,dx: 137pt,dy: 22pt,rect(width:72pt,height:143pt,stroke:.9pt,fill:rgb("bcbcbc")))
  #place(top + left,dx: 153pt,dy: 33pt,text(size:9pt)[G])
  #place(top + left,dx: 101pt,dy: 45pt,text(size:9pt)[S])
  #place(top + left,dx: 252pt,dy: 45pt,text(size:9pt)[D])
  #place(top + left,dx: 95pt,dy: 77pt,text(size:8pt)[扩散区])
  #place(top + left,dx: 249pt,dy: 77pt,text(size:8pt)[扩散区])
  #place(top + left,dx: 67pt,dy: 165pt,text(size:8pt)[$Y$：栅至扩散区外缘]))
  #place(top + left,dx: 211pt,dy: 167pt,text(size:8pt)[$L$：栅长]))
  #place(top + left,dx: 7pt,dy: 193pt,text(size:8pt)[(b) 扩散结横截面：底部电容、侧壁电容])
  #place(top + left,dx: 81pt,dy: 212pt,rect(width:188pt,height:30pt,stroke:.9pt,fill:rgb("eeeeee")))
  #place(top + left,dx: 100pt,dy: 212pt,rect(width:150pt,height:15pt,stroke:.8pt,fill:rgb("bcbcbc")))
  #place(top + left,dx: 139pt,dy: 217pt,text(size:7pt)[$n^+$]))
  #place(top + left,dx: 100pt,dy: 230pt,text(size:7pt)[$C_("j,side")$]))
  #place(top + left,dx: 194pt,dy: 230pt,text(size:7pt)[$C_("j,bottom")$]))
  #place(top + left,dx: 283pt,dy: 218pt,text(size:7pt)[$x_j$]))
])

#let overlap-section() = html.frame(block(width:350pt,height:191pt)[
  #place(top + left,dx: 9pt,dy: 5pt,text(size:8pt)[栅—源、栅—漏的横向重叠与边缘电场])
  #place(top + left,dx: 38pt,dy: 77pt,rect(width:276pt,height:81pt,stroke:.8pt,fill:white))
  #place(top + left,dx: 51pt,dy: 79pt,rect(width:91pt,height:26pt,stroke:.8pt,fill:rgb("e0e0e0")))
  #place(top + left,dx: 211pt,dy: 79pt,rect(width:89pt,height:26pt,stroke:.8pt,fill:rgb("e0e0e0")))
  #place(top + left,dx: 127pt,dy: 44pt,rect(width:100pt,height:31pt,stroke:.8pt,fill:rgb("bfbfbf")))
  #place(top + left,dx: 127pt,dy: 75pt,rect(width:100pt,height:4pt,stroke:.7pt,fill:rgb("f5f5f5")))
  #place(top + left,dx: 160pt,dy: 17pt,text(size:9pt)[G])
  #place(top + left,dx: 96pt,dy: 66pt,text(size:8pt)[S])
  #place(top + left,dx: 256pt,dy: 66pt,text(size:8pt)[D])
  #place(top + left,dx: 119pt,dy: 105pt,text(size:8pt)[$C_("ov")$]))
  #place(top + left,dx: 223pt,dy: 106pt,text(size:8pt)[$C_f$]))
  #place(top + left,dx: 163pt,dy: 133pt,text(size:8pt)[$L$]))
  #place(top + left,dx: 135pt,dy: 161pt,text(size:7pt)[$T_("poly")$：栅厚；$t_("ox")$：氧化层厚]))
  #place(top + left,dx: 5pt,dy: 179pt,text(size:7pt)[图2.21组成关系重绘：横向重叠电容与边缘扩散电容])
])

#let mos-four-caps() = html.frame(block(width:350pt,height:178pt)[
  #place(top + left,dx: 5pt,dy: 7pt,text(size:8pt)[图2.22 三种工作区的MOS结点电容网络示意])
  #for i in range(3) [
    #place(top + left,dx: 12pt + i*115pt,dy: 40pt,rect(width:105pt,height:98pt,stroke:.7pt,fill:white))
    #place(top + left,dx: 53pt + i*115pt,dy: 68pt,line(length:22pt,stroke:.9pt))
    #place(top + left,dx: 64pt + i*115pt,dy: 48pt,line(end:(0pt,44pt),stroke:1pt))
    #place(top + left,dx: 48pt + i*115pt,dy: 63pt,line(end:(0pt,36pt),stroke:1pt))
    #place(top + left,dx: 75pt + i*115pt,dy: 65pt,text(size:7pt)[$C_("db")$]))
    #place(top + left,dx: 68pt + i*115pt,dy: 97pt,text(size:7pt)[$C_("sb")$]))
  ]
  #place(top + left,dx: 31pt,dy: 21pt,text(size:8pt)[截止区]))
  #place(top + left,dx: 151pt,dy: 21pt,text(size:8pt)[线性区]))
  #place(top + left,dx: 269pt,dy: 21pt,text(size:8pt)[饱和区]))
  #place(top + left,dx: 5pt,dy: 146pt,text(size:7pt)[本示意仅表现结电容连结关系；全套栅和重叠电容取值以本页表格为准])
])

#let four-bias-cases() = html.frame(block(width: 354pt,height: 166pt)[
  #for (i, data) in ((0,("1.2 V","0.2 V","0.0 V")),
                     (1,("1.2 V","1.2 V","1.1 V")),
                     (2,("0.2 V","1.2 V","0.0 V")),
                     (3,("1.2 V","1.0 V","0.2 V"))) [
    #let x = 17pt + i*89pt
    #place(top + left,dx:x+27pt,dy:25pt,line(end:(0pt,31pt),stroke:.85pt))
    #place(top + left,dx:x+22pt,dy:56pt,line(end:(0pt,30pt),stroke:1pt))
    #place(top + left,dx:x+9pt,dy:68pt,line(length:11pt,stroke:.85pt))
    #place(top + left,dx:x+27pt,dy:87pt,line(end:(0pt,24pt),stroke:.85pt))
    #place(top + left,dx:x+17pt,dy:11pt,text(size:7pt)[#data.at(0)])
    #place(top + left,dx:x,dy:56pt,text(size:7pt)[#data.at(1)])
    #place(top + left,dx:x+16pt,dy:113pt,text(size:7pt)[#data.at(2)])
  ]
  #place(top + left,dx:42pt,dy:135pt,text(size:8pt)[(a)])
  #place(top + left,dx:131pt,dy:135pt,text(size:8pt)[(b)])
  #place(top + left,dx:220pt,dy:135pt,text(size:8pt)[(c)])
  #place(top + left,dx:309pt,dy:135pt,text(size:8pt)[(d)])
])

#let mos-charge-cases() = html.frame(block(width: 354pt,height:150pt)[
  #for (i, topVoltage) in ((0,"1.0 V"),(1,"0.6 V")) [
    #let x=55pt+i*171pt
    #place(top + left,dx:x,dy:21pt,line(end:(0pt,34pt),stroke:.9pt))
    #place(top + left,dx:x-4pt,dy:55pt,line(end:(0pt,30pt),stroke:1pt))
    #place(top + left,dx:x-32pt,dy:64pt,line(length:25pt,stroke:.9pt))
    #place(top + left,dx:x,dy:86pt,line(end:(0pt,18pt),stroke:.9pt))
    #place(top + left,dx:x-9pt,dy:104pt,line(length:18pt,stroke:.9pt))
    #place(top + left,dx:x-9pt,dy:109pt,line(length:18pt,stroke:.9pt))
    #place(top + left,dx:x,dy:110pt,line(end:(0pt,16pt),stroke:.8pt))
    #place(top + left,dx:x-12pt,dy:126pt,line(length:24pt,stroke:.8pt))
    #place(top + left,dx:x-20pt,dy:8pt,text(size:8pt)[#topVoltage])
    #place(top + left,dx:x-43pt,dy:53pt,text(size:8pt)[1.2 V])
    #place(top + left,dx:x+7pt,dy:95pt,text(size:8pt)[$V_x$]))
  ]
  #place(top + left,dx:18pt,dy:138pt,text(size:7pt)[(a) 漏1.0 V；(b) 漏0.6 V；电容起始为0 V。仅作电路拓扑候选。])
])

// SOURCE PDF389–396 (printed 370–377): source-informed, native/editable diagrams.
// Circuit/network topology is schematic; numerical heatmaps and micrographs are abstractions.
#import "ch7-domino-continuation-native.typ": w,t,b,r,inv,cap,gnd
#let fig113()=html.frame(block(width:388pt,height:148pt)[
  #t(8pt,4pt,"封装电感 × 同时切换电流")
  #t(6pt,30pt,"VDD")
  #b(56pt,29pt,68pt,23pt,"0.2 nH")
  #w(124pt,40pt,360pt,40pt)
  #t(8pt,115pt,"VSS")
  #b(56pt,105pt,68pt,23pt,"0.2 nH")
  #w(124pt,116pt,360pt,116pt)
  #for i in range(3) [
    #let x=155pt+i*73pt
    #inv(x,79pt)
    #w(x+8pt,40pt,x+8pt,67pt)
    #w(x+8pt,91pt,x+8pt,116pt)
  ]
  #t(112pt,135pt,"两根供电支路：2 L ΔI/Δt")
])
#let fig114()=html.frame(block(width:388pt,height:147pt)[
  #t(8pt,4pt,"电源/地分布RLC网络")
  #t(6pt,27pt,"VDD")
  #for i in range(3) [
    #let x=44pt+i*99pt
    #b(x,29pt,56pt,18pt,"R")
    #w(x+56pt,38pt,x+98pt,38pt)
    #b(x,108pt,56pt,18pt,"L/R")
    #w(x+56pt,117pt,x+98pt,117pt)
  ]
  #w(42pt,38pt,42pt,117pt)
  #w(338pt,38pt,338pt,117pt)
  #w(175pt,38pt,175pt,80pt)
  #cap(167pt,76pt)
  #t(192pt,77pt,"C")
  #t(6pt,131pt,"VSS")
])
#let fig115()=html.frame(block(width:388pt,height:152pt)[
  #t(10pt,2pt,"电迁移：长期电流密度过高导致金属/通孔退化")
  #b(44pt,38pt,306pt,34pt,"金属线 → 电子流")
  #b(205pt,38pt,27pt,34pt,"空洞")
  #w(18pt,55pt,44pt,55pt)
  #w(350pt,55pt,378pt,55pt)
  #t(18pt,101pt,"局部截面缩小 → 电阻上升")
  #t(18pt,120pt,"可能形成开路/短路的失效模式")
])
#let fig116()=html.frame(block(width:388pt,height:152pt)[
  #t(6pt,3pt,"大模块级电源分布：VDD / VSS正交栅格")
  #for i in range(8) [
    #let x=51pt+i*40pt
    #w(x,34pt,x,129pt)
  ]
  #for j in range(4) [
    #let y=38pt+j*27pt
    #w(39pt,y,360pt,y)
  ]
  #b(107pt,55pt,79pt,49pt,"模块 A")
  #b(227pt,55pt,79pt,49pt,"模块 B")
])
#let fig117()=html.frame(block(width:388pt,height:135pt)[
  #for k in range(2) [
    #let x=9pt+k*196pt
    #t(x+8pt,3pt,if k==0 {"(a) 较窄供电线"} else {"(b) 更宽供电线"})
    #b(x+15pt,23pt,151pt,17pt,"VDD")
    #b(x+34pt,47pt,47pt,45pt,"模块 A")
    #b(x+113pt,47pt,48pt,45pt,"模块 B")
    #b(x+15pt,102pt,151pt,17pt,"VSS")
  ]
])
#let fig118()=html.frame(block(width:388pt,height:139pt)[
  #for k in range(2) [
    #let x=8pt+k*191pt
    #t(x+8pt,1pt,if k==0 {"(a) 单边供电"} else {"(b) 双边供电"})
    #for j in range(7) [
      #let y=26pt+j*15pt
      #w(x+28pt,y,x+168pt,y)
    ]
    #b(x+8pt,21pt,15pt,111pt,"VDD")
    #if k==1 {b(x+172pt,21pt,15pt,111pt,"VDD")}
  ]
])
#let fig119()=html.frame(block(width:388pt,height:146pt)[
  #t(8pt,5pt,"M4 / M5 垂直网格以通孔阵列连接")
  #for i in range(4) [
    #let x=45pt+i*83pt
    #b(x,28pt,14pt,94pt,"M4")
  ]
  #for j in range(3) [
    #let y=42pt+j*31pt
    #b(23pt,y,345pt,12pt,"M5")
  ]
])
#let fig1110()=html.frame(block(width:388pt,height:146pt)[
  #t(4pt,5pt,"VDD")
  #b(41pt,33pt,310pt,21pt,"片上供电轨 / R / L")
  #b(41pt,100pt,310pt,21pt,"片上地线轨 / R / L")
  #inv(91pt,81pt)
  #inv(281pt,81pt)
  #w(102pt,54pt,102pt,71pt)
  #w(102pt,92pt,102pt,100pt)
  #w(289pt,54pt,289pt,71pt)
  #w(289pt,92pt,289pt,100pt)
  #w(192pt,54pt,192pt,94pt)
  #cap(184pt,66pt)
  #t(200pt,68pt,"Cdecap")
])
#let fig1111()=html.frame(block(width:388pt,height:146pt)[
  #t(9pt,3pt,"MOS去耦电容：栅极连接VDD，源漏/体连接VSS")
  #b(66pt,35pt,250pt,25pt,"G / 多晶硅")
  #b(80pt,79pt,220pt,30pt,"沟道 / 扩散区")
  #w(192pt,60pt,192pt,79pt)
  #t(200pt,64pt,"Cox")
  #t(83pt,123pt,"Cdecap ≈ Cox W L + 覆盖/边缘电容")
])
#let fig1112()=html.frame(block(width:388pt,height:148pt)[
  #t(8pt,2pt,"局部芯片电源网格建模：边界焊盘与二维电阻网格")
  #for i in range(9) [
    #let x=35pt+i*38pt
    #w(x,21pt,x,132pt)
  ]
  #for j in range(7) [
    #let y=22pt+j*17pt
    #w(35pt,y,339pt,y)
  ]
  #for i in range(2) [
    #let x=35pt+i*304pt
    #place(top+left,dx:x,dy:21pt,circle(radius:8pt,fill:white,stroke:1pt))
    #place(top+left,dx:x,dy:124pt,circle(radius:8pt,fill:white,stroke:1pt))
  ]
])
#let fig1113()=html.frame(block(width:388pt,height:152pt)[
  #t(6pt,2pt,"图11.13的电源分布实物照片对应芯片功能分区；原照片未被矢量化")
  #for i in range(4) [
    #let x=20pt+i*91pt
    #b(x,28pt,72pt,95pt,("大模块","存储器","逻辑模块","外设").at(i))
  ]
  #t(6pt,138pt,"这是区域与网格概念说明，不是源书照片的复制")
])
#let fig1114()=html.frame(block(width:388pt,height:148pt)[
  #for k in range(2) [
    #let x=7pt+k*195pt
    #t(x+8pt,4pt,if k==0 {"(a) 初始IR压降"} else {"(b) 改进IR压降"})
    #for i in range(6) [
      #let xx=x+20pt+i*25pt
      #b(xx,32pt,19pt,89pt,"")
    ]
    #t(x+19pt,131pt,"灰度示意，不是源数据热图")
  ]
])
#let fig1115()=html.frame(block(width:388pt,height:148pt)[
  #for k in range(2) [
    #let x=7pt+k*195pt
    #t(x+8pt,4pt,if k==0 {"(a) 初始EM风险"} else {"(b) 加宽金属后"})
    #for i in range(5) [
      #let xx=x+22pt+i*30pt
      #b(xx,32pt,21pt,89pt,"")
    ]
    #t(x+20pt,132pt,"概念示意，非原书热图")
  ]
])

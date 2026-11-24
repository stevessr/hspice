// SOURCE PDF381–388, original printed pages362–369.
// All diagrams constructed as editable Typst vector primitives; original layout not 1:1.
#import "ch7-domino-continuation-native.typ": w,t,b,r,inv,cap,gnd
#let fig1028()=html.frame(block(width:388pt,height:156pt)[
  #t(4pt,2pt,"天线避免法：在晚些金属步骤连接敏感栅")
  #b(12pt,27pt,310pt,17pt,"第一层金属／早期较长收集线")
  #w(93pt,44pt,93pt,77pt)
  #t(99pt,49pt,"过孔（晚步骤连接）")
  #b(24pt,82pt,276pt,15pt,"第二层金属跨接路径")
  #w(265pt,97pt,265pt,122pt)
  #b(234pt,122pt,63pt,24pt,"MOS 栅极")
])
#let figp104()=html.frame(block(width:388pt,height:149pt)[
  #t(6pt,5pt,"源")
  #w(35pt,56pt,60pt,56pt)
  #for i in range(3) [
    #let x=64pt+i*104pt
    #b(x,45pt,48pt,20pt,"R"+str(i+1))
    #w(x+48pt,56pt,x+94pt,56pt)
    #w(x+77pt,56pt,x+77pt,89pt)
    #cap(x+69pt,89pt)
    #gnd(x+77pt,111pt)
    #t(x+71pt,125pt,"C"+str(i+1))
  ]
  #t(353pt,51pt,"输出")
])
#let figp105()=html.frame(block(width:388pt,height:145pt)[
  #for i in range(3) [
    #let x=10pt+i*127pt
    #t(x+31pt,2pt,("L型","π型","T型").at(i))
    #w(x,49pt,x+11pt,49pt)
    #b(x+12pt,38pt,64pt,22pt,"Rwire")
    #w(x+76pt,49pt,x+105pt,49pt)
    #w(x+96pt,49pt,x+96pt,79pt)
    #cap(x+88pt,79pt)
    #gnd(x+96pt,102pt)
    #t(x+18pt,120pt,"Cwire")
  ]
])
#let figp106()=html.frame(block(width:388pt,height:137pt)[
  #t(5pt,3pt,"具有三个观测节点的分支RC树")
  #b(18pt,45pt,50pt,22pt,"R1")
  #w(68pt,56pt,140pt,56pt)
  #w(130pt,56pt,130pt,22pt)
  #w(130pt,56pt,130pt,95pt)
  #b(145pt,13pt,58pt,20pt,"R3")
  #b(145pt,84pt,58pt,20pt,"R2")
  #w(130pt,24pt,145pt,24pt)
  #w(130pt,94pt,145pt,94pt)
  #t(216pt,17pt,"C3 → 节点3")
  #t(216pt,88pt,"C2 → 节点2")
  #t(73pt,66pt,"节点1 / C1")
])
#let figp108()=html.frame(block(width:388pt,height:147pt)[
  #inv(11pt,37pt)
  #w(37pt,37pt,358pt,37pt)
  #t(190pt,13pt,"侵略者 / Cgnd=50fF")
  #inv(11pt,104pt)
  #w(37pt,104pt,358pt,104pt)
  #t(180pt,117pt,"受害者 / Cgnd=60fF")
  #w(210pt,37pt,210pt,104pt)
  #cap(202pt,62pt)
  #t(219pt,64pt,"Cc=100fF")
])
#let fig111()=html.frame(block(width:388pt,height:165pt)[
  #t(10pt,1pt,"电源网格的 IR 压降")
  #w(45pt,64pt,355pt,64pt)
  #b(68pt,52pt,54pt,23pt,"R1")
  #b(165pt,52pt,54pt,23pt,"R2")
  #b(262pt,52pt,54pt,23pt,"R3")
  #t(42pt,31pt,"VDD")
  #t(327pt,31pt,"VDD−ΔV")
  #for i in range(2) [
    #let x=142pt+i*134pt
    #w(x,64pt,x,91pt)
    #inv(x - 12pt,111pt)
    #gnd(x,141pt)
  ]
  #t(158pt,145pt,"inv1 / inv2 同时切换会相互影响")
])
#let fig112()=html.frame(block(width:388pt,height:155pt)[
  #t(4pt,2pt,"(a) 双列直插式 DIP")
  #b(15pt,36pt,152pt,64pt,"芯片")
  #for i in range(7) [
    #let x=15pt+i*22pt
    #w(x,36pt,x,22pt)
    #w(x,100pt,x,114pt)
  ]
  #t(208pt,2pt,"(b) 焊球阵列 BGA")
  #b(204pt,30pt,175pt,60pt,"芯片 / 中介层")
  #for i in range(7) [
    #let x=217pt+i*23pt
    #place(top+left,dx:x,dy:98pt,circle(radius:3pt,fill:white,stroke:.7pt))
  ]
  #b(202pt,116pt,180pt,14pt,"电路板")
])

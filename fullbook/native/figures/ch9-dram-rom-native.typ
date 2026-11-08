// Source scan pages PDF333–340, native editable functional figures.
// Exact source topology, MOS physical dimensions and page alignment remain unverified.
#import "ch7-domino-continuation-native.typ": w,t,b,inv,cap,gnd
#let fig912()=html.frame(block(width:389pt,height:125pt)[
  #t(13pt,5pt,"VDD")
  #b(46pt,21pt,49pt,25pt,"WL")
  #b(299pt,21pt,49pt,25pt,"WL")
  #b(113pt,31pt,69pt,45pt,"NMOS M1")
  #b(210pt,31pt,69pt,45pt,"NMOS M2")
  #w(182pt,52pt,210pt,52pt)
  #w(210pt,69pt,181pt,93pt)
  #w(181pt,93pt,144pt,93pt)
  #w(144pt,93pt,144pt,76pt)
  #t(110pt,98pt,"节点 D")
  #t(219pt,98pt,"节点 D̅")
  #t(19pt,65pt,"位线 D")
  #t(317pt,65pt,"位线 D̅")
])
#let fig913()=html.frame(block(width:389pt,height:154pt)[
  #t(6pt,7pt,"写位线 Din")
  #t(305pt,7pt,"读位线 Dout")
  #w(70pt,23pt,70pt,48pt)
  #w(317pt,23pt,317pt,48pt)
  #b(46pt,48pt,59pt,30pt,"M1 写")
  #b(282pt,48pt,59pt,30pt,"M3 读")
  #w(105pt,63pt,156pt,63pt)
  #b(155pt,48pt,69pt,31pt,"M2 放电")
  #w(189pt,79pt,189pt,103pt)
  #gnd(189pt,104pt)
  #w(156pt,63pt,156pt,102pt)
  #cap(148pt,105pt)
  #gnd(156pt,119pt)
  #t(110pt,91pt,"C1 存储")
  #t(7pt,138pt,"写选择 W")
  #t(296pt,138pt,"读选择 R")
])
#let fig914()=html.frame(block(width:389pt,height:123pt)[
  #t(6pt,9pt,"位线 D")
  #w(73pt,25pt,73pt,46pt)
  #b(47pt,47pt,54pt,33pt,"M1")
  #w(74pt,80pt,74pt,96pt)
  #cap(66pt,97pt)
  #gnd(74pt,112pt)
  #t(110pt,55pt,"WL / 升压字线")
  #w(102pt,63pt,196pt,63pt)
  #t(135pt,88pt,"Ccell")
  #t(217pt,19pt,"预充位线和电荷共享")
])
#let fig915()=html.frame(block(width:389pt,height:158pt)[
  #b(9pt,10pt,173pt,139pt,"沟槽型单元剖面")
  #b(206pt,10pt,173pt,139pt,"堆叠型单元剖面")
  #w(25pt,89pt,161pt,89pt)
  #w(222pt,93pt,363pt,93pt)
  #b(73pt,35pt,31pt,88pt,"沟槽 C")
  #b(247pt,40pt,90pt,31pt,"堆叠电容 C")
  #t(14pt,135pt,"硅衬底 / 氧化物")
  #t(214pt,135pt,"多晶硅/绝缘层")
])
#let fig916()=html.frame(block(width:389pt,height:170pt)[
  #for i in range(2) [
    #let y=32pt+i*69pt
    #w(8pt,y,380pt,y)
    #t(9pt,y-16pt,("D1","D2").at(i))
    #b(160pt,y-16pt,70pt,34pt,"灵敏放大器")
    #for k in range(2) [
      #let x=40pt+k*75pt
      #b(x,y+14pt,43pt,21pt,"1T")
      #w(x+21pt,y,x+21pt,y+14pt)
    ]
    #for k in range(2) [
      #let x=257pt+k*75pt
      #b(x,y+14pt,43pt,21pt,"1T")
      #w(x+21pt,y,x+21pt,y+14pt)
    ]
  ]
  #t(17pt,153pt,"R1–R128")
  #t(270pt,153pt,"R129–R256")
])
#let fig917()=html.frame(block(width:389pt,height:145pt)[
  #t(154pt,3pt,"VDD")
  #b(138pt,22pt,116pt,23pt,"M5 上拉使能")
  #b(84pt,53pt,79pt,38pt,"CMOS反相器")
  #b(226pt,53pt,79pt,38pt,"CMOS反相器")
  #w(163pt,64pt,226pt,64pt)
  #w(226pt,78pt,194pt,106pt)
  #w(194pt,106pt,124pt,106pt)
  #w(124pt,106pt,124pt,91pt)
  #b(139pt,112pt,112pt,29pt,"M6 下拉使能")
  #t(26pt,72pt,"D")
  #t(348pt,72pt,"D̅")
  #t(148pt,48pt,"交叉耦合再生")
])
#let fig918()=html.frame(block(width:389pt,height:169pt)[
  #b(6pt,27pt,78pt,47pt,"行地址锁存")
  #b(6pt,95pt,78pt,46pt,"列地址锁存")
  #b(105pt,7pt,212pt,44pt,"128行×256列 左侧子阵列")
  #b(105pt,111pt,212pt,44pt,"128行×256列 右侧子阵列")
  #b(105pt,60pt,212pt,42pt,"256路锁存式灵敏放大")
  #b(326pt,60pt,57pt,42pt,"列MUX")
  #w(84pt,49pt,105pt,32pt)
  #w(84pt,119pt,105pt,138pt)
  #w(211pt,51pt,211pt,60pt)
  #w(211pt,102pt,211pt,111pt)
  #w(317pt,80pt,326pt,80pt)
])
#let fig919()=html.frame(block(width:389pt,height:132pt)[
  #t(20pt,6pt,"位线 BL / 预充负载")
  #w(76pt,28pt,76pt,45pt)
  #b(50pt,46pt,52pt,34pt,"MOS")
  #w(76pt,80pt,76pt,96pt)
  #gnd(76pt,98pt)
  #t(125pt,53pt,"WL字线：存在MOS则选中时下拉")
  #t(125pt,93pt,"没有MOS的交点保持预充高电平")
])
#let fig920()=html.frame(block(width:389pt,height:157pt)[
  #for section in range(2) [
    #let x=5pt+section*194pt
    #t(x+17pt,4pt,("(a) NOR ROM","(b) NAND ROM").at(section))
    #for k in range(3) [
      #let y=30pt+k*34pt
      #w(x+5pt,y,x+177pt,y)
      #for j in range(3) [
        #let xx=x+35pt+j*54pt
        #b(xx,y-9pt,27pt,19pt,"M")
      ]
    ]
    #t(x+38pt,141pt,"WL / 位线阵列")
  ]
])
#let figure9later(n)={
  if n==12 {fig912()}
  else if n==13 {fig913()}
  else if n==14 {fig914()}
  else if n==15 {fig915()}
  else if n==16 {fig916()}
  else if n==17 {fig917()}
  else if n==18 {fig918()}
  else if n==19 {fig919()}
  else if n==20 {fig920()}
  else {fig914()}
}

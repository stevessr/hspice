// Source images PDF341–356, Fig9.21–9.33 and Fig10.1–10.3.
// Editable functional reconstructions; electrical and geometrical fidelity unaccepted.
#import "ch7-domino-continuation-native.typ": w,t,b,inv,cap,gnd
#let rom-sense()=html.frame(block(width:388pt,height:143pt)[
  #t(170pt,3pt,"VDD")
  #b(157pt,19pt,75pt,34pt,"电流负载")
  #b(157pt,63pt,75pt,36pt,"差分检测")
  #b(262pt,65pt,85pt,30pt,"输出缓冲")
  #w(195pt,53pt,195pt,63pt)
  #w(232pt,82pt,262pt,82pt)
  #t(15pt,69pt,"ROM BL")
  #w(76pt,79pt,157pt,79pt)
  #t(20pt,110pt,"Vref / 参考")
])
#let floating-gate()=html.frame(block(width:388pt,height:154pt)[
  #t(6pt,5pt,"浮栅晶体管纵截面")
  #b(19pt,92pt,349pt,46pt,"p型衬底")
  #b(39pt,76pt,60pt,19pt,"N+源")
  #b(285pt,76pt,60pt,19pt,"N+漏")
  #b(133pt,68pt,110pt,13pt,"氧化层 C1")
  #b(130pt,53pt,116pt,14pt,"G1 浮栅")
  #b(126pt,35pt,124pt,14pt,"氧化层 C2")
  #b(126pt,13pt,124pt,18pt,"G2 控制栅")
  #t(270pt,20pt,"Vg")
  #t(269pt,112pt,"Vd / Vs")
])
#let threshold()=html.frame(block(width:388pt,height:151pt)[
  #w(40pt,120pt,360pt,120pt)
  #w(40pt,120pt,40pt,12pt)
  #t(11pt,8pt,"Id")
  #t(354pt,126pt,"Vg")
  #for k in range(3) [
    #let x=69pt+k*79pt
    #w(x,118pt,x+35pt,26pt)
    #t(x+7pt,126pt,("VT0","VDD","VT1").at(k))
  ]
  #t(115pt,11pt,"HCI 编程 →")
  #t(115pt,30pt,"← UV / FN 擦除")
])
#let uv-erase()=html.frame(block(width:388pt,height:155pt)[
  #b(10pt,40pt,170pt,101pt,"(a) 热载流子注入")
  #b(208pt,40pt,170pt,101pt,"(b) UV 擦除")
  #b(38pt,63pt,116pt,15pt,"G2 控制栅")
  #b(38pt,82pt,116pt,15pt,"G1 浮栅")
  #b(237pt,63pt,116pt,15pt,"G2 控制栅")
  #b(237pt,82pt,116pt,15pt,"G1 浮栅")
  #for k in range(4) [
    #let x=239pt+26pt*k
    #w(x,19pt,x+2pt,39pt)
  ]
  #t(237pt,6pt,"UV 紫外光")
  #t(27pt,125pt,"HCI电子捕获")
])
#let eeprom2t()=html.frame(block(width:388pt,height:146pt)[
  #t(7pt,7pt,"2T FLOTOX 单元")
  #b(43pt,80pt,312pt,51pt,"p型衬底")
  #b(76pt,52pt,94pt,16pt,"G1 浮栅")
  #b(76pt,27pt,94pt,19pt,"G2 控制栅")
  #b(208pt,36pt,84pt,32pt,"选择晶体管")
  #w(170pt,53pt,208pt,53pt)
  #t(290pt,15pt,"WL")
  #t(294pt,65pt,"BL")
  #t(77pt,108pt,"FN 隧穿氧化层")
])
#let fn-current()=html.frame(block(width:388pt,height:138pt)[
  #w(35pt,69pt,360pt,69pt)
  #w(185pt,13pt,185pt,126pt)
  #w(74pt,122pt,139pt,15pt)
  #w(230pt,122pt,295pt,15pt)
  #t(38pt,8pt,"I")
  #t(353pt,83pt,"Vgd")
  #t(86pt,83pt,"-10V")
  #t(270pt,83pt,"10V")
  #t(124pt,12pt,"FN")
])
#let memory-matrix(label:"存储阵列")=html.frame(block(width:388pt,height:166pt)[
  #t(122pt,5pt,label)
  #for i in range(4) [
    #let y=26pt+i*28pt
    #w(10pt,y,375pt,y)
    #for j in range(5) [
      #let x=31pt+j*64pt
      #b(x,y-8pt,27pt,18pt,"M")
      #w(x+13pt,16pt,x+13pt,141pt)
    ]
  ]
  #t(126pt,152pt,"WL 行 / BL 列")
])
#let flash-array()=html.frame(block(width:388pt,height:174pt)[
  #t(8pt,3pt,"串行/NAND 与并行/NOR Flash 阵列")
  #for k in range(4) [
    #let x=25pt+k*85pt
    #w(x,19pt,x,152pt)
    #for j in range(4) [
      #let y=27pt+j*28pt
      #b(x-13pt,y,30pt,20pt,"FG")
    ]
  ]
  #t(15pt,163pt,"选通管、浮栅单元与行译码")
])
#let memory-tree()=html.frame(block(width:388pt,height:160pt)[
  #b(119pt,8pt,150pt,27pt,"半导体存储器")
  #b(28pt,53pt,155pt,26pt,"易失型 SRAM / DRAM")
  #b(207pt,53pt,154pt,26pt,"非易失型存储")
  #w(195pt,35pt,105pt,53pt)
  #w(195pt,35pt,284pt,53pt)
  #for i in range(4) [
    #let x=17pt+i*94pt
    #b(x,113pt,86pt,23pt,("ROM","EPROM","EEPROM","Flash").at(i))
    #w(x+43pt,79pt,x+43pt,113pt)
  ]
])
#let dram-fram()=html.frame(block(width:388pt,height:151pt)[
  #t(5pt,5pt,"FRAM 单元：访问晶体管 + 铁电电容")
  #b(18pt,34pt,111pt,46pt,"Ferro电容")
  #b(175pt,34pt,91pt,46pt,"访问MOS")
  #w(129pt,57pt,175pt,57pt)
  #t(295pt,57pt,"BL")
  #t(177pt,14pt,"WL")
  #w(267pt,57pt,335pt,57pt)
  #w(54pt,90pt,340pt,90pt)
  #t(26pt,123pt,"铁电极化迟滞：剩余极化 +Pr/-Pr")
])
#let interconnect()=html.frame(block(width:388pt,height:152pt)[
  #b(26pt,119pt,334pt,24pt,"硅衬底")
  #for i in range(4) [
    #let x=33pt+i*79pt
    #b(x,91pt,43pt,15pt,"M1")
    #b(x,60pt,43pt,15pt,"M2")
    #b(x,29pt,43pt,15pt,"M3")
    #w(x+20pt,75pt,x+20pt,91pt)
    #w(x+20pt,44pt,x+20pt,60pt)
  ]
  #t(11pt,7pt,"多金属层、通孔、介质与层间互连")
])
#let rc-wire()=html.frame(block(width:388pt,height:164pt)[
  #t(10pt,6pt,"(a) 集总电容")
  #inv(13pt,53pt)
  #w(39pt,53pt,170pt,53pt)
  #cap(109pt,73pt)
  #w(109pt,53pt,109pt,73pt)
  #t(13pt,98pt,"(b) 分布 RC")
  #inv(13pt,135pt)
  #for k in range(4) [
    #let x=53pt+k*57pt
    #b(x,122pt,45pt,18pt,"R")
    #w(x+22pt,140pt,x+22pt,149pt)
  ]
  #t(305pt,142pt,"输出")
])
#let figure9late(n)={
  if n==21 {rom-sense()}
  else if n==22 {floating-gate()}
  else if n==23 {threshold()}
  else if n==24 {uv-erase()}
  else if n==25 {eeprom2t()}
  else if n==26 {fn-current()}
  else if n==27 or n==28 {memory-matrix(label:"EPROM/FLOTOX阵列")}
  else if n==29 or n==30 or n==31 or n==32 {flash-array()}
  else if n==33 {dram-fram()}
  else {memory-tree()}
}
#let figure10(n)={
  if n==1 or n==2 {interconnect()}
  else if n==3 {rc-wire()}
  else {interconnect()}
}
#let fig-summary()=memory-tree()

// Source PDF293–324. Native editable, conceptual reconstruction only.
// Per-transistor nodes, polarity and figure geometry are NOT 1:1 verified.
#import "ch7-domino-continuation-native.typ": w,t,b,inv,cap,gnd

#let memory-array()=html.frame(block(width:388pt,height:170pt)[
  #b(4pt,30pt,54pt,107pt,"行译码")
  #for r in range(4) [
    #let y=27pt+r*31pt
    #w(58pt,y+16pt,366pt,y+16pt)
    #t(62pt,y+2pt,"WL"+str(r))
    #for c in range(4) [
      #let x=107pt+c*62pt
      #b(x,y+4pt,36pt,22pt,"cell")
      #w(x+18pt,20pt,x+18pt,149pt)
    ]
  ]
  #b(105pt,147pt,254pt,22pt,"列选择与差分 I/O")
])
#let sram()=html.frame(block(width:388pt,height:138pt)[
  #t(12pt,5pt,"BL")
  #t(337pt,5pt,"BL̅")
  #w(22pt,20pt,22pt,92pt)
  #w(345pt,20pt,345pt,92pt)
  #b(35pt,45pt,52pt,30pt,"Access")
  #b(288pt,45pt,52pt,30pt,"Access")
  #b(102pt,45pt,61pt,30pt,"INV1")
  #b(210pt,45pt,61pt,30pt,"INV2")
  #w(87pt,60pt,102pt,60pt)
  #w(271pt,60pt,288pt,60pt)
  #w(163pt,54pt,210pt,54pt)
  #w(210pt,68pt,188pt,105pt)
  #w(188pt,105pt,132pt,105pt)
  #w(132pt,105pt,132pt,75pt)
  #t(167pt,5pt,"WL")
  #w(61pt,30pt,314pt,30pt)
  #w(61pt,30pt,61pt,45pt)
  #w(314pt,30pt,314pt,45pt)
  #t(95pt,123pt,"6T SRAM: 双反相器 + 两个存取管")
])
#let decoder()=html.frame(block(width:388pt,height:142pt)[
  #for i in range(4) [
    #let y=11pt+i*33pt
    #t(5pt,y+9pt,"A"+str(i))
    #w(31pt,y+13pt,65pt,y+13pt)
    #b(65pt,y,84pt,26pt,"预译码")
    #w(149pt,y+13pt,218pt,y+13pt)
    #b(218pt,y,89pt,26pt,"NAND + INV")
    #w(307pt,y+13pt,343pt,y+13pt)
    #t(346pt,y+9pt,"WL"+str(i))
  ]
])
#let sense()=html.frame(block(width:388pt,height:155pt)[
  #t(175pt,2pt,"VDD")
  #b(67pt,24pt,93pt,40pt,"上拉 / 电流镜")
  #b(225pt,24pt,93pt,40pt,"上拉 / 电流镜")
  #w(160pt,45pt,225pt,45pt)
  #b(67pt,76pt,93pt,36pt,"差分输入 +")
  #b(225pt,76pt,93pt,36pt,"差分输入 −")
  #w(160pt,91pt,225pt,91pt)
  #b(167pt,119pt,72pt,29pt,"尾电流")
  #w(193pt,91pt,193pt,119pt)
  #t(6pt,91pt,"BL")
  #t(330pt,91pt,"BL̅")
  #t(336pt,34pt,"OUT")
])
#let precharge()=html.frame(block(width:388pt,height:143pt)[
  #for k in range(3) [
    #let x=5pt+k*129pt
    #t(x+8pt,4pt,("(a) 预充","(b) 静态上拉","(c) NMOS负载").at(k))
    #b(x+12pt,27pt,44pt,28pt,"M1")
    #b(x+70pt,27pt,44pt,28pt,"M2")
    #w(x+34pt,55pt,x+34pt,99pt)
    #w(x+92pt,55pt,x+92pt,99pt)
    #b(x+46pt,70pt,38pt,19pt,"EQ")
    #t(x+16pt,114pt,"BL")
    #t(x+83pt,114pt,"BL̅")
  ]
])
#let timing()=html.frame(block(width:388pt,height:137pt)[
  #for k in range(4) [
    #let y=15pt+k*31pt
    #t(5pt,y+5pt,("地址","WL","BL","输出").at(k))
    #w(77pt,y+12pt,125pt,y+12pt)
    #w(125pt,y+12pt,151pt,y - 3pt)
    #w(151pt,y - 3pt,273pt,y - 3pt)
    #w(273pt,y - 3pt,306pt,y+12pt)
    #w(306pt,y+12pt,373pt,y+12pt)
  ]
])
#let columns()=html.frame(block(width:388pt,height:132pt)[
  #for k in range(5) [
    #let x=11pt+k*71pt
    #t(x+3pt,3pt,"BL"+str(k))
    #w(x+19pt,20pt,x+19pt,80pt)
    #b(x,80pt,41pt,24pt,"TG")
    #w(x+20pt,104pt,193pt,119pt)
  ]
  #t(232pt,114pt,"列输出 / I/O")
])
#let partition()=html.frame(block(width:388pt,height:148pt)[
  #for k in range(4) [
    #let x=6pt+k*96pt
    #b(x,6pt,85pt,105pt,"RAM 块"+str(k+1))
  ]
  #b(31pt,118pt,326pt,25pt,"局部字线与全局位线")
])
#let cam()=html.frame(block(width:388pt,height:146pt)[
  #b(5pt,12pt,82pt,33pt,"查询字")
  #for k in range(3) [
    #let y=11pt+k*44pt
    #b(125pt,y,145pt,32pt,"CAM 行"+str(k))
    #w(87pt,29pt,125pt,y+16pt)
    #w(270pt,y+16pt,323pt,y+16pt)
    #t(326pt,y+9pt,"匹配"+str(k))
  ]
])
#let figure8(n)={
  if n==1 or n==2 or n==9 or n==24 {memory-array()}
  else if n==4 or n==5 or n==6 or n==17 {decoder()}
  else if n==7 or n==8 or n==10 or n==11 or n==12 {sram()}
  else if n==3 or n==14 or n==21 or n==23 {timing()}
  else if n==13 {precharge()}
  else if n==15 or n==16 or n==18 {columns()}
  else if n==19 or n==20 or n==22 {sense()}
  else if n==25 or n==26 or n==27 {partition()}
  else {memory-array()}
}
#let cam-cell()=html.frame(block(width:388pt,height:148pt)[
  #t(13pt,7pt,"WL")
  #w(34pt,20pt,355pt,20pt)
  #b(65pt,35pt,90pt,50pt,"SRAM 标签位")
  #b(221pt,35pt,90pt,50pt,"反相标签位")
  #w(155pt,59pt,221pt,59pt)
  #b(84pt,94pt,61pt,27pt,"XOR支路1")
  #b(231pt,94pt,61pt,27pt,"XOR支路2")
  #w(111pt,85pt,111pt,94pt)
  #w(262pt,85pt,262pt,94pt)
  #w(22pt,131pt,362pt,131pt)
  #w(114pt,121pt,114pt,131pt)
  #w(262pt,121pt,262pt,131pt)
  #t(284pt,137pt,"ML 匹配线")
])
#let cam-bank()=html.frame(block(width:388pt,height:154pt)[
  #b(7pt,22pt,73pt,89pt,"CAM标签阵列")
  #b(138pt,22pt,193pt,89pt,"SRAM数据阵列")
  #w(80pt,65pt,138pt,65pt)
  #b(86pt,41pt,47pt,37pt,"匹配使能")
  #b(95pt,119pt,227pt,29pt,"CAM行地址 / SRAM列选择")
  #t(8pt,6pt,"标签输入")
  #t(336pt,62pt,"数据输出")
])
#let fpga-grid()=html.frame(block(width:388pt,height:176pt)[
  #for k in range(5) [
    #for m in range(8) [
      #let x=19pt+m*42pt
      #let y=14pt+k*29pt
      #b(x,y,25pt,21pt,"PLB")
    ]
  ]
  #t(6pt,162pt,"二维可编程逻辑块阵列 / 外围I/O")
])
#let routing()=html.frame(block(width:388pt,height:157pt)[
  #for k in range(4) [
    #let x=26pt+k*91pt
    #b(x,14pt,53pt,40pt,"PLB")
    #b(x,102pt,53pt,40pt,"PLB")
    #w(x+28pt,54pt,x+28pt,102pt)
  ]
  #for k in range(3) [
    #let y=65pt+k*13pt
    #w(8pt,y,380pt,y)
  ]
  #t(17pt,150pt,"连接区 / 交换矩阵 / 纵横布线轨")
])
#let lut3()=html.frame(block(width:388pt,height:168pt)[
  #b(11pt,12pt,83pt,139pt,"8位SRAM真值表")
  #for k in range(7) [
    #let x=98pt+k*37pt
    #b(x,48pt,30pt,27pt,"MUX")
    #if (k < 6) { w(x+30pt,61pt,x+37pt,61pt) }
  ]
  #b(303pt,111pt,63pt,34pt,"D FF")
  #w(291pt,61pt,335pt,61pt)
  #w(335pt,61pt,335pt,111pt)
  #t(107pt,13pt,"A/B/C")
  #t(306pt,151pt,"OUT / CLK")
])
#let fpga-io()=html.frame(block(width:388pt,height:156pt)[
  #t(8pt,30pt,"片内输入")
  #b(94pt,18pt,67pt,34pt,"输入缓冲")
  #b(184pt,18pt,67pt,34pt,"D触发器")
  #b(271pt,18pt,81pt,34pt,"MUX")
  #w(161pt,35pt,184pt,35pt)
  #w(251pt,35pt,271pt,35pt)
  #t(8pt,104pt,"片内输出")
  #b(94pt,89pt,102pt,34pt,"三态输出缓冲")
  #w(196pt,105pt,343pt,105pt)
  #t(346pt,98pt,"引脚")
  #t(108pt,137pt,"OE控制高阻态")
])
#let figure9(n)={
  if n==3 or n==5 {cam-cell()}
  else if n==4 {cam-bank()}
  else if n==6 {fpga-grid()}
  else if n==7 or n==10 {routing()}
  else if n==8 or n==9 {lut3()}
  else if n==11 {fpga-io()}
  else {cam()}
}

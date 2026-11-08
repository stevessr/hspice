// PDF397–404 / printed 378–385. Editable topology and timing abstractions.
// Figures are conceptual vectors, NOT original measurement points or 1:1 geometries.
#import "ch7-domino-continuation-native.typ": w,t,b,r,inv,cap,gnd
#let wave(y,skew:0pt)={
 w(41pt,y+16pt,102pt+skew,y+16pt)
 w(102pt+skew,y+16pt,102pt+skew,y)
 w(102pt+skew,y,196pt+skew,y)
 w(196pt+skew,y,196pt+skew,y+16pt)
 w(196pt+skew,y+16pt,311pt,y+16pt)
}
#let fig1116()=html.frame(block(width:388pt,height:116pt)[
 #t(7pt,2pt,"CLK：偏斜与时钟等待")
 #wave(35pt)
 #wave(79pt,skew:14pt)
 #t(5pt,30pt,"源时钟")
 #t(5pt,77pt,"远端时钟")
 #t(326pt,48pt,"skew")
])
#let fig1117()=html.frame(block(width:388pt,height:157pt)[
 #t(10pt,3pt,"周期抖动：绝对与相对时刻偏移")
 #for i in range(3) [
  #let y=23pt+i*45pt
  #let dx=if i==0 {0pt} else if i==1 {9pt} else {-7pt}
  #w(21pt,y+19pt,71pt+dx,y+19pt)
  #w(71pt+dx,y+19pt,71pt+dx,y)
  #w(71pt+dx,y,118pt+dx,y)
  #w(118pt+dx,y,118pt+dx,y+19pt)
  #w(118pt+dx,y+19pt,166pt+dx,y+19pt)
  #w(166pt+dx,y+19pt,166pt+dx,y)
  #w(166pt+dx,y,214pt+dx,y)
  #w(214pt+dx,y,214pt+dx,y+19pt)
  #w(214pt+dx,y+19pt,360pt,y+19pt)
  #t(263pt,y+2pt,("理想","绝对抖动","相对抖动").at(i))
 ]
])
#let fig1118()=html.frame(block(width:388pt,height:145pt)[
 #w(22pt,126pt,372pt,126pt)
 #w(22pt,126pt,22pt,12pt)
 #t(5pt,3pt,"概率")
 #t(322pt,133pt,"时间偏移")
 #w(38pt,120pt,73pt,111pt)
 #w(73pt,111pt,107pt,87pt)
 #w(107pt,87pt,143pt,42pt)
 #w(143pt,42pt,174pt,16pt)
 #w(174pt,16pt,202pt,16pt)
 #w(202pt,16pt,237pt,42pt)
 #w(237pt,42pt,272pt,87pt)
 #w(272pt,87pt,305pt,111pt)
 #w(305pt,111pt,355pt,120pt)
 #t(148pt,136pt,"RMS=σ；峰峰值因应用目标")
])
#let fig1119()=html.frame(block(width:388pt,height:145pt)[
 #t(8pt,5pt,"时钟偏斜在不同触发器间的局部差异")
 #b(153pt,18pt,82pt,23pt,"时钟源")
 #for k in range(3) [
  #let x=31pt+k*123pt
  #w(193pt,41pt,x+21pt,89pt)
  #b(x,90pt,52pt,27pt,"FF")
  #t(x+9pt,121pt,("小","大","零").at(k)+"偏斜")
 ]
])
#let fig1120()=html.frame(block(width:388pt,height:145pt)[
 #b(8pt,46pt,58pt,42pt,"发射 FF")
 #b(314pt,46pt,67pt,42pt,"捕获 FF")
 #w(66pt,67pt,130pt,67pt)
 #b(130pt,46pt,105pt,42pt,"组合路径")
 #w(235pt,67pt,314pt,67pt)
 #t(9pt,7pt,"Tclk-q + TDmax + Tsetup + Tskew")
 #t(9pt,115pt,"Tcycle：下一个时钟沿之前须满足建立时间")
])
#let fig1121()=html.frame(block(width:388pt,height:130pt)[
 #b(14pt,46pt,73pt,43pt,"源 FF")
 #b(304pt,46pt,70pt,43pt,"目的 FF")
 #w(87pt,67pt,304pt,67pt)
 #t(107pt,44pt,"TDmin")
 #t(9pt,6pt,"保持约束：新数据不能在捕获沿后过早到达")
 #t(9pt,109pt,"Tskew + Thold < Tclk-q + TDmin")
])
#let fig1122()=html.frame(block(width:388pt,height:152pt)[
 #t(6pt,4pt,"两种噪声：时钟沿扰动 / 数据输入毛刺")
 #b(132pt,38pt,82pt,46pt,"D FF")
 #w(21pt,49pt,132pt,49pt)
 #w(21pt,103pt,173pt,103pt)
 #w(173pt,103pt,173pt,84pt)
 #t(16pt,36pt,"D：毛刺")
 #t(16pt,109pt,"Clk：噪声")
 #w(243pt,61pt,363pt,61pt)
 #t(269pt,44pt,"错误采样")
])
#let fig1123()=html.frame(block(width:388pt,height:146pt)[
 #t(6pt,4pt,"时钟线与噪声源间的隔离：间距 / 屏蔽")
 #for j in range(2) [
  #let y=32pt+j*76pt
  #b(17pt,y,57pt,22pt,"B")
  #b(309pt,y,58pt,22pt,"Clk")
  #w(74pt,y+11pt,309pt,y+11pt)
  #if j==1 {
   w(74pt,y - 10pt,309pt,y - 10pt)
   t(157pt,y - 23pt,"VDD/GND屏蔽线")
  }
 ]
])
#let fig1124()=html.frame(block(width:388pt,height:124pt)[
 #t(5pt,3pt,"门控时钟的使能逻辑")
 #b(27pt,48pt,71pt,29pt,"AND")
 #w(98pt,62pt,206pt,62pt)
 #for i in range(3) [
  #let x=207pt+i*57pt
  #b(x,48pt,43pt,29pt,"FF")
  #if i < 2 {w(x+43pt,62pt,x+57pt,62pt)}
 ]
 #t(11pt,32pt,"Clk")
 #t(11pt,91pt,"Enable")
 #t(145pt,102pt,"实际需要无毛刺门控单元")
])
#let fig1125()=html.frame(block(width:388pt,height:125pt)[
 #t(8pt,3pt,"奇数级反相器构成闭合环")
 #for i in range(5) [
  #let x=26pt+i*65pt
  #inv(x,55pt)
  #if i < 4 { w(x+26pt,55pt,x+65pt,55pt) }
 ]
 #w(25pt,55pt,25pt,99pt)
 #w(25pt,99pt,312pt,99pt)
 #w(312pt,99pt,312pt,55pt)
 #t(97pt,112pt,"环振频率由门延迟与级数决定")
])
#let fig1126()=html.frame(block(width:388pt,height:156pt)[
 #t(7pt,3pt,"传输门延迟的互补时钟发生器")
 #b(12pt,42pt,63pt,35pt,"反相器")
 #w(75pt,59pt,105pt,59pt)
 #b(105pt,42pt,80pt,35pt,"TG/延迟")
 #w(185pt,59pt,224pt,59pt)
 #b(224pt,42pt,63pt,35pt,"反相器")
 #w(287pt,59pt,360pt,59pt)
 #t(310pt,39pt,"CLK")
 #w(146pt,77pt,146pt,107pt)
 #b(111pt,107pt,76pt,23pt,"Cint")
 #t(16pt,136pt,"原书晶体管级连线未通过1:1拓扑校验")
])
#let fig1127()=html.frame(block(width:388pt,height:143pt)[
 #t(7pt,3pt,"基于交叉耦合SR锁存器的相位发生")
 #b(104pt,38pt,69pt,35pt,"NOR")
 #b(237pt,38pt,69pt,35pt,"NOR")
 #w(173pt,54pt,237pt,54pt)
 #w(104pt,69pt,104pt,104pt)
 #w(104pt,104pt,306pt,104pt)
 #w(306pt,104pt,306pt,69pt)
 #t(316pt,43pt,"CLK")
 #t(316pt,67pt,"反相CLK")
])
#let fig1128()=html.frame(block(width:388pt,height:144pt)[
 #t(6pt,3pt,"H 树与 X 树：对称时钟分布")
 #w(95pt,25pt,95pt,116pt)
 #w(36pt,70pt,154pt,70pt)
 #w(36pt,36pt,36pt,104pt)
 #w(154pt,36pt,154pt,104pt)
 #t(83pt,119pt,"H树")
 #w(236pt,29pt,357pt,117pt)
 #w(357pt,29pt,236pt,117pt)
 #w(296pt,25pt,296pt,120pt)
 #w(234pt,72pt,358pt,72pt)
 #t(277pt,124pt,"X树")
])

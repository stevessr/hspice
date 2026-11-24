// Chapter11 exercises source PDF416–418 / printed 397–399.
// All figures editable, but original terminal wiring and page positions remain
// unverified; treat as topological study schematics.
#import "ch7-domino-continuation-native.typ": w,t,r,b,inv,cap,gnd

#let figP112()=html.frame(block(width:388pt,height:157pt)[
  #t(5pt,3pt,"P11.2：400 μm 电源总线、电感 L=2 nH、32 个反相器")
  #b(10pt,47pt,43pt,32pt,"VDD")
  #b(68pt,47pt,41pt,32pt,"L")
  #w(53pt,63pt,68pt,63pt)
  #w(109pt,63pt,365pt,63pt)
  #t(196pt,46pt,"400 μm")
  #for i in range(4) [
   #let x=151pt+i*65pt
   #w(x,63pt,x,88pt)
   #b(x - 18pt,88pt,39pt,24pt,"INV")
   #w(x,112pt,x,129pt)
   #gnd(x,129pt)
  ]
  #t(7pt,144pt,"第5层金属54 mΩ/□；W=0.4 μm；16个同时翻转")
])
#let figP113()=html.frame(block(width:388pt,height:140pt)[
  #t(5pt,2pt,"P11.3：地弹，32个输出级，31个同时翻转")
  #w(16pt,48pt,368pt,48pt)
  #for i in range(4) [
   #let x=43pt+i*93pt
   #b(x - 19pt,58pt,43pt,22pt,"驱动")
   #w(x,48pt,x,58pt)
   #w(x,80pt,x,98pt)
   #b(x - 17pt,98pt,35pt,17pt,"10nH")
   #w(x,115pt,x,123pt)
   #cap(x - 7pt,123pt)
  ]
  #t(12pt,132pt,"C_L=50 pF，VDD=1.8 V，放电时间1.8 ns")
])
#let figP114()=html.frame(block(width:388pt,height:145pt)[
  #t(4pt,2pt,"P11.4：Phi1/Phi2 双相非交叠锁存器")
  #b(10pt,48pt,66pt,43pt,"锁存器")
  #b(98pt,39pt,92pt,63pt,"CL1\ntd=1..10ns")
  #b(211pt,48pt,66pt,43pt,"锁存器")
  #b(299pt,39pt,79pt,63pt,"CL2\ntd=2..15ns")
  #w(76pt,70pt,98pt,70pt)
  #w(190pt,70pt,211pt,70pt)
  #w(277pt,70pt,299pt,70pt)
  #t(16pt,103pt,"Phi1")
  #t(216pt,103pt,"Phi2")
  #w(343pt,102pt,343pt,126pt)
  #w(343pt,126pt,44pt,126pt)
  #w(44pt,126pt,44pt,91pt)
])
#let figP116()=html.frame(block(width:388pt,height:201pt)[
  #t(4pt,2pt,"P11.6：双边沿触发器与组合逻辑的延迟路径")
  #b(14pt,47pt,66pt,48pt,"DFF A")
  #b(14pt,133pt,66pt,48pt,"DFF B")
  #b(152pt,30pt,145pt,151pt,"CL")
  #w(80pt,70pt,152pt,70pt)
  #w(80pt,156pt,152pt,156pt)
  #w(297pt,70pt,360pt,70pt)
  #w(297pt,156pt,360pt,156pt)
  #w(111pt,70pt,313pt,70pt)
  #w(111pt,156pt,313pt,156pt)
  #t(208pt,59pt,"4 ns")
  #t(208pt,144pt,"4 ns")
  #t(212pt,95pt,"6 ns ↘")
  #t(213pt,124pt,"5 ns ↗")
  #t(4pt,186pt,"t_setup=0.4ns；t_clk-q=0.3ns；t_hold=0.1ns；偏斜0.6ns")
])
#let figP117()=html.frame(block(width:388pt,height:135pt)[
  #t(4pt,3pt,"P11.7：利用 MOS 电容 W×L 的去耦及反相器")
  #w(23pt,31pt,345pt,31pt)
  #t(156pt,15pt,"VDD 初值1.8V")
  #cap(56pt,55pt)
  #w(63pt,31pt,63pt,55pt)
  #w(63pt,60pt,63pt,88pt)
  #gnd(63pt,89pt)
  #t(25pt,101pt,"MOS 去耦 W、L")
  #inv(194pt,69pt)
  #w(123pt,69pt,194pt,69pt)
  #w(219pt,69pt,317pt,69pt)
  #t(281pt,55pt,"Vout")
  #w(207pt,31pt,207pt,51pt)
  #gnd(207pt,96pt)
  #t(4pt,118pt,"改变 W/L 且 W×L 常数：比较 VDD 下垂")
])

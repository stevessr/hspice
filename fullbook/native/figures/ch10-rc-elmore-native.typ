// PDF357–364 source-guided native RC ladder and buffer figures.
// Editable schematics, but original physical placement not strictly accepted.
#import "ch7-domino-continuation-native.typ": w,t,b,inv,cap,gnd
#let ladder(n:5)=html.frame(block(width:388pt,height:134pt)[
  #t(7pt,10pt,"输入")
  #w(42pt,53pt,56pt,53pt)
  #for i in range(n) [
    #let x=58pt+i*59pt
    #b(x,42pt,37pt,22pt,"R")
    #w(x+37pt,53pt,x+55pt,53pt)
    #w(x+46pt,53pt,x+46pt,87pt)
    #cap(x+38pt,87pt)
    #gnd(x+46pt,109pt)
  ]
  #t(354pt,49pt,"输出")
])
#let characteristic()=html.frame(block(width:388pt,height:151pt)[
  #w(33pt,119pt,371pt,119pt)
  #w(33pt,119pt,33pt,9pt)
  #t(10pt,7pt,"V/VDD")
  #t(362pt,128pt,"t/RC")
  #for i in range(5) [
    #let x=45pt+i*63pt
    #let y=110pt-i*17pt
    #w(x,y,x+57pt,y-13pt)
  ]
  #t(145pt,23pt,"一阶/分布RC瞬态近似")
])
#let elmore()=html.frame(block(width:388pt,height:148pt)[
  #t(5pt,7pt,"电源")
  #w(39pt,59pt,58pt,59pt)
  #for i in range(3) [
    #let x=66pt+i*92pt
    #b(x,49pt,55pt,21pt,"R"+str(i+1))
    #w(x+55pt,59pt,x+81pt,59pt)
    #w(x+72pt,59pt,x+72pt,93pt)
    #cap(x+64pt,92pt)
    #gnd(x+72pt,110pt)
    #t(x+65pt,122pt,"C"+str(i+1))
  ]
  #t(354pt,55pt,"OUT")
])
#let branched()=html.frame(block(width:388pt,height:151pt)[
  #t(5pt,59pt,"IN")
  #b(45pt,57pt,57pt,23pt,"R1")
  #w(102pt,68pt,165pt,68pt)
  #w(165pt,68pt,165pt,20pt)
  #w(165pt,68pt,165pt,118pt)
  #b(184pt,18pt,63pt,25pt,"R3")
  #b(184pt,107pt,63pt,25pt,"R2")
  #w(165pt,31pt,184pt,31pt)
  #w(165pt,119pt,184pt,119pt)
  #t(266pt,21pt,"节点3 / C3")
  #t(266pt,113pt,"节点2 / C2")
  #t(113pt,81pt,"节点1 / C1")
])
#let driven-wire()=html.frame(block(width:388pt,height:143pt)[
  #inv(6pt,53pt)
  #w(32pt,53pt,45pt,53pt)
  #for i in range(5) [
    #let x=45pt+i*63pt
    #b(x,42pt,39pt,22pt,"Rw")
    #w(x+39pt,53pt,x+62pt,53pt)
    #w(x+49pt,53pt,x+49pt,88pt)
    #cap(x+41pt,88pt)
    #gnd(x+49pt,110pt)
  ]
  #t(348pt,45pt,"OUT")
  #t(129pt,128pt,"Cw × n：均匀分布 RC")
])
#let models()=html.frame(block(width:388pt,height:140pt)[
  #for k in range(3) [
    #let x=8pt+128pt*k
    #t(x+8pt,4pt,("L型","π型","T型").at(k))
    #b(x+20pt,32pt,74pt,23pt,"Rwire")
    #w(x+57pt,55pt,x+57pt,75pt)
    #cap(x+49pt,75pt)
    #gnd(x+57pt,96pt)
    #t(x+8pt,113pt,("Cwire","C/2, C/2","R/2, R/2").at(k))
  ]
])
#let fanout()=html.frame(block(width:388pt,height:147pt)[
  #t(5pt,27pt,"In")
  #inv(25pt,51pt)
  #w(51pt,51pt,184pt,51pt)
  #t(84pt,35pt,"20 μm 导线")
  #for k in range(4) [
    #let y=4pt+k*35pt
    #w(184pt,51pt,234pt,y+12pt)
    #inv(234pt,y+12pt)
    #t(276pt,y+5pt,("a","b","c","d").at(k))
  ]
  #t(12pt,138pt,"四个相同反相器负载")
])
#let length-trends()=html.frame(block(width:388pt,height:165pt)[
  #w(46pt,136pt,366pt,136pt)
  #w(46pt,136pt,46pt,13pt)
  #t(13pt,5pt,"延迟")
  #t(354pt,147pt,"长度L")
  #for k in range(4) [
    #let off=8pt+k*21pt
    #w(54pt,125pt,145pt,115pt-off/3)
    #w(145pt,115pt-off/3,263pt,64pt-off)
    #w(263pt,64pt-off,335pt,21pt)
  ]
  #t(120pt,146pt,"四个工艺条件的定性曲线")
])
#let inserted-buffers()=html.frame(block(width:388pt,height:167pt)[
  #t(5pt,4pt,"(a) L/N 段长的N级缓冲链")
  #for k in range(4) [
    #let x=25pt+k*87pt
    #inv(x,45pt)
    #w(x+26pt,45pt,x+86pt,45pt)
  ]
  #t(5pt,93pt,"(b) 单级 π 型RC等效")
  #inv(24pt,120pt)
  #b(88pt,110pt,65pt,22pt,"Rwire/N")
  #w(50pt,121pt,88pt,121pt)
  #w(153pt,121pt,337pt,121pt)
  #for k in range(2) [
    #let x=173pt+k*109pt
    #w(x,121pt,x,140pt)
    #cap(x-8pt,140pt)
  ]
])
#let figure10more(n)={
  if n==4 {ladder(n:5)}
  else if n==5 {characteristic()}
  else if n==6 {elmore()}
  else if n==7 {driven-wire()}
  else if n==8 {models()}
  else if n==9 {length-trends()}
  else if n==10 {inserted-buffers()}
  else {branched()}
}
#let fig-example102()=fanout()
#let fig-example101()=branched()

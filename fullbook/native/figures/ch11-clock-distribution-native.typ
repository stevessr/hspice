// Source PDF405–406, printed pp.386–387: Figures 11.29–11.31.
// All vectors are native editable topology studies. Not source-image 1:1 replicas.
#import "ch7-domino-continuation-native.typ": w,t,r,b,inv

#let fig1129()=grid(columns:(1fr,1fr,1fr),column-gutter:3pt,
 [#html.frame(block(width:132pt,height:111pt)[
  #t(4pt,2pt,"(a) 分支线宽渐减")
  #w(5pt,53pt,43pt,53pt)
  #w(43pt,53pt,58pt,53pt)
  #w(58pt,26pt,58pt,84pt)
  #w(58pt,26pt,91pt,26pt)
  #w(58pt,84pt,91pt,84pt)
  #w(91pt,12pt,91pt,39pt)
  #w(91pt,70pt,91pt,97pt)
  #w(91pt,12pt,120pt,12pt)
  #w(91pt,39pt,120pt,39pt)
  #w(91pt,70pt,120pt,70pt)
  #w(91pt,97pt,120pt,97pt)
  #t(6pt,96pt,"Z 支路匹配")
 ])],
 [#html.frame(block(width:132pt,height:111pt)[
  #t(4pt,2pt,"(b) 宽总线")
  #r(10pt,29pt,105pt,16pt)
  #w(29pt,45pt,29pt,84pt)
  #w(52pt,45pt,52pt,84pt)
  #w(76pt,45pt,76pt,84pt)
  #w(101pt,45pt,101pt,84pt)
  #t(6pt,95pt,"低 R、大 C")
 ])],
 [#html.frame(block(width:132pt,height:111pt)[
  #t(4pt,2pt,"(c) 胖总线")
  #r(11pt,27pt,110pt,37pt)
  #w(26pt,64pt,26pt,85pt)
  #w(52pt,64pt,52pt,85pt)
  #w(80pt,64pt,80pt,85pt)
  #w(108pt,64pt,108pt,85pt)
  #t(4pt,95pt,"大驱动器 / 宽干线")
 ])]
)

#let fig1130()=grid(columns:(1fr,1fr,1fr),column-gutter:3pt,
 [#html.frame(block(width:132pt,height:146pt)[
  #t(2pt,2pt,"(a) 渐增尺寸")
  #b(3pt,48pt,25pt,18pt,"B")
  #w(28pt,57pt,42pt,57pt)
  #b(42pt,43pt,35pt,28pt,"B")
  #w(77pt,57pt,91pt,57pt)
  #b(91pt,35pt,36pt,44pt,"B")
  #w(109pt,79pt,109pt,107pt)
  #w(94pt,107pt,122pt,107pt)
  #t(4pt,128pt,"沿主路径逐级放大")
 ])],
 [#html.frame(block(width:132pt,height:146pt)[
  #t(2pt,2pt,"(b) 统一缓冲尺寸")
  #b(4pt,40pt,26pt,22pt,"B")
  #w(30pt,51pt,47pt,51pt)
  #w(47pt,26pt,47pt,83pt)
  #b(58pt,18pt,34pt,22pt,"B")
  #b(58pt,72pt,34pt,22pt,"B")
  #w(47pt,29pt,58pt,29pt)
  #w(47pt,83pt,58pt,83pt)
  #w(92pt,29pt,121pt,29pt)
  #w(92pt,83pt,121pt,83pt)
  #t(4pt,128pt,"各分支使用相同尺寸")
 ])],
 [#html.frame(block(width:132pt,height:146pt)[
  #t(2pt,2pt,"(c) 末级增大")
  #b(4pt,39pt,25pt,20pt,"B")
  #w(29pt,49pt,44pt,49pt)
  #w(44pt,24pt,44pt,85pt)
  #b(58pt,11pt,42pt,36pt,"B")
  #b(58pt,68pt,42pt,36pt,"B")
  #w(44pt,29pt,58pt,29pt)
  #w(44pt,85pt,58pt,85pt)
  #w(100pt,29pt,122pt,29pt)
  #w(100pt,85pt,122pt,85pt)
  #t(4pt,128pt,"靠近负载时增加宽度")
 ])]
)

#let fig1131()=grid(columns:(1fr,1fr),column-gutter:7pt,
 [#html.frame(block(width:195pt,height:148pt)[
  #t(3pt,1pt,"(a) 同时产生正相与反相时钟")
  #b(74pt,21pt,44pt,23pt,"根")
  #w(96pt,44pt,96pt,62pt)
  #w(48pt,62pt,146pt,62pt)
  #w(48pt,62pt,48pt,77pt)
  #w(146pt,62pt,146pt,77pt)
  #b(28pt,77pt,44pt,20pt,"BUF")
  #b(126pt,77pt,44pt,20pt,"INV")
  #w(50pt,97pt,50pt,120pt)
  #w(148pt,97pt,148pt,120pt)
  #t(6pt,126pt,"CLK")
  #t(115pt,126pt,"反相 CLK")
 ])],
 [#html.frame(block(width:195pt,height:148pt)[
  #t(3pt,1pt,"(b) 普通时钟与门控时钟")
  #b(78pt,20pt,44pt,22pt,"根")
  #w(100pt,42pt,100pt,56pt)
  #w(35pt,56pt,162pt,56pt)
  #w(35pt,56pt,35pt,74pt)
  #w(162pt,56pt,162pt,74pt)
  #b(16pt,74pt,49pt,25pt,"BUF")
  #b(131pt,74pt,56pt,25pt,"AND")
  #w(40pt,99pt,40pt,116pt)
  #w(160pt,99pt,160pt,116pt)
  #t(2pt,120pt,"标准 CLK")
  #t(110pt,120pt,"门控 CLK")
  #t(113pt,135pt,"门控端由 EN 控制")
 ])]
)

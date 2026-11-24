// Source PDF407–408 / printed pp.388–389. Editable interpretive vectors.
// Fig 11.32 and 11.34 are industrial-chip layouts in the source; these sketches
// preserve only semantic blocks and highlighted EM regions, not measured routing.
#import "ch7-domino-continuation-native.typ": w,t,r,b,inv
#let fig1132()=html.frame(block(width:388pt,height:218pt)[
  #r(8pt,8pt,370pt,198pt)
  #b(17pt,24pt,63pt,165pt,"存储器")
  #b(122pt,24pt,105pt,160pt,"数据路径")
  #b(256pt,24pt,92pt,160pt,"局部时钟区")
  #b(164pt,187pt,77pt,18pt,"根节点")
  #w(203pt,187pt,203pt,175pt)
  #w(82pt,175pt,342pt,175pt)
  #w(82pt,175pt,82pt,107pt)
  #w(116pt,175pt,116pt,40pt)
  #w(240pt,175pt,240pt,38pt)
  #w(348pt,175pt,348pt,63pt)
  #w(82pt,107pt,107pt,107pt)
  #w(240pt,38pt,266pt,38pt)
  #t(128pt,60pt,"时钟主干线")
  #t(259pt,90pt,"密集分支")
  #t(9pt,2pt,"布局语义示意（非实际工业芯片走线）")
])
#let fig1133()=html.frame(block(width:388pt,height:142pt)[
  #t(9pt,5pt,"金属信号线中的直流与交流 EM 约束")
  #b(12pt,36pt,96pt,69pt,"CMOS 输出级")
  #r(108pt,53pt,31pt,33pt)
  #w(139pt,70pt,203pt,70pt)
  #r(203pt,61pt,154pt,19pt)
  #t(148pt,50pt,"单向短金属段")
  #t(205pt,85pt,"长信号线：往复充放电")
  #t(104pt,102pt,"J_avg：直流判据")
  #t(230pt,102pt,"J_rms：交流判据")
  #t(105pt,125pt,"短段按式 (11.5)；信号线按式 (11.8)")
])
#let fig1134()=html.frame(block(width:388pt,height:215pt)[
  #r(15pt,10pt,356pt,192pt)
  #t(21pt,12pt,"时钟分支与 EM 失效区域：结构示意")
  #w(33pt,172pt,344pt,172pt)
  #w(124pt,172pt,124pt,45pt)
  #w(221pt,172pt,221pt,52pt)
  #w(301pt,172pt,301pt,37pt)
  #w(55pt,60pt,300pt,60pt)
  #w(55pt,119pt,296pt,119pt)
  #for i in range(6) [
    #let x=56pt+i*43pt
    #w(x,60pt,x,119pt)
  ]
  #b(105pt,92pt,77pt,28pt,"EM 失效区A")
  #b(245pt,36pt,82pt,28pt,"EM 失效区B")
  #t(35pt,188pt,"实际失效区域应由源版图与电流密度计算确定")
])

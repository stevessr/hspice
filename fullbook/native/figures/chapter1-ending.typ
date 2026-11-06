// Native Typst figures for textbook source PDF pages 42–46.
// Simplified editable geometry. Not accepted as exact source-image replicas.

#let design-gap() = html.frame(block(width: 348pt,height: 177pt)[
  #place(top + left,dx: 32pt,dy: 13pt,line(end:(0pt,138pt),stroke:.8pt))
  #place(top + left,dx: 32pt,dy: 151pt,line(length:278pt,stroke:.8pt))
  #place(top + left,dx: 4pt,dy: 3pt,text(size:8pt)[对数规模])
  #place(top + left,dx: 43pt,dy: 154pt,text(size:7pt)[1980])
  #place(top + left,dx: 145pt,dy: 154pt,text(size:7pt)[1995])
  #place(top + left,dx: 258pt,dy: 154pt,text(size:7pt)[2010])
  #place(top + left,dx: 32pt,dy: 137pt,
    curve(stroke:1.2pt,curve.move((0pt,0pt)),curve.line((72pt,-39pt)),
      curve.line((143pt,-80pt)),curve.line((277pt,-132pt)))))
  #place(top + left,dx: 32pt,dy: 145pt,
    curve(stroke:(dash:"dashed",thickness:1.2pt),curve.move((0pt,0pt)),
      curve.line((72pt,-13pt)),curve.line((143pt,-29pt)),curve.line((277pt,-57pt)))))
  #place(top + left,dx: 197pt,dy: 20pt,text(size:7.8pt)[可用晶体管数量])
  #place(top + left,dx: 193pt,dy: 91pt,text(size:7.8pt)[设计生产力])
  #place(top + left,dx: 75pt,dy: 44pt,text(size:7.7pt)[设计生产力差距])
  #place(top + left,dx: 12pt,dy: 165pt,text(size:7pt)[仅用于说明变化率差距；具体坐标和数据点仍需对照图1.22核对])
])

#let soc-concept() = html.frame(block(width: 348pt,height: 178pt)[
  #place(top + left,dx: 39pt,dy: 9pt,text(size:8pt)[系统级功能划分])
  #place(top + left,dx: 19pt,dy: 31pt,rect(width:105pt,height:110pt,stroke:1pt,fill:rgb("f5f5f5")))
  #place(top + left,dx: 33pt,dy: 41pt,rect(width:77pt,height:33pt,stroke:.8pt))
  #place(top + left,dx: 39pt,dy: 51pt,text(size:8pt)[处理器 IP])
  #place(top + left,dx: 33pt,dy: 89pt,rect(width:77pt,height:39pt,stroke:.8pt))
  #place(top + left,dx: 42pt,dy: 102pt,text(size:8pt)[外设 IP])
  #place(top + left,dx: 124pt,dy: 77pt,line(length:83pt,stroke:.9pt))
  #place(top + left,dx: 151pt,dy: 59pt,text(size:8pt)[系统集成])
  #place(top + left,dx: 207pt,dy: 28pt,rect(width:122pt,height:118pt,stroke:1pt))
  #place(top + left,dx: 216pt,dy: 37pt,rect(width:51pt,height:38pt,stroke:.7pt,fill:rgb("ececec")))
  #place(top + left,dx: 222pt,dy: 49pt,text(size:7pt)[CPU])
  #place(top + left,dx: 270pt,dy: 37pt,rect(width:48pt,height:38pt,stroke:.7pt))
  #place(top + left,dx: 276pt,dy: 49pt,text(size:7pt)[RAM])
  #place(top + left,dx: 216pt,dy: 79pt,rect(width:51pt,height:57pt,stroke:.7pt))
  #place(top + left,dx: 223pt,dy: 101pt,text(size:7pt)[DSP])
  #place(top + left,dx: 270pt,dy: 79pt,rect(width:48pt,height:57pt,stroke:.7pt))
  #place(top + left,dx: 272pt,dy: 101pt,text(size:7pt)[I/O])
  #place(top + left,dx: 237pt,dy: 153pt,text(size:8pt)[SoC 芯片平面示意])
])

#let soc-blocks() = html.frame(block(width: 350pt,height: 178pt)[
  #place(top + left,dx: 42pt,dy: 7pt,rect(width:258pt,height:148pt,stroke:1pt,fill:rgb("eeeeee")))
  #place(top + left,dx: 50pt,dy: 15pt,rect(width:104pt,height:77pt,stroke:.8pt,fill:white))
  #place(top + left,dx: 75pt,dy: 43pt,text(size:9pt)[MCU])
  #place(top + left,dx: 159pt,dy: 15pt,rect(width:132pt,height:35pt,stroke:.8pt,fill:white))
  #place(top + left,dx: 198pt,dy: 25pt,text(size:9pt)[ROM])
  #place(top + left,dx: 159pt,dy: 54pt,rect(width:132pt,height:38pt,stroke:.8pt,fill:white))
  #place(top + left,dx: 198pt,dy: 67pt,text(size:9pt)[DSP])
  #place(top + left,dx: 50pt,dy: 97pt,rect(width:104pt,height:50pt,stroke:.8pt,fill:white))
  #place(top + left,dx: 75pt,dy: 112pt,text(size:9pt)[I/O])
  #place(top + left,dx: 159pt,dy: 97pt,rect(width:132pt,height:50pt,stroke:.8pt,fill:white))
  #place(top + left,dx: 198pt,dy: 111pt,text(size:9pt)[RAM])
  #place(top + left,dx: 56pt,dy: 160pt,text(size:7pt)[图1.24原件是芯片显微照片，此处为可编辑的功能分区示意])
])

#let inverter-chain() = html.frame(block(width:350pt,height:143pt)[
  #place(top + left,dx: 10pt,dy: 7pt,text(size:8pt)[(a) 五级串联反相器])
  #for i in range(5) [
    #place(top + left,dx: 32pt + i * 61pt,dy: 31pt,
      curve(stroke:.9pt,fill:white,curve.move((0pt,0pt)),
        curve.line((0pt,28pt)),curve.line((37pt,14pt)),
        curve.close(mode:"straight")))
    #place(top + left,dx: 69pt + i * 61pt,dy: 42pt,circle(radius:3pt,stroke:.8pt,fill:white))
    #if i < 4 [
      #place(top + left,dx: 75pt + i * 61pt,dy: 45pt,line(length:55pt,stroke:.8pt))
    ]
  ]
  #place(top + left,dx: 15pt,dy: 40pt,text(size:8pt)[$a$]))
  #place(top + left,dx: 337pt,dy: 40pt,text(size:8pt)[$b$]))
  #place(top + left,dx: 25pt,dy: 90pt,line(length:286pt,stroke:.85pt))
  #place(top + left,dx: 25pt,dy: 71pt,line(end:(0pt,19pt),stroke:.85pt))
  #place(top + left,dx: 311pt,dy: 62pt,line(end:(0pt,28pt),stroke:.85pt))
  #place(top + left,dx: 50pt,dy: 109pt,text(size:8pt)[(b) 输出返回输入形成奇数级反相环])
])

#let rc-step() = html.frame(block(width:348pt,height:143pt)[
  #place(top + left,dx: 16pt,dy: 6pt,text(size:8pt)[1.2 V 阶跃输入])
  #place(top + left,dx: 19pt,dy: 65pt,circle(radius:17pt,stroke:.9pt,fill:white))
  #place(top + left,dx: 21pt,dy: 59pt,text(size:9pt)[$V$]))
  #place(top + left,dx: 19pt,dy: 48pt,line(end:(0pt,-28pt),stroke:.9pt))
  #place(top + left,dx: 19pt,dy: 20pt,line(length:95pt,stroke:.9pt))
  #place(top + left,dx: 114pt,dy: 12pt,rect(width:39pt,height:16pt,stroke:.9pt))
  #place(top + left,dx: 118pt,dy: 0pt,text(size:8pt)[12.5 kΩ])
  #place(top + left,dx: 153pt,dy: 20pt,line(length:45pt,stroke:.9pt))
  #place(top + left,dx: 198pt,dy: 20pt,line(end:(0pt,53pt),stroke:.9pt))
  #place(top + left,dx: 185pt,dy: 73pt,line(length:26pt,stroke:.9pt))
  #place(top + left,dx: 185pt,dy: 78pt,line(length:26pt,stroke:.9pt))
  #place(top + left,dx: 198pt,dy: 78pt,line(end:(0pt,32pt),stroke:.9pt))
  #place(top + left,dx: 18pt,dy: 82pt,line(end:(0pt,28pt),stroke:.9pt))
  #place(top + left,dx: 18pt,dy: 110pt,line(length:180pt,stroke:.9pt))
  #place(top + left,dx: 212pt,dy: 77pt,text(size:8pt)[100 fF])
  #place(top + left,dx: 236pt,dy: 42pt,text(size:8pt)[$V_C(t)$]))
  #place(top + left,dx: 221pt,dy: 122pt,text(size:7pt)[$tau=R C=1.25 " ns"$]))
])

#let current-charge() = html.frame(block(width:350pt,height:158pt)[
  #place(top + left,dx: 151pt,dy: 10pt,line(length:62pt,stroke:.9pt))
  #place(top + left,dx: 181pt,dy: 10pt,line(end:(0pt,28pt),stroke:.9pt))
  #place(top + left,dx: 181pt,dy: 58pt,circle(radius:20pt,stroke:.95pt,fill:white))
  #place(top + left,dx: 181pt,dy: 45pt,line(end:(0pt,24pt),stroke:1pt))
  #place(top + left,dx: 181pt,dy: 78pt,line(end:(0pt,29pt),stroke:.9pt))
  #place(top + left,dx: 168pt,dy: 107pt,line(length:26pt,stroke:.9pt))
  #place(top + left,dx: 168pt,dy: 113pt,line(length:26pt,stroke:.9pt))
  #place(top + left,dx: 181pt,dy: 113pt,line(end:(0pt,22pt),stroke:.9pt))
  #place(top + left,dx: 166pt,dy: 135pt,line(length:30pt,stroke:.9pt))
  #place(top + left,dx: 171pt,dy: 140pt,line(length:20pt,stroke:.9pt))
  #place(top + left,dx: 176pt,dy: 145pt,line(length:10pt,stroke:.9pt))
  #place(top + left,dx: 205pt,dy: 56pt,text(size:9pt)[$I$]))
  #place(top + left,dx: 205pt,dy: 107pt,text(size:9pt)[$C=25 " fF"$]))
  #place(top + left,dx: 21pt,dy: 40pt,text(size:9pt)[$I = C (Delta V)/(Delta t)$]))
  #place(top + left,dx: 21pt,dy: 78pt,text(size:8pt)[$Delta V = 0.6 " V"$]))
  #place(top + left,dx: 21pt,dy: 108pt,text(size:8pt)[$Delta t = 30 " ps"$]))
])

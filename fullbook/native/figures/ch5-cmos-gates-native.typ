// Native editable study diagrams corresponding to source PDF167–176.
#let nand-nor-2() = html.frame(block(width:348pt,height:191pt)[
 #place(top + left,dx:7pt,dy:3pt,text(size:8pt)[图5.1 两输入 CMOS 或非门（NOR2）与与非门（NAND2）])
 #place(top + left,dx:16pt,dy:32pt,rect(width:145pt,height:141pt,stroke:.8pt))
 #place(top + left,dx:184pt,dy:32pt,rect(width:145pt,height:141pt,stroke:.8pt))
 #place(top + left,dx:26pt,dy:38pt,text(size:8pt)[NOR2]))
 #place(top + left,dx:193pt,dy:38pt,text(size:8pt)[NAND2]))
 #place(top + left,dx:26pt,dy:60pt,text(size:7pt)[上拉PUN：PMOS串联]))
 #place(top + left,dx:26pt,dy:91pt,text(size:7pt)[下拉PDN：NMOS并联]))
 #place(top + left,dx:194pt,dy:60pt,text(size:7pt)[上拉PUN：PMOS并联]))
 #place(top + left,dx:194pt,dy:91pt,text(size:7pt)[下拉PDN：NMOS串联]))
 #place(top + left,dx:25pt,dy:137pt,text(size:8pt)[$F=overline(A+B)$]))
 #place(top + left,dx:193pt,dy:137pt,text(size:8pt)[$F=overline(A B)$]))
 #place(top + left,dx:21pt,dy:165pt,text(size:7pt)[输入A/B改变对应晶体管的导通状态]))
])
#let gate-widths() = html.frame(block(width:350pt,height:180pt)[
 #place(top + left,dx:8pt,dy:5pt,text(size:8pt)[图5.2 二输入CMOS门的宽度比例（参考反相器为2W/W）])
 #place(top + left,dx:12pt,dy:27pt,
  table(columns:(79pt,95pt,95pt),inset:3pt,
   table.header([*结构*],[*PMOS宽度*],[*NMOS宽度*]),
   [反相器],[2W],[W],
   [NAND2],[各2W，并联],[各2W，串联],
   [NOR2],[各4W，串联],[各W，并联])))
 #place(top + left,dx:12pt,dy:145pt,text(size:7pt)[依据一条最坏导通路径的等效电阻匹配尺寸；面积不是唯一约束])
])
#let equivalent-width() = html.frame(block(width:348pt,height:130pt)[
 #place(top + left,dx:10pt,dy:5pt,text(size:8pt)[图5.4：三管串联与并联的等效宽度])
 #place(top + left,dx:13pt,dy:31pt,rect(width:136pt,height:70pt,stroke:.75pt))
 #place(top + left,dx:186pt,dy:31pt,rect(width:144pt,height:70pt,stroke:.75pt))
 #place(top + left,dx:23pt,dy:46pt,text(size:8pt)[串联：同一电流通道]))
 #place(top + left,dx:21pt,dy:74pt,text(size:7pt)[$1/W_("eq")=sum 1/W_i$]))
 #place(top + left,dx:197pt,dy:46pt,text(size:8pt)[并联：多条导通路径]))
 #place(top + left,dx:195pt,dy:74pt,text(size:7pt)[$W_("eq")=sum W_i$]))
])
#let wide-nand() = html.frame(block(width:350pt,height:165pt)[
 #place(top + left,dx:7pt,dy:5pt,text(size:8pt)[图5.5 八输入NAND8：串联堆叠与多级分解])
 #place(top + left,dx:39pt,dy:30pt,line(end:(0pt,116pt),stroke:.9pt))
 #for i in range(8) [
   #place(top + left,dx:33pt,dy:31pt + i*14pt,rect(width:13pt,height:11pt,stroke:.65pt,fill:rgb("eeeeee")))
 ]
 #place(top + left,dx:53pt,dy:37pt,text(size:7pt)[NMOS 8串联，各约8W]))
 #place(top + left,dx:53pt,dy:69pt,text(size:7pt)[PMOS 8并联，各约2W]))
 #place(top + left,dx:53pt,dy:97pt,text(size:7pt)[很大输入数造成面积及串联RC问题]))
 #place(top + left,dx:53pt,dy:123pt,text(size:7pt)[可由多个较小扇入的门实现相同逻辑功能]))
])
#let nand-vtc() = html.frame(block(width:349pt,height:181pt)[
 #place(top + left,dx:30pt,dy:152pt,line(length:302pt,stroke:.8pt))
 #place(top + left,dx:30pt,dy:152pt,line(end:(0pt,-130pt),stroke:.8pt))
 #place(top + left,dx:32pt,dy:30pt,
   curve(stroke:1.25pt,curve.move((0pt,0pt)),
         curve.cubic((128pt,0pt),(122pt,104pt),(284pt,106pt))))
 #place(top + left,dx:32pt,dy:30pt,
   curve(stroke:(dash:"dashed",thickness:1pt),curve.move((0pt,0pt)),
         curve.cubic((159pt,0pt),(146pt,103pt),(284pt,106pt))))
 #place(top + left,dx:32pt,dy:30pt,
   curve(stroke:(dash:"dotted",thickness:1pt),curve.move((0pt,0pt)),
         curve.cubic((98pt,0pt),(104pt,104pt),(284pt,106pt))))
 #place(top + left,dx:10pt,dy:23pt,text(size:7pt)[$V_("out")$]))
 #place(top + left,dx:309pt,dy:155pt,text(size:7pt)[$V_("in")$]))
 #place(top + left,dx:44pt,dy:170pt,text(size:7pt)[反相器、仅一输入变化、双输入同时变化]))
])
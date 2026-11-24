// SOURCE PDF PAGE 341. Scan-guided original Typst excerpt and editable schematics.
// Not full-page 1:1 accepted; transistor topology and page geometry provisional.
#import "../figures/ch9-nonvolatile-ch10-interconnect-native.typ": figure9late
#set document(title:"第9章·非易失存储器·PDF341")
#align(center)[#text(size:8pt,weight:"bold")[322　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

9.5.1　MOS ROM单元阵列（续）

在NAND ROM中，若某一串联路径上的晶体管在选中后全部导通，列输出就会放电；未选中的字线应通过适当电平保持串联路径导通。图9.20(b)展示这种以串联器件构成的密集阵列。NOR和NAND ROM都可以通过版图掩膜中是否连接晶体管或阈值注入来设定存储位。

从速度角度看，NOR ROM的读通路不一定需要串联大量晶体管，通常较快；NAND ROM的晶体管复用和单元面积优势则有利于密度，但读取时可能带来更大的串联电阻。掩膜ROM还需要行译码、列多路选择以及输出缓冲器。

图9.21使用一种电流模式读出结构：先由电流源与电路节点确定列电压，输入条件改变后，通过感测元件和输出反相器将列电流变化转换为逻辑输出。它与直接检测大幅位线电压的方法相比，可以减少部分位线摆幅。

#figure9late(21)
#align(center)[*图9.21　电流灵敏放大器（原生可编辑功能框图）*]

后续可编程非易失存储器保留了相似的字线/位线阵列组织，但存储状态由晶体管阈值而非有无器件决定。

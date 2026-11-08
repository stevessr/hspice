// SOURCE PDF PAGE 400; MACHINE-OCR DRAFT ONLY. NOT PROOFREAD.
// All original figures, mathematics, table structure and layout remain unverified.
#align(center)[#text(size:7.8pt,weight:"bold")[原始扫描 PDF 第400页 — 未校对机器文本]]
#set text(size:7.5pt)
#show par: set par(leading:3.4pt,spacing:3pt)
#text("HUE 电源网格和时钟设计                381")

#text("功能的正确性产生很大的影响，为了进行说明，考虑图 11.20 所示的情况、图的上面一部分给出\n三-个时序系统,包含了在两端的正边沿触发的触发器，以及触发器之间一个代表逻辑门的组合\n云块，经过辑云块有多种路径，可以用两个参数撒述: 最差情况路径延迟 Tiwx和最好情况路")

#text("径延迟Taww")

#text("Tne                                  hou")

#text("a oceal y")

#text("较量的时名                                  较量的时名\nRD)                        《下-个周期)")

#text("Tay")

#text("Ts Tes")

#text("ror")

#text("smote")

#text("办时的时名")

#text("Te\nPR 11.20 人篇斜对时钟周期时间的影响")

#text("现在考虑信人对周期时间的影响在图 11.20 +, (RR AASB RE am\n船发器较晚 当时钟到达近端角发器时,在经过Tu AER ZH RRR IRAN I Ze 也\nPRUE), SP Tak是触发器的一个属性，在第 5 章中讨论过  随后是一个经过尿辑\n的最大延迟 Taux ，在到达远端触发器时，必须满足触发器的建立时间 Te 这三个部分,，\nTax gt Tux+ Tug、在正常情况下构成周期时间 Toye\n然而、如果由于偏斜使时钟到达远端骨发器较早，可能出现图 11.20 所示的波形问题 下一\n周期的较早的时钙将到达并且从当前周期针存数据，但依照建立时间这个数据还不稳定。 这将导\n至电路中的一个功能错误。当电路不满足周期时间要求时，通常称为建立时间违例，即使是由信\n旬造成的“针对这个问题有一个简单的解决办法如果将时钟周期增加 Tu。 ，就能保证电路总是\n正常下作 “然而，其代价是周期时间比原先长了偏斜值、新的周期时间给出如下;\nTe Ta + Tax + Te + Ta               (16)")

#text("下面考虑图 11.21 Bp sa Ae BB A TS HZ. XV 195\nHUGE “HRT — eee Nt, BALE A Zk, 最快的信号路径到达第\n-个触发器的时间是 Tong + Tiwx ”如果这个时间太快. 会产生一个问题 当较晚的时钟在同一周\n期中到达第二个般发器时，将锁存输入信号 而不考虑它们是否是正确的信和号。 并且，可能不注\n意地捕获了新的 ( 不正确 ) 数据。偏斜会阻碍锁存正确的数据，为什么? 因为如果满足新数据在\n前一数据的建立时间满足之前到来 第二个触发器会错误地采样新数据而不是正确的数据。这称\n为保持时间违例，如图 11.21 Ba. 注意， 这个问题不能通过放慢时钟来解决。能够正确操作的\n准则是:")

#text("Te + Thott < Ta + Taran                   (17)")

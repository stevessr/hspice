// SOURCE PDF PAGE 338 / printed 319; scan-assisted editorial draft.
// Figures editable, original circuit-level wiring and geometry not strictly verified.
#import "../figures/ch9-dram-rom-native.typ": figure9later
#set document(title:"第9章·动态RAM与ROM·PDF338")
#align(center)[#text(size:8pt,weight:"bold")[319　数字集成电路分析与设计——深亚微米工艺（第三版）]]
#line(length:100%,stroke:.55pt)

=== 9.4.3　动态RAM的外部特性

大型DRAM需要比简单读写单元更多的内部时钟和控制相位。原书用64 Kb DRAM展示地址复用、读写以及刷新过程，从外部使用者角度说明器件行为。

#figure9later(18)
#align(center)[*图9.18　64 Kb DRAM的内部总体结构（功能重绘）*]

图9.18的64 Kb存储器分成两个半阵列，每侧具有128行、256列。地址引脚为8位，先按行地址进行锁存，再按列地址进行锁存；使用同一组外部引脚分时复用能够降低封装引脚数。

读周期开始后，行地址缓冲器产生地址原值与反值，7位地址经译码选择半阵列中的一条字线，剩余一位决定选择上半块还是下半块。所有被选中的单元在对应列产生微小电压变化，列灵敏放大器同时检测并恢复整行256位的数据。

列地址随后选定输出数据：6位列地址选出若干感测输出的一组，余下2位可以通过4选1多路器确定需要的最终数据位。写周期采用类似的行列选择结构，不过输入数据控制被选中位线和感测放大器的状态。

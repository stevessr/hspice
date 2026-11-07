# 原生 Typst 精修 · 网页预览

这里直接显示 **Typst 源码编译的 HTML**，不依赖 PDF，也不使用整页扫描图充当正文。每节都可以在浏览器中阅读并打开对应的可编辑源文件。以下仍是按原扫描校对的知识选段，不是整本教材的逐字全文重排。

<script setup lang="ts">
import { computed, ref } from 'vue'
import { withBase } from 'vitepress'

const sections = [
  { id: '01-gates-noise-delay', title: '第1章 · 逻辑门、噪声容限、延迟与功耗', pages: '扫描第26—32页', summary: '门电路、理想与实际电平、转换时间、式（1.2）—（1.5）' },
  { id: '02-mos-threshold', title: '第2章 · MOS结构、费米势和阈值', pages: '扫描第48—57页', summary: '四端器件、平带电压、耗尽区、体效应、式（2.1）—（2.12）' },
  { id: '03-page-026', title: '原书第26页 · 门电路与D触发器原生重绘', pages: 'PDF第26页/印刷第7页', summary: '图1.4、图1.5与8行DFF激励表的原生Typst草稿；版式仍需比对' },
  { id: '04-page-027', title: '原书第27页 · 理想逻辑电路与传输曲线', pages: 'PDF第27页/印刷第8页', summary: '图1.6原生可编辑曲线、五条数字逻辑基本特性；仍需版式对照' },
  { id: '05-page-028', title: '原书第28页 · 逻辑振幅与噪声容限', pages: 'PDF第28页/印刷第9页', summary: '原生重绘图1.7(a)—(d)，VTC、噪声容限及四个图示' },
  { id: '06-page-029', title: '原书第29页 · 瞬态转换及延迟', pages: 'PDF第29页/印刷第10页', summary: '原生重绘图1.8(a)波形、10/50/90%阈值、传播延迟' },
  { id: '07-page-030', title: '原书第30页 · 理想瞬态与功耗统计', pages: 'PDF第30页/印刷第11页', summary: '图1.8(b)原生波形；图1.9历史散点仍待逐点重画' },
  { id: '08-page-031', title: '原书第31页 · 功耗公式与设计权衡', pages: 'PDF第31页/印刷第12页', summary: '式(1.2)—(1.5)的可编辑 Typst 数学表达和设计概念' },
  { id: '09-page-032', title: '原书第32页 · NMOS器件结构', pages: 'PDF第32页/印刷第13页', summary: '图1.10原生栅、氧化层、源漏、p型衬底截面' },
  { id: '10-page-033', title: '原书第33页 · CMOS与NMOS反相器', pages: 'PDF第33页/印刷第14页', summary: '图1.11互补反相器、电路状态及静态功耗' },
  { id: '11-page-034', title: '原书第34页 · NMOS负载与互连', pages: 'PDF第34页/印刷第15页', summary: '图1.12可编辑电阻负载反相器、深亚微米互连' },
  { id: '12-page-035', title: '原书第35页 · 互连电阻与耦合', pages: 'PDF第35页/印刷第16页', summary: '图1.13–1.15，RC/IR和耦合原生图' },
  { id: '13-page-036', title: '原书第36页 · 时钟树与偏斜', pages: 'PDF第36页/印刷第17页', summary: '图1.16时钟树拓扑，原书照片仍待重排' },
  { id: '14-page-037', title: '原书第37页 · 串扰与分布RLC', pages: 'PDF第37页/印刷第18页', summary: '图1.17–1.19，耦合及分布RLC可编辑' },
  { id: '15-page-038', title: '原书第38页 · CAD物理设计流程', pages: 'PDF第38页/印刷第19页', summary: '图1.20设计流程拓扑示意' },
  { id: '16-page-039', title: '原书第39页 · SPICE电路分析', pages: 'PDF第39页/印刷第20页', summary: '1.5.1节SPICE与电路验证概念' },
  { id: '17-page-040', title: '原书第40页 · ITRS工艺路线图', pages: 'PDF第40页/印刷第21页', summary: '表1.2已逐格核对，共9行6列' },
  { id: '18-page-041', title: '原书第41页 · 电压、功耗与电流趋势', pages: 'PDF第41页/印刷第22页', summary: '图1.21供电电压与功耗历史趋势' },
  { id: '19-page-042', title: '原书第42页 · ITRS设计生产力与SoC', pages: 'PDF第42页/印刷第23页', summary: '图1.22设计生产力差距、图1.23 IP复用' },
  { id: '20-page-043', title: '原书第43页 · SoC实例、章节小结', pages: 'PDF第43页/印刷第24页', summary: '图1.24 SoC功能分区、1.7小结、1.8参考' },
  { id: '21-page-044', title: '原书第44页 · 习题P1.1—P1.7与半加器', pages: 'PDF第44页/印刷第25页', summary: 'P1.4 半加器真值表、P1.1—P1.7概览' },
  { id: '22-page-045', title: '原书第45页 · 反相器、RC延迟与开关', pages: 'PDF第45页/印刷第26页', summary: 'P1.7五级反相器和P1.8/P1.9 RC电路' },
  { id: '23-page-046', title: '原书第46页 · 习题P1.10—P1.12', pages: 'PDF第46页/印刷第27页', summary: '工艺倍增、处理器代际与电容充电题解' },
  { id: '24-page-047', title: '原书第47页 · MOS晶体管章节提要', pages: 'PDF第47页/印刷第28页', summary: '第2章11节索引与器件模型' },
  { id: '25-page-048', title: '原书第48页 · MOS器件及四端结构', pages: 'PDF第48页/印刷第29页', summary: '2.1—2.2 MOS四端器件对照' },
  { id: '26-page-049', title: '原书第49页 · NMOS结构与沟道', pages: 'PDF第49页/印刷第30页', summary: '图2.1 NMOS可编辑横截面' },
  { id: '27-page-050', title: '原书第50页 · PMOS剖面与阈值', pages: 'PDF第50页/印刷第31页', summary: '图2.2 PMOS器件和阈值极性' },
  { id: '28-page-051', title: '原书第51页 · CMOS阱与隔离结构', pages: 'PDF第51页/印刷第32页', summary: '图2.3 CMOS阱与STI隔离' },
  { id: '29-page-052', title: '原书第52页 · 能带与载流子平衡', pages: 'PDF第52页/印刷第33页', summary: '图2.4能带、质量作用定律及费米势' },
  { id: '30-page-053', title: '原书第53页 · 氧化层电容与反型沟道', pages: 'PDF第53页/印刷第34页', summary: '图2.5反型沟道、氧化层电容' },
  { id: '31-page-054', title: '原书第54页 · MOS电荷和平带状态', pages: 'PDF第54页/印刷第35页', summary: '图2.6 MOS平带及表面电荷' },
  { id: '32-page-055', title: '原书第55页 · 耗尽层宽度和电荷', pages: 'PDF第55页/印刷第36页', summary: '图2.7耗尽层、电荷分布、泊松方程' },
  { id: '33-page-056', title: '原书第56页 · 强反型和体偏置耗尽电荷', pages: 'PDF第56页/印刷第37页', summary: '强反型与源体反偏、例2.1—2.2' },
  { id: '34-page-057', title: '原书第57页 · 阈值电压与体效应', pages: 'PDF第57页/印刷第38页', summary: '式2.10—2.12、体效应系数、例2.3' },
  { id: '35-page-058', title: '原书第58页 · 表2.1阈值符号及例2.4', pages: 'PDF第58页/印刷第39页', summary: '参数符号表与+0.08V阈值计算' },
  { id: '36-page-059', title: '原书第59页 · 阈值注入例2.5与线性区引言', pages: 'PDF第59页/印刷第40页', summary: '离子注入量3.2×10^12 ions/cm²' },
  { id: '37-page-060', title: '原书第60页 · 沟道电荷与载流子迁移率', pages: 'PDF第60页/印刷第41页', summary: '图2.8；公式2.13—2.16' },
  { id: '38-page-061', title: '原书第61页 · 线性区方程与夹断', pages: 'PDF第61页/印刷第42页', summary: '图2.9；公式2.17a/b与2.18' },
  { id: '39-page-062', title: '原书第62页 · 饱和区及沟道长度调制', pages: 'PDF第62页/印刷第43页', summary: '图2.10；公式2.19与2.20' },
  { id: '40-page-063', title: '原书第63页 · 长短沟道、速度饱和比较', pages: 'PDF第63页/印刷第44页', summary: '2.5节；预测1.3V与图中0.6V对比' },
  { id: '41-page-064', title: '原书第64页 · 图2.11与高电场对比', pages: 'PDF第64页/印刷第45页', summary: '0.18μm I–V、两组历史电场参数' },
  { id: '42-page-065', title: '原书第65页 · 迁移率退化和速度饱和', pages: 'PDF第65页/印刷第46页', summary: '式2.21—2.22、图2.12' },
  { id: '43-page-066', title: '原书第66页 · 临界电场和分段速度模型', pages: 'PDF第66页/印刷第47页', summary: '图2.13、式2.23a/b及2.24' },
  { id: '44-page-067', title: '原书第67页 · 高场线性和饱和电流方程', pages: 'PDF第67页/印刷第48页', summary: '式2.25—2.29' },
  { id: '45-page-068', title: '原书第68页 · 长短沟道极限与例2.6', pages: 'PDF第68页/印刷第49页', summary: '图2.14、0.6V/1.0V饱和阈值' },
  { id: '46-page-069', title: '原书第69页 · 例2.7与驱动电流比', pages: 'PDF第69页/印刷第50页', summary: '585/256 μA/μm，电流比2.3' },
  { id: '47-page-070', title: '原书第70页 · 例2.8和α功率定律', pages: 'PDF第70页/印刷第51页', summary: '0.34V/0.60V，式2.30a' },
  { id: '48-page-071', title: '原书第71页 · α功率定律与例2.9', pages: 'PDF第71页/印刷第52页', summary: '式2.30b、2.31、图2.15与α约1.25' },
  { id: '49-page-072', title: '原书第72页 · 亚阈值传导模型', pages: 'PDF第72页/印刷第53页', summary: '图2.16、式2.32及漏电流' },
  { id: '50-page-073', title: '原书第73页 · 亚阈值斜率与例2.10', pages: 'PDF第73页/印刷第54页', summary: '式2.33、72mV/decade，MOS电容' },
  { id: '51-page-074', title: '原书第74页 · 栅电容及图2.17', pages: 'PDF第74页/印刷第55页', summary: '式2.34、历史1.6fF/μm示例' },
  { id: '52-page-075', title: '原书第75页 · 栅电容分配及例2.11', pages: 'PDF第75页/印刷第56页', summary: '图2.18与0.64fF、0.32fF、0.43fF' },
  { id: '53-page-076', title: '原书第76页 · pn结电容模型', pages: 'PDF第76页/印刷第57页', summary: '图2.19及式2.36—2.39' },
  { id: '54-page-077', title: '原书第77页 · 结电容图2.20与式2.40', pages: 'PDF第77页/印刷第58页', summary: '零偏置结电容、扩散区底/侧壁' },
  { id: '55-page-078', title: '原书第78页 · 侧壁模型式2.41—2.42', pages: 'PDF第78页/印刷第59页', summary: '非线性结电容积分与大信号定义' },
  { id: '56-page-079', title: '原书第79页 · 式2.43—2.45与例2.12', pages: 'PDF第79页/印刷第60页', summary: '等效系数、零偏置0.22fF' },
  { id: '57-page-080', title: '原书第80页 · 例2.12续与覆盖电容', pages: 'PDF第80页/印刷第61页', summary: '0.16/0.18fF、图2.21、式2.46/2.47' },
  { id: '58-page-081', title: '原书第81页 · 例2.13和第2章小结', pages: 'PDF第81页/印刷第62页', summary: '0.25fF/μm及NMOS/PMOS极性表' },
  { id: '59-page-082', title: '原书第82页 · 第2章模型和电容表', pages: 'PDF第82页/印刷第63页', summary: '速度饱和、亚阈值、栅/结电容矩阵' },
  { id: '60-page-083', title: '原书第83页 · 参考文献及表P2.1', pages: 'PDF第83页/印刷第64页', summary: '8篇参考、0.13μm参数表' },
  { id: '61-page-084', title: '原书第84页 · 习题P2.1—P2.5', pages: 'PDF第84页/印刷第65页', summary: '四组MOS工作区与充电电路' },
  { id: '62-page-085', title: '原书第85页 · 习题P2.6—P2.8', pages: 'PDF第85页/印刷第66页', summary: '版图、传输曲线和四组电流' },
  { id: '63-page-086', title: '原书第86页 · 习题P2.9—P2.10', pages: 'PDF第86页/印刷第67页', summary: '宽度依赖与α功率拟合' },
  { id: '64-page-087', title: '原书第87页 · 第3章章首与3.1绪论', pages: 'PDF第87页/印刷第68页', summary: '11节提要、制造/版图/仿真关系' },
  { id: '65-page-088', title: '原书第88页 · 3.2.1 IC制造工艺概述', pages: 'PDF第88页/印刷第69页', summary: '硅片规格、氧化刻蚀扩散注入CVD' },
  { id: '66-page-089', title: '原书第89页 · 图3.1与3.2.2光刻工艺', pages: 'PDF第89页/印刷第70页', summary: '版图→掩膜→硅片→工艺→芯片' },
  { id: '67-page-090', title: '原书第90页 · 光刻步骤2—5与STI', pages: 'PDF第90页/印刷第71页', summary: '曝光、显影、刻蚀、去胶、光学邻近校正' },
  { id: '68-page-091', title: '原书第91页 · CMOS制造步骤2—5', pages: 'PDF第91页/印刷第72页', summary: '22Å栅氧化、自对准栅、源漏注入' },
  { id: '69-page-092', title: '原书第92页 · 图3.2深亚微米CMOS结构', pages: 'PDF第92页/印刷第73页', summary: '双阱/STI/栅侧壁/硅化物' },
  { id: '70-page-093', title: '原书第93页 · 3.2.4制造连线', pages: 'PDF第93页/印刷第74页', summary: '接触孔/金属层1/通孔/金属层2' },
  { id: '71-page-094', title: '原书第94页 · 图3.3多层金属互连', pages: 'PDF第94页/印刷第75页', summary: 'M1—M6、铜、双镶嵌、CMP' },
  { id: '72-page-095', title: '原书第95页 · 图3.4/3.5与式3.1', pages: 'PDF第95页/印刷第76页', summary: '平行板电容、金属线寄生几何' },
  { id: '73-page-096', title: '原书第96页 · 互连电容与方块电阻', pages: 'PDF第96页/印刷第77页', summary: 'R=ρL/(TW)，Rsq=ρ/T（原书未编号）' },
  { id: '74-page-097', title: '原书第97页 · 互连尺寸与例3.1', pages: 'PDF第97页/印刷第78页', summary: '图3.6、0.2/10/11Ω电阻与版图概述' },
  { id: '75-page-098', title: '原书第98页 · GDS-II流程与λ规则', pages: 'PDF第98页/印刷第79页', summary: '图3.7、DRC和λ栅长单位' },
  { id: '76-page-099', title: '原书第99页 · 版图基本设计规则', pages: 'PDF第99页/印刷第80页', summary: '图3.8—3.9最小线宽/间距/触点' },
  { id: '77-page-100', title: '原书第100页 · SPICE器件模型概述', pages: 'PDF第100页/印刷第81页', summary: '3.4、3.4.1模型族与参数' },
  { id: '78-page-101', title: '原书第101页 · MOS实例字段与图3.10', pages: 'PDF第101页/印刷第82页', summary: 'D/G/S/B与L/W/AD/PD/AS/PS' },
  { id: '79-page-102', title: '原书第102页 · 有效沟道与例3.2', pages: 'PDF第102页/印刷第83页', summary: '式（3.2）与两个SPICE实例网表' },
  { id: '80-page-103', title: '原书第103页 · LEVEL1电流公式', pages: 'PDF第103页/印刷第84页', summary: '式（3.3）—（3.9），VTO/KP/GAMMA' },
  { id: '81-page-104', title: '原书第104页 · 结电容与参数提取', pages: 'PDF第104页/印刷第85页', summary: '式（3.10）—（3.11）' },
  { id: '82-page-105', title: '原书第105页 · 图3.11及例3.3', pages: 'PDF第105页/印刷第86页', summary: 'VTO/KP/GAMMA/LAMBDA及模型卡' },
  { id: '83-page-106', title: '原书第106页 · BSIM3模型与分箱', pages: 'PDF第106页/印刷第87页', summary: '3.6/3.6.1及图3.12' },
  { id: '84-page-107', title: '原书第107页 · BSIM3短沟道阈值', pages: 'PDF第107页/印刷第88页', summary: '式3.12—3.16 NCH/NSUB、γ1/γ2' },
  { id: '85-page-108', title: '原书第108页 · 图3.13 SCE与RSCE', pages: 'PDF第108页/印刷第89页', summary: '式3.17、阈值随沟道长度的变化' },
  { id: '86-page-109', title: '原书第109页 · 图3.14 DIBL及迁移率', pages: 'PDF第109页/印刷第90页', summary: '式3.18—3.20、临界场VSAT' },
  { id: '87-page-110', title: '原书第110页 · 例3.4 BSIM3直流I–V', pages: 'PDF第110页/印刷第91页', summary: '1.8V/0.18μm SPICE扫描选段' },
  { id: '88-page-111', title: '原书第111页 · 例3.5及电容模型引言', pages: 'PDF第111页/印刷第92页', summary: '约2.8倍NMOS/PMOS单位宽度驱动' },
  { id: '89-page-112', title: '原书第112页 · 亚阈值SPICE示例和电容', pages: 'PDF第112页/印刷第93页', summary: '半对数曲线、3.6.6电容模型' },
  { id: '90-page-113', title: '原书第113页 · 结电容、源漏电阻', pages: 'PDF第113页/印刷第94页', summary: '式3.22、3.23，工艺角' },
  { id: '91-page-114', title: '原书第114页 · 温度对MOS的影响', pages: 'PDF第114页/印刷第95页', summary: '式3.24/3.25、例3.7' },
  { id: '92-page-115', title: '原书第115页 · SPICE温度扫描', pages: 'PDF第115页/印刷第96页', summary: '不同栅压下泄漏与导通电流趋势' },
  { id: '93-page-116', title: '原书第116页 · HCE和CMOS闩锁', pages: 'PDF第116页/印刷第97页', summary: '3.7.4高场极限与3.7.5闩锁' },
  { id: '94-page-117', title: '原书第117页 · 图3.15 CMOS闩锁', pages: 'PDF第117页/印刷第98页', summary: 'PNPN寄生反馈与防护' },
  { id: '95-page-118', title: '原书第118页 · 图3.16 SOI器件结构', pages: 'PDF第118页/印刷第99页', summary: 'PD-SOI/FD-SOI及埋氧层' },
  { id: '96-page-119', title: '原书第119页 · 表3.1 LEVEL1参数', pages: 'PDF第119页/印刷第100页', summary: 'VTO/KP/GAMMA及27行模型参数' },
  { id: '97-page-120', title: '原书第120页 · 表3.2 BSIM3参数（一）', pages: 'PDF第120页/印刷第101页', summary: '尺寸、工艺及迁移率参数' },
  { id: '98-page-121', title: '原书第121页 · 表3.2 BSIM3参数（二）', pages: 'PDF第121页/印刷第102页', summary: '迁移率、亚阈值与DIBL' },
  { id: '99-page-122', title: '原书第122页 · 表3.2 BSIM3参数（三）', pages: 'PDF第122页/印刷第103页', summary: '温度、电容和侧壁参数' },
  { id: '100-page-123', title: '原书第123页 · 参考文献及P3.1', pages: 'PDF第123页/印刷第104页', summary: '12篇参考、NMOS模型提取电路' },
  { id: '101-page-124', title: '原书第124页 · 表P3.1及P3.2/3.3', pages: 'PDF第124页/印刷第105页', summary: '四组I–V值与电容充电条件' },
  { id: '102-page-125', title: '原书第125页 · 习题P3.4—P3.8', pages: 'PDF第125页/印刷第106页', summary: '沟道调制、体效应与SPICE' },
  { id: '103-page-126', title: '原书第126页 · 第3章习题P3.8—P3.14', pages: 'PDF第126页/印刷第107页', summary: 'PMOS阈值、温度、介质与互连' },
  { id: '104-page-127', title: '原书第127页 · 第4章章首与4.1绪论', pages: 'PDF第127页/印刷第108页', summary: '12节章节提要、静态/动态电路' },
  { id: '105-page-128', title: '原书第128页 · 理想VTC和增益式4.1', pages: 'PDF第128页/印刷第109页', summary: '图4.1理想切换与dVout/dVin' },
  { id: '106-page-129', title: '原书第129页 · 实际VTC与级联噪声', pages: 'PDF第129页/印刷第110页', summary: '图4.2/4.3、实际输出过渡' },
  { id: '107-page-130', title: '原书第130页 · 4.3噪声容限的定义', pages: 'PDF第130页/印刷第111页', summary: '4.3.1单源噪声容限SSNM' },
  { id: '108-page-131', title: '原书第131页 · 图4.4/4.5及式4.2', pages: 'PDF第131页/印刷第112页', summary: 'SSNM_H与SSNM_L双行公式' },
  { id: '109-page-132', title: '原书第132页 · 图4.6/4.7与多源噪声', pages: 'PDF第132页/印刷第113页', summary: 'MSNM以及f(Vin+vn)' },
  { id: '110-page-133', title: '原书第133页 · 图4.8及式4.3', pages: 'PDF第133页/印刷第114页', summary: '单位增益点VIL/VIH与NM' },
  { id: '111-page-134', title: '原书第134页 · 例4.1缓冲器、4.4节', pages: 'PDF第134页/印刷第115页', summary: '正斜率VTC与电阻负载结构' },
  { id: '112-page-135', title: '原书第135页 · 图4.9及式4.4', pages: 'PDF第135页/印刷第116页', summary: '负载线与NMOS电流交点' },
  { id: '113-page-136', title: '原书第136页 · 式4.5—4.7电阻负载设计', pages: 'PDF第136页/印刷第117页', summary: 'VOH/VOL二次近似与静态功耗' },
  { id: '114-page-137', title: '原书第137页 · 式4.8a/b低输入单位增益点', pages: 'PDF第137页/印刷第118页', summary: 'VIL = VT + 1/(kRL)' },
  { id: '115-page-138', title: '原书第138页 · 式4.8c—f、式4.9及例4.2', pages: 'PDF第138页/印刷第119页', summary: 'VIH与切换点VS' },
  { id: '116-page-139', title: '原书第139页 · 例4.2结果与例4.3 SPICE', pages: 'PDF第139页/印刷第120页', summary: 'VOL≈0.08V、NL=0.38V、NH=0.43V' },
  { id: '117-page-140', title: '原书第140页 · 例4.3 SPICE VTC验证', pages: 'PDF第140页/印刷第121页', summary: '噪声容限0.473V/0.828V' },
  { id: '118-page-141', title: '原书第141页 · 4.5 NMOS负载及4.5.1', pages: 'PDF第141页/印刷第122页', summary: '饱和增强型上拉NMOS' },
  { id: '119-page-142', title: '原书第142页 · 图4.10与式4.10/4.11', pages: 'PDF第142页/印刷第123页', summary: '尺寸比KR及体效应阈值' },
  { id: '120-page-143', title: '原书第143页 · 式4.12与例4.4', pages: 'PDF第143页/印刷第124页', summary: 'VOH约0.73V' },
  { id: '121-page-144', title: '原书第144页 · 例4.5负载器件尺寸设计', pages: 'PDF第144页/印刷第125页', summary: '目标VOL=0.1V、工艺参数' },
  { id: '122-page-145', title: '原书第145页 · 4.5.2、图4.11及式4.13', pages: 'PDF第145页/印刷第126页', summary: '线性增强型NMOS负载' },
  { id: '123-page-146', title: '原书第146页 · 4.6与4.6.1 CMOS反相器', pages: 'PDF第146页/印刷第127页', summary: 'CMOS互补连接与静态状态' }
]
const selected = ref(sections[0].id)
const active = computed(() => sections.find(x => x.id === selected.value)!)
const htmlUrl = computed(() => withBase('/native-typst/' + active.value.id + '.html'))
const sourceUrl = computed(() => active.value.id.includes('-page-') ? 'https://github.com/stevessr/hspice/blob/main/fullbook/native/web/' + active.value.id + '.typ' : withBase('/native-typst/' + active.value.id + '.typ'))
const visualMode = ref(false)
const canShowVisual = computed(() => active.value.id.includes('-page-'))
const layoutUrl = computed(() => withBase('/native-typst/' + active.value.id + '-layout.svg'))
</script>

<div class="native-review">
  <div class="native-review-nav" role="group" aria-label="选择校对章节">
    <button v-for="item in sections" :key="item.id" type="button"
      :class="{ selected: selected === item.id }" :aria-pressed="selected === item.id"
      @click="selected = item.id">{{ item.title }}</button>
  </div>
  <div class="native-review-summary">
    <strong>{{ active.title }}</strong>
    <span>{{ active.pages }} · {{ active.summary }}</span>
    <div class="native-review-links">
      <a :href="htmlUrl" target="_blank" rel="noopener noreferrer">独立网页阅读</a>
      <a :href="sourceUrl" target="_blank" rel="noopener noreferrer">查看可编辑 Typst 源码</a>
    </div>
  </div>
  <div v-if="canShowVisual" class="native-review-nav" role="group" aria-label="预览模式">
    <button type="button" :aria-pressed="!visualMode" :class="{ selected: !visualMode }"
      @click="visualMode = false">语义 HTML · 可检索</button>
    <button type="button" :aria-pressed="visualMode" :class="{ selected: visualMode }"
      @click="visualMode = true">固定页尺寸 SVG · 视觉比对</button>
    <a :href="layoutUrl" target="_blank" rel="noopener noreferrer">单独打开整页 SVG</a>
  </div>
  <iframe v-if="!visualMode || !canShowVisual" :key="active.id" class="native-review-frame" :src="htmlUrl"
    :title="'原生 Typst HTML：' + active.title" loading="lazy"></iframe>
  <div v-else class="native-review-layout">
    <p>原 PDF 页面尺寸 506.8346 × 729.6 pt。此图由 Typst 源码排版导出，不是原扫描图，也尚未通过 1:1 几何验收。</p>
    <img :src="layoutUrl" alt="原书该页可编辑 Typst 固定尺寸 SVG 预览，待版式精校" />
  </div>
</div>

此处展示的 **SVG 是版式重排的视觉预览**，公式、文字及图元仍在 Typst 中编辑；与原扫描逐元素比较仍是下一步验收工作。

## 第4章 NMOS 负载到 CMOS 反相器：PDF 第137—146页

按扫描逐页整理式（4.8a—f）、式（4.9）—（4.13）、例4.2—4.5的参数与结果。包含图4.10饱和增强型负载的可编辑拓扑、图4.11线性增强型负载的可编辑拓扑，以及4.6节CMOS反相器的双管连接草图。例4.3的原始SPICE I–V曲线未逐点数字化；公式、模拟结果选段不等同于整页重排。

连续源页编辑选段为 **PDF第26—146页，共121页**；严格整页1:1校验仍为0/445。

## 第4章反相器 VTC 与噪声容限：PDF 第127—136页

新增第4章章首目录、4.1—4.4节前段及原生可编辑的理想/实际反相器 VTC、六级反相器噪声传播、单位增益点噪声容限、电阻负载NMOS及负载线。公式（4.1）—（4.7）按扫描页界放置，例4.1缓冲器VTC只完成文本与概念，尚未达到完整原图几何一致。

连续可编辑源页为 **PDF第26—136页共111页**；严格全页1:1验收仍为 **0/445**，该范围是关键内容选段，而非整页原文。

## 第3章小结与习题：PDF 第117—126页

本轮增加图3.15寄生PNPN闩锁、图3.16 SOI结构，以及可编辑的表3.1 LEVEL1参数与表3.2 BSIM3参数。第123页的12项参考文献和P3.1测试电路，第124页表P3.1的四组漏电流值（1000/280/276/741 μA），以及P3.2—P3.14题目条件均按原扫描选段重排。未把练习答案作为原书正文写入。

连续可编辑源页选段现为 **PDF第26—126页，共101页**，目前第3章源页覆盖至章末。整页完整1:1保真验收仍为0/445。

## 第3章BSIM3与附加效应：PDF 第107—116页

新增式（3.12）—（3.25）的BSIM3阈值、体效应、迁移率、DIBL和源漏寄生模型，例3.4—3.7的SPICE扫描选段，图3.13/3.14的可编辑短沟道趋势与温度示意。源书示例中SPICE图的实测点未逐点数字化，不宣称定量复刻。

连续原生可编辑选段扩展为 **PDF第26—116页，共91页**；全书OCR底稿445页已经存在，严格整页1:1人工验收依旧为0/445。

## 第3章版图规则与SPICE建模：PDF 第97—106页

原扫描逐页核对例3.1的三个连线电阻（约0.2、10、11Ω），GDS-II与λ设计规则图3.6—3.10，SPICE MOS四端实例、例3.2双网表，LEVEL1模型式（3.2）—（3.11），例3.3模型卡，以及BSIM3分箱图3.12。特别保留**PDF第96页的无编号方块电阻公式**与**第102页才开始出现的式（3.2）**的区别。图形为原生编辑候选，实验曲线尚非逐点原始数据。

连续源页选段扩展为 **PDF第26—106页，共81页**，严格整页1:1验收仍为0/445。

## 第3章制造与连线模型：PDF 第87—96页

新增第3章章首目录、3.1绪论、3.2.1—3.2.5节的源页编辑选段。图3.1—3.5已转写为原生Typst工艺流程、CMOS剖面、多金属层与寄生电容几何示意；图3.1中的实物设备照片尚未重排为精确编辑图。源书第95页的(3.1)平行板电容公式已核对；第96页的方块电阻与导线电阻关系**原书未印（3.2）/（3.3）编号**，源码保留无编号。

连续可编辑源页现覆盖 **PDF第26—96页，共71页**，严格逐页1:1验收仍为0/445。本轮对每页的章/节/图号和书内数据进行源扫描对照，尚未达到全文逐字转录、原图逐线或原版页面几何验收。

## 第2章结尾与习题：PDF 第77—86页

按原扫描重建了式（2.40）—（2.47）、图2.20/图2.21的可编辑结构，以及例2.12的0.22、0.16、0.18 fF和例2.13每微米0.25 fF的计算。第81—82页包括工作区与MOS电容的教材汇总表，第83—86页涵盖参考文献、表P2.1和习题P2.1—P2.10。第86页后半本来就是留白，本次不补造正文。

至此**连续的可编辑源页选段为PDF第26—86页，共61页**，第一章末尾与第二章末尾相连。对照源页关键公式和例题不等于整页1:1复刻；严格整页验收仍为0/445。

## 第2章亚阈值与电容：PDF 第71—76页

新增式（2.30b）—（2.39）、α功率拟合例2.9、亚阈值斜率例2.10、栅电容例2.11及图2.15—2.19的原生矢量概念图。关键复核数据包括：$\\alpha\\approx1.25$、$S\\approx72$ mV/decade、$C_G=0.64$ fF。在线阅读范围扩展为 **PDF 第26—76页，共51个连续可编辑选段**。原始测量散点尚未量化，且仍无整页通过严格1:1验收。

## 第2章速度饱和与α功率定律：PDF 第64—70页

新增了高场迁移率、临界场、载流子速度饱和及器件电流的手工推导（式2.21—2.30a），并以原生 Typst 向量示意重建图2.11—2.14。按原书扫描核对例2.6（NMOS约0.6V，PMOS约1.0V）、例2.7（585和256 μA/μm）及例2.8（0.34V、0.60V与2.3电流比）。**所有原始实验散点曲线尚未逐点数字化**，因此这些图仅可用于概念和结构检查。

连续原生源页选段已覆盖 **PDF第26—70页，共45页**；严格整页1:1验收依旧为0/445。

## 第2章电流—电压特性：PDF 第58—63页

本轮按原扫描逐项核对表2.1、例2.4（$V_{T0}=+0.08$ V）、例2.5（$N_I=3.2\\times10^{12}$ ions/cm²），将式（2.13）—（2.20）、图2.8、图2.9及图2.10改为可编辑的Typst数学和原生矢量示意。尤其区分**线性区方程不能越过夹断点外推**、长沟道饱和平方律及沟道长度调制。第63页明确原书所述0.18 μm器件的提前速度饱和（长沟道预测约1.3 V、图2.11观察约0.6 V）。

连续原生编辑选段扩展至 **PDF 第26—63页（38页）**，全书整页严格1:1验收仍为0/445。表格数字和公式已按源图检查，版式和每根图线仍需精校。

## 第2章阈值模型续页：PDF 第53—57页

新增公式2.4—2.12相关的 Typst 数学表达与可编辑的图2.5—2.7示意，特别标明了 p 型费米势的负号、耗尽电荷的负号以及体效应表达式。当前连续原生选段扩展为 **PDF第26—57页，共32页**；所有页的整页1:1验收仍为0/445。

## 第2章前六页：PDF 第47—52页

新增原生 MOS 横截面与 CMOS 阱结构，覆盖第2章章节提要、2.1绪论、2.2 MOS结构、2.3阈值电压开头；器件物理公式采用Typst math，图2.1—2.4均有可编辑简化图元。当前连续选段为 **PDF 第26—52页，共27页**，仍不是任何一页的完整1:1验收。

## 第1章末尾：PDF 第42—46页

新增原生可编辑的图1.22、图1.23、SoC功能分区示意、半加器P1.4真值表、五级反相器链和RC充电图。对应的数字实例包括 **12.5 kΩ × 100 fF = 1.25 ns**、**25 fF 电容在30 ps升高0.6 V需要0.5 mA**；题解属于学习补充，原书并未给出对应答案。第1章连续可编辑选段扩展为 PDF 第26—46页，共21页，原纸版式和全部原图仍未完成1:1验收。

## 上轮精修：PDF 第35—41页

新增七个 Typst 原生选段及独立的 HTML、SVG。图1.14—1.16、1.18—1.21具备原生可编辑拓扑或趋势示意；表1.2的历史 ITRS 预测值9行6列已对照源扫描重建。图1.13与1.17是扫描照片及分布图，不以虚构矢量代替原图。仍未完成逐字、逐元素、逐页的 1:1 排版验收。

## 前轮新增第30—34页

新增图1.8(b)的原生瞬态波形、式(1.2)—(1.5)完整数学表达、图1.10 MOS横截面、图1.11 CMOS反相器和图1.12 NMOS电阻负载反相器。**图1.9已从原扫描追踪出126个候选点位，重绘为可编辑 Typst 点阵；类别、坐标、重叠点仍需人工校验，不作为定量数据使用。** 所有新增页均可在网页切换至可编辑文字 HTML 或固定页尺寸 SVG，仍须进行1:1验收。

## 本轮校对记录

| 原书 PDF 页码 | 已核对的核心项目 | 未完成的部分 |
| --- | --- | --- |
| 26 | 门电路、MUX、DFF原生Typst曲线与图元、8行激励表已重排 | 图1.4/1.5几何与页面布局仍需逐元素核验 |
| 28 | 图1.7四幅电平抽象与VTC曲线、噪声容限公式的原生Typst文字和图形 | 坐标比例、图注位置、逐行分页未完成1:1验收 |
| 29 | 图1.8(a)输入输出瞬态波形和传播延迟定义的原生Typst表达 | 曲线时刻、图1.8(b)续图及版式未完成1:1验收 |
| 27 | 理想与实际逻辑门、图1.6的可编辑电路和阶跃传输曲线、五条特性已重排 | 图1.6的几何与页面分页仍需逐元素验收 |
| 28 | 噪声容限 $NMH=V_{OH}-V_{IH}$、$NML=V_{IL}-V_{OL}$ | 图 1.7 曲线的完整图形 |
| 29—30 | 10%—90% 转换时间与 50% 传播延迟的区别 | 图 1.8 的全部波形标注、图 1.9 散点 |
| 31—32 | 功耗式（1.2）—（1.5）、MOS 开关基本结构 | 图 1.10 的精确几何及脚注 |
| 48—53 | NMOS/PMOS 四端、费米势、氧化层电容 | 图 2.1—2.5 的逐线重绘 |
| 54—57 | 平带电压、耗尽层、阈值与体效应式（2.6）—（2.12） | 例 2.2 全部中间数值、能带图 |

**两个容易被 OCR 改坏的地方：**教材式（1.5）采用转换频率 $f$，原式没有额外写出活动因子 $\alpha$；MOS 阈值的耗尽电荷需先统一 p 型衬底的负电荷符号，再解释阈值关系，不能沿用乱码识别结果。

## 状态边界

本轮已对上述 **17 个源扫描页**的关键公式和术语进行人工复核，精修内容属于选段与释义；这些页面仍未全部完成逐字、逐图、逐脚注验收。**445 页教材的整页最终验收仍为 0 页。**

此网页与现有 [系统复习](/content/00-reading-guide)、[教材精编](/textbook) 和 [原 PDF 资料库](/pdf) 互不覆盖。以后修改对应 Typst 源码，GitHub Actions 会重新生成 HTML 并更新本页，不需要制作 PDF。

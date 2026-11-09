# 公式速查表 II：传输门、存储器、互连与时钟（第 7—11 章）

> 本页按《数字集成电路分析与设计——深亚微米工艺（第三版）》后五章整理。保留**印刷页码**和 PDF 物理页序，链接打开对应页的**在线 Typst 校对版**（不是原扫描影像）。原书带编号的式子与图示、例题、推导式分别标注。

[公式第 1—6 章](/reference/formula-index) · [返回总目录](/reference/) · [完整符号与模型](/reference/formulas-models)

**换算**：印刷页 $n$ 对应用户上传扫描 PDF 页序 $n+19$。例如：印刷第 250 页对应 PDF 第 269 页。


## 第 7 章：传输晶体管与动态逻辑

**原书范围：** 印刷第 235—272 页

| 公式名称 | 对应公式 | 原书式号／图例 | 印刷页 | PDF 页序 · 校对页 |
|---|---|---|---:|---|
| **电容馈通的节点方程**<br>输入变化通过寄生耦合至浮置节点 | $C_f(V_1-V_2)=C_{gnd}V_2$ | 式 (7.1) | 239 | [258](/native-workbench?page=258) |
| **馈通后的节点电压**<br>两电容分压 | $V_2=\frac{C_f}{C_f+C_{gnd}}V_1$ | 式 (7.2) | 239 | [258](/native-workbench?page=258) |
| **馈通电压变化**<br>增量形式 | $\Delta V_2=\frac{C_f}{C_f+C_{gnd}}\Delta V_1$ | 式 (7.3) | 239 | [258](/native-workbench?page=258) |
| **导通电阻估计**<br>小漏压条件下近似 | $R_{on}\approx\frac{V_{DS}}{I_{DS}}$ | §7.3.2 | 247 | [266](/native-workbench?page=266) |
| **传输门等效导通电阻**<br>两个开关导通时近似并联 | $R_{TG}=R_N\parallel R_P$ | §7.3.2 / 式 (7.7) 之前 | 249 | [268](/native-workbench?page=268) |
| **传输门宽长比等效电阻**<br>教材对等尺寸近似 | $R_{TG}\approx R_{eqn}\frac LW$ | 式 (7.7) | 249 | [268](/native-workbench?page=268) |
| **传输门两侧结电容**<br>不含栅耦合时 | $C_{in}=C_{out}=C_{eff}(W_n+W_p)$ | 式 (7.8) | 249 | [268](/native-workbench?page=268) |
| **等尺寸传输门结电容**<br>$W_n=W_p=W$ | $C_{in}=C_{out}=2C_{eff}W$ | 式 (7.9) | 249 | [268](/native-workbench?page=268) |
| **传输门完整端电容**<br>增加栅控馈通平均项 | $C_{in}=C_{out}=C_{eff}(W_n+W_p)+\frac12 C_g(W_n+W_p)$ | 式 (7.10) | 250 | [269](/native-workbench?page=269) |
| **等尺寸传输门完整端电容**<br>$W_n=W_p=W$ | $C_{in}=C_{out}=2C_{eff}W+C_gW$ | 式 (7.11) | 250 | [269](/native-workbench?page=269) |
| **两段 RC 阶梯 Elmore 延迟**<br>无源 RC 阶梯 | $t_E=R_1C_1+(R_1+R_2)C_2$ | 图 7.18 / 推导 | 250 | [269](/native-workbench?page=269) |
| **三段 RC 阶梯 Elmore 延迟**<br>扩展至多段阶梯 | $t_E=R_1C_1+(R_1+R_2)C_2+(R_1+R_2+R_3)C_3$ | §7.3.2 | 251 | [270](/native-workbench?page=270) |
| **电荷分享最终电位**<br>理想电荷守恒，忽略电源连接与漏电 | $V^*=\frac{C_1V_1+C_2V_2}{C_1+C_2}$ | §7.6 小结 | 266 | [285](/native-workbench?page=285) |

## 第 8 章：半导体存储器

**原书范围：** 印刷第 273—302 页

| 公式名称 | 对应公式 | 原书式号／图例 | 印刷页 | PDF 页序 · 校对页 |
|---|---|---|---:|---|
| **位线读出电流**<br>位线小电压差与读出时间 | $I_{cell}=\frac{C_{bit}\Delta V}{\Delta t}$ | §8.3 / 例 8.2 | 284 | [303](/native-workbench?page=303) |
| **位线充放电时间**<br>平均单元电流近似 | $\Delta t=\frac{C_{bit}\Delta V}{I_{cell}}$ | §8.3 / 例 8.2 | 284 | [303](/native-workbench?page=303) |
| **SRAM 读单元尺寸经验比**<br>原书明确指出是面积折中下的经验值 | $\frac{W_1}{W_3}\approx1.5$ | 式 (8.3) | 285 | [304](/native-workbench?page=304) |
| **SRAM 写入尺寸比经验值**<br>经验比例，需仿真验证 | $\frac{W_4}{W_6}\approx1.5$ | 式 (8.4) | 286 | [305](/native-workbench?page=305) |
| **灵敏放大器电压斜率**<br>电流源与输出电容模型 | $\lvert\frac{dV_{out}}{dt}\rvert\approx\frac{I_{SS}}{C_{out}}$ | §8.4 / 推导 | 294 | [313](/native-workbench?page=313) |
| **灵敏放大器响应时间**<br>平均电流近似 | $t_{sense}\approx\frac{C_{out}\Delta V_{out}}{I_{SS}}$ | §8.4 / 推导 | 294 | [313](/native-workbench?page=313) |
| **灵敏放大器静态功率**<br>理想静态偏置电流 | $P_{static}\approx V_{DD}I_{SS}$ | §8.4 / 推导 | 294 | [313](/native-workbench?page=313) |

## 第 9 章：其他存储器

**原书范围：** 印刷第 303—334 页

| 公式名称 | 对应公式 | 原书式号／图例 | 印刷页 | PDF 页序 · 校对页 |
|---|---|---|---:|---|
| **FPGA 的 3-LUT 逻辑例题**<br>原书例 9.2 的逻辑函数，不是普适的器件方程 | $Out=B+AC$ | 例 9.2 / 图 9.9 | 312 | [331](/native-workbench?page=331) |

## 第 10 章：互连、RC 延迟、串扰与电感

**原书范围：** 印刷第 335—366 页

| 公式名称 | 对应公式 | 原书式号／图例 | 印刷页 | PDF 页序 · 校对页 |
|---|---|---|---:|---|
| **互连导线电阻**<br>均匀矩形截面 | $R=\frac{\rho L}{A}=\frac{\rho L}{TW}$ | 式 (10.1) | 337 | [356](/native-workbench?page=356) |
| **方块电阻**<br>单位 Ω/□ | $R_{sq}=\frac{\rho}{T}$ | 式 (10.2) | 337 | [356](/native-workbench?page=356) |
| **片阻与线宽关系**<br>均匀金属 | $R=R_{sq}\frac LW$ | 式 (10.5) | 338 | [357](/native-workbench?page=357) |
| **RC 树 Elmore 延迟**<br>$R_{ik}$ 为公共路径电阻 | $\tau_i=\sum_k C_kR_{ik}$ | 式 (10.6) | 340 | [359](/native-workbench?page=359) |
| **均匀长线 Elmore 延迟**<br>$r,c$ 为单位长度值 | $\tau_E\approx\frac12 rcL^2=\frac12R_{wire}C_{wire}$ | 式 (10.7) | 341 | [360](/native-workbench?page=360) |
| **长线 50% 延迟估计**<br>均匀 RC 线近似，不是 Elmore 一阶矩 | $t_{50\%}\approx0.38R_{wire}C_{wire}$ | 式 (10.7) 之后的说明 | 341 | [360](/native-workbench?page=360) |
| **最优插入缓冲段数**<br>教材均匀线与简化缓冲器模型 | $N^*=\sqrt{\frac{R_{int}C_{int}L^2}{2R_{eqn}(C_J+C_G)(1+\beta)}}$ | 式 (10.9) | 346 | [365](/native-workbench?page=365) |
| **最优缓冲器倍率**<br>同上，驱动与布线综合优化 | $M^*=\sqrt{\frac{R_{eqn}C_{int}}{C_G(1+\beta)R_{int}}}$ | 式 (10.10) | 346 | [365](/native-workbench?page=365) |
| **对地面积电容近似**<br>单位长度，平行板近似 | $C_{area}=\varepsilon_{ox}\frac WH$ | 式 (10.11) | 349 | [368](/native-workbench?page=368) |
| **横向耦合电容近似**<br>单位长度，平行板近似 | $C_{lateral}=\varepsilon_{ox}\frac TS$ | 式 (10.12) | 350 | [369](/native-workbench?page=369) |
| **边缘电容近似**<br>单位长度，几何近似 | $C_{fringe}=\varepsilon_{ox}\ln(1+\frac TH)$ | 式 (10.13) | 350 | [369](/native-workbench?page=369) |
| **邻线静止时负载**<br>耦合活动因子为 1 | $C_L=C_{gnd}+C_c$ | 式 (10.14) | 353 | [372](/native-workbench?page=372) |
| **邻线同向切换负载**<br>理想同相、等幅同步切换 | $C_L=C_{gnd}$ | 式 (10.15) | 353 | [372](/native-workbench?page=372) |
| **邻线反向切换负载**<br>理想反相、等幅同步切换 | $C_L=C_{gnd}+2C_c$ | 式 (10.16) | 353 | [372](/native-workbench?page=372) |
| **电容耦合噪声**<br>理想瞬态电荷分享 | $\Delta V_2=\frac{C_c}{C_{gnd}+C_c}\Delta V_1$ | 式 (10.17) | 355 | [374](/native-workbench?page=374) |
| **均匀无损传输线阻抗**<br>忽略电阻与电导 | $Z_0=\sqrt{\frac{L_{int}}{C_{int}}}$ | §10.5 | 357 | [376](/native-workbench?page=376) |
| **电感耦合电压 1**<br>耦合电感取参考方向 | $v_1=L_1\frac{di_1}{dt}+M\frac{di_2}{dt}$ | 式 (10.28) 所在组 | 359 | [378](/native-workbench?page=378) |
| **电感耦合电压 2**<br>互感 $M$ 与相对方向有关 | $v_2=M\frac{di_1}{dt}+L_2\frac{di_2}{dt}$ | 式 (10.28) | 359 | [378](/native-workbench?page=378) |

## 第 11 章：供电、可靠性、时钟与 PLL

**原书范围：** 印刷第 367—399 页

| 公式名称 | 对应公式 | 原书式号／图例 | 印刷页 | PDF 页序 · 校对页 |
|---|---|---|---:|---|
| **目标供电阻抗**<br>$\delta$ 为允许噪声比例 | $Z_{target}=\frac{V_{DD}\,\delta}{I_{DD}}$ | 式 (11.1) | 368 | [387](/native-workbench?page=387) |
| **电源阻抗压降**<br>一阶 R/L 模型 | $V=IR+L\frac{di}{dt}$ | 式 (11.2) | 368 | [387](/native-workbench?page=387) |
| **电迁移寿命（Black 经验式）**<br>电流密度 $J$、绝对温度 $T$ | $MTTF=\frac{A}{J^2}\exp(\frac{\Delta H}{kT})$ | 式 (11.3) | 371 | [390](/native-workbench?page=390) |
| **最大时钟周期约束**<br>教材给定正向偏斜定义 | $T_{cycle}=T_{clk-q}+T_{DMAX}+T_{setup}+T_{skew}$ | 式 (11.6) | 381 | [400](/native-workbench?page=400) |
| **保持时间约束**<br>按原书的偏斜符号 | $T_{skew}+T_{hold}<T_{clk-q}+T_{DMIN}$ | 式 (11.7) | 381 | [400](/native-workbench?page=400) |
| **时钟树 RMS 电迁移判据**<br>不等式表示违规判据，不是安全条件 | $J_{rms}>J_{AC,max}$ | 式 (11.8) | 388 | [407](/native-workbench?page=407) |
| **VCO 相位**<br>振荡器相位为频率积分 | $\theta(t)=\int\omega(t)\,dt$ | §11.4.1 | 392 | [411](/native-workbench?page=411) |
| **PLL 相位检测器**<br>小信号线性化模型 | $v_d=K_{PD}(\theta_{in}-\theta_{out})$ | §11.4.1 | 392 | [411](/native-workbench?page=411) |
| **奇数级环形 VCO 频率**<br>奇数个反相级、单级延迟 $\tau$ | $f=\frac1{2N\tau}$ | 图 11.41 所在页 | 394 | [413](/native-workbench?page=413) |


## 第 8、9 章的定位说明

原书这两章主要以**存储单元结构、译码、存储器类型及设计实例**说明电路方法，不像第 2、6、10 章连续给出大量解析方程。本表保留已核对的位线充放电、SRAM 经验尺寸比以及逻辑例式，不给其余结构图虚构“万能公式”或原书式号。

## 高频适用条件

- **馈通与电荷分享（第 7 章）**：简单电容网络的理想结果；实际传输门还存在电荷注入与漏电。
- **SRAM 驱动比（第 8 章）**：式 (8.4) 的 1.5 是教材经验比，不适用于所有工艺。
- **Elmore 与实际 50% 延迟（第 10 章）**：$\frac12R_{wire}C_{wire}$ 是一阶矩，$0.38R_{wire}C_{wire}$ 是均匀 RC 线的近似 50% 延迟，两者不能互换。
- **邻线耦合（第 10 章）**：邻线静止、同向、反向的等效负载不同。
- **建立/保持时间（第 11 章）**：偏斜符号和正负方向遵循原书定义，做 STA 时须统一发射与捕获时钟约定。


**本页 48 项**；与[第 1—6 章 97 项](/reference/formula-index)共 **145 项**公式和公式组。

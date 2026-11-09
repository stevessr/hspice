# 第1—4章：HSPICE 六组可复现仿真实验

前四章的计算题不能只停留在公式代入。这里给出六份独立可修改的网表，按 **RC 延迟 → MOS 工作区 → 体效应 → 互连寄生 → CMOS 静态 VTC → CMOS 瞬态** 组织。

这些示例使用标准电路元件和 `LEVEL=1` 教学模型，**不依赖外部工艺库**，模型中的 $V_T$、$K_P$ 等参数只为教学设定，不能当作上传教材所讨论工艺节点的实测数值。CI 只执行网表的静态检查，实际数值波形需要在本机 HSPICE 验证。

## 实验列表与下载

| 编号 | 知识点 | 对应自编题 | 获取网表 |
|---|---|---|---|
| 01 | RC 阶跃、50% 延迟 | S1-08 / S1-11 | [RC 阶跃实验](https://raw.githubusercontent.com/stevessr/hspice/main/study/midterm/review-1to4/netlists/01-rc-step.sp) |
| 02 | NMOS $I_{DS}$–$V_{DS}$ 特性曲线族 | S2-01～03 | [NMOS 输出特性](https://raw.githubusercontent.com/stevessr/hspice/main/study/midterm/review-1to4/netlists/02-nmos-ids-vds.sp) |
| 03 | 体效应、阈值电压漂移 | S2-06 / S2-12 | [体效应扫描](https://raw.githubusercontent.com/stevessr/hspice/main/study/midterm/review-1to4/netlists/03-nmos-body-effect.sp) |
| 04 | 集中与分布互连寄生 RC | S3-04 / S3-12 | [互连 RC 比较](https://raw.githubusercontent.com/stevessr/hspice/main/study/midterm/review-1to4/netlists/04-distributed-rc.sp) |
| 05 | CMOS 静态反相器、开关点 | S4-05～08 | [CMOS VTC](https://raw.githubusercontent.com/stevessr/hspice/main/study/midterm/review-1to4/netlists/05-cmos-vtc.sp) |
| 06 | CMOS 瞬态、延迟及平均电源电流 | S4-09 / S4-12 | [CMOS 瞬态](https://raw.githubusercontent.com/stevessr/hspice/main/study/midterm/review-1to4/netlists/06-cmos-transient.sp) |

[GitHub 中的六份原始 `.sp` 文件](https://github.com/stevessr/hspice/tree/main/study/midterm/review-1to4/netlists) · [专项复习首页](/review-1to4/) · [48题交互刷题](/review-1to4/interactive)

## 在 HSPICE / AvanWaves 中运行

1. 将单份 `.sp` 网表下载到独立的可写目录；HSPUI 可直接打开网表并启动仿真。命令行环境中也可使用 `hspice 05-cmos-vtc.sp -o vtc`。
2. 检查生成的 `.lis` 文件是否有模型、语法或测量错误。`.OPTION POST=2` 和 `.PROBE` 已在网表中启用波形输出。
3. 在 AvanWaves 中查看 DC 扫描的 `.sw0` 或瞬态分析的 `.tr0` 波形，比较节点电压、电源电流和 `.MEASURE` 输出。
4. 一次只修改一个变量（例如 $W/L$、$V_{SB}$、$R$、$C_L$），把原始结果与修改结果分开保存，确保对比有意义。

> **电流方向：** SPICE 电压源电流以流入电压源正端为正。源给 NMOS 供电时 `I(VDS)` 通常为负，应使用 `-I(VDS)` 阅读正向漏电流；电源消耗功率也应结合电流符号解释。

## 01 · RC 阶跃与 50% 延迟（第1章）

串联电阻 $R=10\,k\Omega$，负载电容 $C=100\,fF$。输入在 1 ns 后由 0 V 上升至 1.2 V。

$$\tau=RC=1.00\,ns,\qquad t_{50\%}=\ln 2\,RC\approx0.693\,ns.$$

观察 `V(in)` 和 `V(out)` 的 50% 交点；`T50` 是相对输入交点的延迟。有限的输入上升时间会造成轻微偏差。把 `CLOAD` 从 100 fF 改为 200 fF 后重复实验，验证一阶模型中延迟约翻倍。

## 02 · NMOS 输出特性曲线族（第2章）

`.DC` 双重扫描以 $V_{DS}=0\sim1.2$ V 为内层、$V_{GS}=0.4\sim1.2$ V 为外层。教学模型设 $V_{T0}=0.4$ V、$K_P=200\,\mu A/V^2$、$W/L=10$、$\lambda=0$。

$$I_{D,sat}=\frac{K_P}{2}\frac WL(V_{GS}-V_T)^2.$$

例如 $V_{GS}=1.0$ V 时，$V_{OV}=0.6$ V，理想饱和电流为 **360 μA**。分别定位截止区、线性区和饱和区，验证分界约为 $V_{DS}=V_{OV}$。把 `LAMBDA=0` 修改为 `0.05`，观察饱和区斜率的变化。

## 03 · NMOS 体效应（第2章）

源极接地，体端从 −0.6 V 扫至 0 V，因此 $V_{SB}=-V(body)$。漏极固定为 0.05 V，同时扫描 $V_{GS}$。

$$V_T=V_{T0}+\gamma\left(\sqrt{\Phi+V_{SB}}-\sqrt{\Phi}\right).$$

取 $\gamma=0.45\sqrt V$、$\Phi=0.7$ V，$V_{SB}=0.6$ V 时理论阈值约为 **0.536 V**。体端相对源端更负，应观察到 $I_D$–$V_{GS}$ 曲线向更高栅压偏移。注意 `VBODY` 是对地电压而不是 $V_{SB}$ 本身。

## 04 · 分布式与集中式互连 RC（第3章）

两条并联的受激支路都具有**总电阻 10 kΩ、总电容 100 fF**：

- 集中支路：一只 10 kΩ 电阻和末端 100 fF 电容。
- 分布支路：5 段 2 kΩ 电阻串联，每段末端各有 20 fF 对地电容。

查看 `V(lumped)`、`V(distributed)`，以及测量值 `TLUMP`、`TDIST`。总 $RC$ 一致不代表响应一致，因为分布电容的位置会改变 Elmore 延迟和暂态波形。与第3章互连电阻、电容的建模方法对应。

## 05 · CMOS 静态 VTC（第4章）

NMOS：$K_{Pn}=200\,\mu A/V^2$、$W_n/L_n=0.4/0.2$；PMOS：$K_{Pp}=100\,\mu A/V^2$、$W_p/L_p=0.8/0.2$。两管的 $\beta$ 均为 $400\,\mu A/V^2$，且阈值幅值同为 0.4 V。

理想长沟道模型预期 $V_M\approx V_{DD}/2=0.6$ V。通过 `V(out)` 对 `V(in)` 的曲线找交点；找到斜率约为 −1 的两侧位置，进一步估算 $V_{IL}$、$V_{IH}$ 与噪声容限。

**参数实验：** 将 PMOS 宽度分别改为 0.4 μm 和 1.6 μm，比较 VTC 的水平移动方向，并解释 $\beta_p/\beta_n$ 改变的原因。

## 06 · CMOS 瞬态与 50% 延迟（第4章）

输入脉冲周期为 2 ns，输出负载 $C_L=20$ fF。`.MEASURE` 使用第二次输入上升/下降和对应输出下降/上升的 50% 交点，计算 `TPHL`、`TPLH`，再由

$$t_p=\frac{t_{pHL}+t_{pLH}}2$$

求平均传播延迟。`IAVG` 是 2～10 ns 之间电源的平均电流，其值可能为负，因此

$$P_{avg}\approx -1.2\,V\times IAVG.$$

**参数实验：** 加倍 `CLOAD` 比较延迟；再同比例加倍 NMOS/PMOS 宽度，观察前后级负载和本级驱动的权衡。

## 替换真实课程工艺库

示例默认自带 `.MODEL NMTEST NMOS (LEVEL=1 ...)` 和对应 PMOS 模型。换成课程的 `c18vmos001.lib`、`N_18_LL` 等器件时：

- 若库里声明为 `.MODEL`，使用 `M` 元件，节点依次是 D G S B。
- 若库里声明为 `.SUBCKT`，使用 `X` 元件，实际端口顺序和宽长参数以库内定义为准。
- 相应替换 `.LIB` 模型角、器件名、电源电压与几何限制后才可对照 TT/FF/SS 等实际工艺曲线。LEVEL 1 的公式结果不等于 BSIM3/实际 PDK 的结果。

**验证说明：** 本仓库自动检查网表文件、器件模型引用和分析命令；这里提供的是可用于 HSPICE 的教学输入，尚未把实际运行结果冒充为已完成的仿真验证。

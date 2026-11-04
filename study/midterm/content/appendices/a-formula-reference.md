# 常用公式速查

| **主题**           | **表达式与使用范围**                                                       |
|:-------------------|:---------------------------------------------------------------------------|
| **主题**           | **表达式与使用范围**                                                       |
| NMOS 端口电压      | $V_{GS}=V_G-V_S,\;V_{DS}=V_D-V_S,\;V_{SB}=V_S-V_B$                         |
| 过驱动电压         | $V_{OV}=V_{GS}-V_{TH}$                                                     |
| 线性区电流         | $I_D\approx\mu_nC_{ox}(W/L)[V_{OV}V_{DS}-V_{DS}^2/2]$                      |
| 饱和区电流         | $I_D\approx\tfrac12\mu_nC_{ox}(W/L)V_{OV}^2$                               |
| 沟道长度调制       | $I_D\approx I_{D0}(1+\lambda V_{DS})$；$\lambda$ 的单位为 $\mathrm V^{-1}$ |
| 两点法求 $\lambda$ | $\lambda=(I_2-I_1)/(I_1V_2-I_2V_1)$；保持相同栅／体偏置并选饱和段          |
| 体效应             | $V_{TH}=V_{TH0}+\gamma[\sqrt{2\phi_F+V_{SB}}-\sqrt{2\phi_F}]$              |
| 电阻负载线         | $I_D=(V_{DD}-V_{out})/R_L$                                                 |
| 噪声容限           | $NM_L=V_{IL}-V_{OL},\ NM_H=V_{OH}-V_{IH}$                                  |
| 电容电流           | $I_C=C\,dV/dt$                                                             |
| CMOS 动态功耗      | $P_{dyn}\approx\alpha C_L V_{DD}^2 f+P_{sc}$；写明 $\alpha$ 口径           |
| 一阶传播延迟       | $t_p\approx0.69 R_{eq}C_L$；单阶 RC 的近似                                 |
| 逻辑转换点         | $V_{out}(V_M)=V_M$                                                         |
| JK 特征方程        | $Q^+=J\bar Q+\bar KQ$                                                      |
| XOR／XNOR          | $A\oplus B=\bar AB+A\bar B$，$\overline{A\oplus B}=AB+\bar A\bar B$        |
| MUX 选路           | $F=AS+B\bar S$，本讲义约定 $S=1$ 选择 A                                    |

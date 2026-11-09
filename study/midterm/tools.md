# 在线工具箱

学习资料与运行工具分离：理论讲义放在[学习目录](/content/00-reading-guide)，图例、公式和术语放在[速查中心](/reference/)；**互动、自测、在线阅读及校对工作台**集中在这里。

<script setup lang="ts">
import ToolsHub from './.vitepress/theme/ToolsHub.vue'
</script>

<ToolsHub />

## 推荐使用流程

1. **理解概念**：先读[系统复习讲义](/content/00-reading-guide)，不熟悉的电路图或术语可通过[教材图例速查](/reference/figures)定位原书页码。
2. **验证模型**：在[浏览器电路实验](/review-1to4/online-lab)中调整参数；需要真实 PDK 的结果，再按[HSPICE 仿真实验指导](/review-1to4/simulations)运行本地仿真。
3. **巩固练习**：完成[在线自测](/quiz)或[分专题实践题库](/content/practice/)。
4. **校对教材**：从[Typst 阅读器](/native-typst)定位重排页，进入[逐页校对工作台](/native-workbench)编辑，最后核对[质量验收状态](/fidelity)。

站点内的 Typst 预览展示的是**可编辑重排稿**，不等同于教材原扫描图；严格 1:1 的核验状态单独记录。HSPICE 仿真指导提供网表和步骤，本网站的交互电路模型则直接在浏览器中运行。

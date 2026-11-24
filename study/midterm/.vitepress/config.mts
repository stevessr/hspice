import { defineConfig } from 'vitepress'

// Keep all interactive readers, experiments and editorial tools in one place.
// Existing page URLs remain unchanged; only navigation is consolidated.
const toolsSidebar = [
  { text: '工具入口', items: [
    { text: '工具箱总览', link: '/tools' },
    { text: '在线自测', link: '/quiz' },
    { text: '交互式电路实验', link: '/review-1to4/online-lab' },
    { text: 'HSPICE 仿真实践', link: '/review-1to4/simulations' }
  ] },
  { text: '阅读与预览', collapsed: true, items: [
    { text: 'PDF 资料库', link: '/pdf' },
    { text: 'Typst 网页阅读器', link: '/native-typst' }
  ] },
  { text: '排版与校对', collapsed: true, items: [
    { text: '445 页逐页校对工作台', link: '/native-workbench' },
    { text: '原书重排质量验收', link: '/fidelity' }
  ] }
]

export default defineConfig({
  lang: 'zh-CN',
  title: '电子信息与集成电路 · 复习资料',
  description: 'MOS、CMOS、HSPICE 课程复习：分章阅读、实践训练与 PDF 在线预览。',
  base: '/hspice/',
  cleanUrls: true,
  lastUpdated: false,
  ignoreDeadLinks: false,
  markdown: { math: true, image: { lazyLoad: true } },
  head: [
    ['meta', { name: 'theme-color', content: '#24668d' }]
  ],
  themeConfig: {
    siteTitle: '集成电路复习',
    nav: [
      { text: '首页', link: '/' },
      { text: '学习', items: [
        { text: '系统复习导读', link: '/content/00-reading-guide' },
        { text: '第 1—4 章专项', link: '/review-1to4/' },
        { text: '教材复习精编', link: '/textbook' }
      ] },
      { text: '速查', items: [
        { text: '全部速查资料', link: '/reference/' },
        { text: '按题型考前速查', link: '/reference/exam-sheet' },
        { text: '145 项公式检索与默写', link: '/reference/formula-finder' },
        { text: '教材图例图库', link: '/reference/figures' },
        { text: '公式速查表', link: '/reference/formula-index' },
        { text: '专业术语', link: '/reference/terms-device-process' },
        { text: '数据与模型参数', link: '/reference/data-tables' },
        { text: '电路结构图解', link: '/figures' }
      ] },
      { text: '练习', items: [
        { text: '实践题库', link: '/content/practice/' },
        { text: '前四章交互训练', link: '/review-1to4/interactive' },
        { text: '进阶习题', link: '/review-1to4/advanced' }
      ] },
      { text: '工具箱', items: [
        { text: '全部在线工具', link: '/tools' },
        { text: '互动学习', items: [
          { text: '在线自测', link: '/quiz' },
          { text: '电路实验', link: '/review-1to4/online-lab' },
          { text: 'HSPICE 仿真', link: '/review-1to4/simulations' }
        ] },
        { text: '阅读与校对', items: [
          { text: 'PDF 分章阅读', link: '/pdf' },
          { text: 'Typst 网页阅读器', link: '/native-typst' },
          { text: '逐页校对工作台', link: '/native-workbench' },
          { text: '原书重排质量', link: '/fidelity' }
        ] }
      ] }
    ],
    sidebar: {
      '/reference/': [
        { text: '资料总览', items: [
          { text: '打开速查中心', link: '/reference/' }
        ] },
        { text: '图例与数据', items: [
          { text: '图例速查图库', link: '/reference/figures' },
          { text: '全书图号与图注', link: '/reference/figures-catalog' },
          { text: '教材数据与参数表', link: '/reference/data-tables' }
        ] },
        { text: '公式速查', collapsed: true, items: [
          { text: '按式号检索与默写', link: '/reference/formula-finder' },
          { text: '按题型考前速查', link: '/reference/exam-sheet' },
          { text: '第 1—6 章（97 项）', link: '/reference/formula-index' },
          { text: '第 7—11 章（48 项）', link: '/reference/formula-index-systems' },
          { text: '模型条件与 HSPICE 参数', link: '/reference/formulas-models' }
        ] },
        { text: '专业术语', collapsed: true, items: [
          { text: '器件与工艺（193 条）', link: '/reference/terms-device-process' },
          { text: '电路与系统（186 条）', link: '/reference/terms-circuits-systems' }
        ] }
      ],
      '/review-1to4/': [
        { text: '复习路线', items: [
          { text: '专项复习总览', link: '/review-1to4/' },
          { text: '计算方法', link: '/review-1to4/calculation-methods' },
          { text: '教材原例题定位', link: '/review-1to4/textbook-examples' },
          { text: '工艺流程与数据表', link: '/review-1to4/technology-tables' }
        ] },
        { text: '练习与解析', collapsed: true, items: [
          { text: '四章交互练习（80 题）', link: '/review-1to4/interactive' },
          { text: '32 道进阶题目', link: '/review-1to4/advanced' },
          { text: '公式与习题索引', link: '/review-1to4/reference' }
        ] },
        { text: '互动与仿真', collapsed: true, items: [
          { text: '电路交互实验', link: '/review-1to4/online-lab' },
          { text: '六组 HSPICE 仿真', link: '/review-1to4/simulations' },
          { text: '全部在线工具', link: '/tools' }
        ] },
        { text: '第1章 深亚微米数字集成电路设计', collapsed: true, items: [
          { text: '知识讲义', link: '/review-1to4/01-notes' },
          { text: '12道习题', link: '/review-1to4/01-exercises' },
          { text: '答案解析', link: '/review-1to4/01-answers' },
          { text: '章节交互20题', link: '/review-1to4/interactive-01' },
          { text: '进阶习题8题', link: '/review-1to4/advanced-01-exercises' },
          { text: '进阶详细解析', link: '/review-1to4/advanced-01-answers' }
        ] },
        { text: '第2章 MOS 晶体管', collapsed: true, items: [
          { text: '知识讲义', link: '/review-1to4/02-notes' },
          { text: '12道习题', link: '/review-1to4/02-exercises' },
          { text: '答案解析', link: '/review-1to4/02-answers' },
          { text: '章节交互20题', link: '/review-1to4/interactive-02' },
          { text: '进阶习题8题', link: '/review-1to4/advanced-02-exercises' },
          { text: '进阶详细解析', link: '/review-1to4/advanced-02-answers' }
        ] },
        { text: '第3章 制造、版图和模拟', collapsed: true, items: [
          { text: '知识讲义', link: '/review-1to4/03-notes' },
          { text: '12道习题', link: '/review-1to4/03-exercises' },
          { text: '答案解析', link: '/review-1to4/03-answers' },
          { text: '章节交互20题', link: '/review-1to4/interactive-03' },
          { text: '进阶习题8题', link: '/review-1to4/advanced-03-exercises' },
          { text: '进阶详细解析', link: '/review-1to4/advanced-03-answers' }
        ] },
        { text: '第4章 MOS 反相器电路', collapsed: true, items: [
          { text: '知识讲义', link: '/review-1to4/04-notes' },
          { text: '12道习题', link: '/review-1to4/04-exercises' },
          { text: '答案解析', link: '/review-1to4/04-answers' },
          { text: '章节交互20题', link: '/review-1to4/interactive-04' },
          { text: '进阶习题8题', link: '/review-1to4/advanced-04-exercises' },
          { text: '进阶详细解析', link: '/review-1to4/advanced-04-answers' }
        ] },
      ],
      '/tools': toolsSidebar,
      '/fidelity': toolsSidebar,
      '/native-workbench': toolsSidebar,
      '/native-typst': toolsSidebar,
      '/pdf': toolsSidebar,
      '/textbook': [
        { text: 'Typst 教材复习精编', items: [
          { text: '教材九章索引', link: '/textbook' },
          { text: 'PDF 分章阅读', link: '/pdf' },
          { text: '课程实验索引', link: '/content/appendices/d-experiment-index' }
        ]}
      ],
      '/figures': [
        { text: '电路图解', items: [
          { text: '图解总览', link: '/figures' },
          { text: '教材图例速查图库', link: '/reference/figures' },
          { text: 'MOS 基础', link: '/content/chapters/02-mos-basics' },
          { text: '反相器', link: '/content/chapters/04-inverters-noise' },
          { text: '逻辑门', link: '/content/chapters/06-combinational-logic' },
          { text: '时序电路', link: '/content/chapters/07-sequential-logic' }
        ]}
      ],
      '/quiz': toolsSidebar,
      '/content/practice/': [
        {
          text: '实践题库',
          items: [
            { text: '练习说明与索引', link: '/content/practice/' },
            { text: '一 · MOS 工作区域与参数', link: '/content/practice/01-mos' },
            { text: '二 · 反相器与功耗', link: '/content/practice/02-inverter' },
            { text: '三 · CMOS 组合逻辑', link: '/content/practice/03-logic' },
            { text: '四 · 时序逻辑', link: '/content/practice/04-sequential' },
            { text: '五 · HSPICE 网表与调试', link: '/content/practice/05-hspice' }
          ]
        },
        {
          text: '参考解答（建议先独立完成）', collapsed: true,
          items: [
            { text: '一 · MOS 参考解答', link: '/content/practice/answers/01-mos' },
            { text: '二 · 反相器参考解答', link: '/content/practice/answers/02-inverter' },
            { text: '三 · 组合逻辑参考解答', link: '/content/practice/answers/03-logic' },
            { text: '四 · 时序逻辑参考解答', link: '/content/practice/answers/04-sequential' },
            { text: '五 · HSPICE 参考解答', link: '/content/practice/answers/05-hspice' }
          ]
        }
      ],
      '/content/': [
        { text: '导读', items: [{ text: '复习说明', link: '/content/00-reading-guide' }] },
        { text: '基础理论与器件', items: [
          { text: '01 知识结构', link: '/content/chapters/01-knowledge-map' },
          { text: '02 MOS 晶体管', link: '/content/chapters/02-mos-basics' },
          { text: '03 器件参数', link: '/content/chapters/03-device-parameters' }
        ]},
        { text: '电路分析', items: [
          { text: '04 反相器与噪声', link: '/content/chapters/04-inverters-noise' },
          { text: '05 功耗与延迟', link: '/content/chapters/05-power-delay' },
          { text: '06 CMOS 逻辑', link: '/content/chapters/06-combinational-logic' },
          { text: '07 时序电路', link: '/content/chapters/07-sequential-logic' }
        ]},
        { text: '仿真与习题', items: [
          { text: '08 HSPICE 网表', link: '/content/chapters/08-hspice-netlists' },
          { text: '09 典型题型', link: '/content/chapters/09-practice' },
          { text: '分专题实践题库', link: '/content/practice/' },
          { text: '电路图解总览', link: '/figures' },
          { text: '在线自测', link: '/quiz' }
        ]},
        { text: '附录（速查）', collapsed: true, items: [
          { text: 'A 常用公式', link: '/content/appendices/a-formula-reference' },
          { text: 'B 真值表', link: '/content/appendices/b-truth-tables' },
          { text: 'C HSPICE 指令', link: '/content/appendices/c-hspice-quick-reference' },
          { text: 'D 实验索引', link: '/content/appendices/d-experiment-index' },
          { text: 'E 资料疑点', link: '/content/appendices/e-source-discrepancies' },
          { text: 'F 考前检查', link: '/content/appendices/f-checklist' }
        ]}
      ]
    },
    search: { provider: 'local' },
    outline: { level: [2, 3], label: '本页目录' },
    docFooter: { prev: '上一节', next: '下一节' },
    returnToTopLabel: '返回顶部',
    sidebarMenuLabel: '目录',
    darkModeSwitchLabel: '外观',
    socialLinks: [{ icon: 'github', link: 'https://github.com/stevessr/hspice' }],
    editLink: { pattern: 'https://github.com/stevessr/hspice/edit/main/study/midterm/:path', text: '在 GitHub 上编辑本页' },
    footer: { message: '内容与习题按课程实验资料整理；题目为自编训练，并非正式试卷。', copyright: 'HSPICE 课程复习资料' }
  }
})

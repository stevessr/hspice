import { defineConfig } from 'vitepress'

export default defineConfig({
  lang: 'zh-CN',
  title: '电子信息与集成电路 · 复习资料',
  description: 'MOS、CMOS、HSPICE 课程复习：分章阅读、实践训练与 PDF 在线预览。',
  base: '/hspice/',
  cleanUrls: true,
  lastUpdated: false,
  ignoreDeadLinks: false,
  head: [
    ['meta', { name: 'theme-color', content: '#24668d' }]
  ],
  themeConfig: {
    siteTitle: '集成电路复习',
    nav: [
      { text: '首页', link: '/' },
      { text: '系统复习', link: '/content/00-reading-guide' },
      { text: '实践题库', link: '/content/practice/' },
      { text: 'PDF 在线预览', link: '/pdf' },
      { text: 'GitHub 仓库', link: 'https://github.com/stevessr/hspice' }
    ],
    sidebar: {
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
          { text: '分专题实践题库', link: '/content/practice/' }
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

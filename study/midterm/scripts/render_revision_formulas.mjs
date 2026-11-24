#!/usr/bin/env node
/**
 * Pre-render mathematical expressions as self-contained MathJax SVG during
 * the Pages build so filtered Vue cards don't require client-side MathJax.
 * Inputs are only locally generated, versioned source-index entries.
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { dirname, resolve } from 'node:path'
import MarkdownIt from 'markdown-it'
import mathjax3 from 'markdown-it-mathjax3'

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..')
const input = resolve(root, 'public/review-formulas.json')
const data = JSON.parse(readFileSync(input, 'utf8'))
if (data.format !== 'hspice-revision-formula-index-v1' || data.total !== 145 ||
    !Array.isArray(data.entries)) {
  throw new Error('Unexpected source-derived formula index')
}
const md = new MarkdownIt({ html: false }).use(mathjax3, { svg: { fontCache: 'local' } })
const errors = []
for (const item of data.entries) {
  const html = md.renderInline('$' + item.latex + '$').trim()
  if (!html.includes('<svg') || !html.includes('</svg>')) {
    errors.push(item.name + ' (PDF ' + item.pdf_page + ')')
  }
  item.html = html
}
if (errors.length) {
  throw new Error('MathJax rendering missing SVG: ' + errors.join('; '))
}
writeFileSync(input, JSON.stringify(data) + '\n', 'utf8')
console.log('Pre-rendered ' + data.entries.length + ' formula SVGs for client-side filters')

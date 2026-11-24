/**
 * Pure validation and path helpers for the public Typst proofreading workbench.
 * Kept independent of Vue and browser globals so CI can regression-test them.
 */
export const REVIEW_SCHEMA = 'hspice-native-review-v2'
export const MAX_PAGE_SOURCE_BYTES = 1024 * 1024
export const MAX_ARCHIVE_BYTES = 256 * 1024 * 1024
export const PAGE_COUNT = 445

export function isSourcePage(page) {
  return Number.isInteger(page) && page >= 1 && page <= PAGE_COUNT
}

export function assembleTypstDocument(wrapper, source) {
  if (typeof source !== 'string' || typeof wrapper !== 'string') {
    throw Error('Typst 来源或版式包装不是文本')
  }
  if (new TextEncoder().encode(source).byteLength > MAX_PAGE_SOURCE_BYTES) {
    throw Error('页面源码过大，无法在浏览器安全编译')
  }
  const matches = [...wrapper.matchAll(/#include\s+"[^"]+\.typ"/g)]
  if (matches.length !== 1) throw Error('版式包装必须恰好包含一个页面 #include')
  // Rebase imports because the page is temporarily inlined at the project root.
  const rewritten = source.replace(/(#(?:import|include)\s*")\.\.\/figures\//g, '$1figures/')
  return wrapper.replace(matches[0][0], rewritten)
}

export function referencedFigureFiles(content, parent = '') {
  const refs = [...content.matchAll(/#(?:import|include)\s+"([^"]+\.typ)"/g)]
  return refs.map(([, value]) => {
    if (value.startsWith('/') || value.includes('\\')) return null
    const parts = []
    for (const component of (parent + '/' + value).split('/')) {
      if (!component || component === '.') continue
      if (component === '..') {
        if (!parts.length) return null
        parts.pop()
      } else parts.push(component)
    }
    const path = parts.join('/')
    return path.startsWith('figures/') ? path : null
  }).filter(Boolean)
}

export function validateReviewPatch(raw) {
  if (!raw || typeof raw !== 'object' || Array.isArray(raw) || raw.schema !== REVIEW_SCHEMA) {
    throw Error('修改补丁格式不受支持')
  }
  if (!Array.isArray(raw.edits) || raw.edits.length > PAGE_COUNT) throw Error('补丁页码或数量无效')
  if (!Array.isArray(raw.preliminarily_reviewed) || raw.preliminarily_reviewed.length > PAGE_COUNT) {
    throw Error('初检标记数量无效')
  }
  const drafts = Object.create(null)
  for (const edit of raw.edits) {
    if (!edit || !isSourcePage(edit.pdf_page) || typeof edit.typst !== 'string') {
      throw Error('存在非法的页码或 Typst 文本')
    }
    const key = String(edit.pdf_page)
    if (Object.hasOwn(drafts, key)) throw Error('补丁包含重复页码：' + key)
    if (new TextEncoder().encode(edit.typst).byteLength > MAX_PAGE_SOURCE_BYTES) {
      throw Error('第 ' + key + ' 页源码超出 1 MiB 限制')
    }
    drafts[key] = edit.typst
  }
  const preliminary = [...new Set(raw.preliminarily_reviewed)]
  if (!preliminary.every(isSourcePage)) throw Error('补丁包含无效初检页码')
  return { drafts, preliminary }
}

export function serializeReviewPatch(drafts, preliminary) {
  return {
    schema: REVIEW_SCHEMA,
    note: '浏览器初检不是整页 1:1 验收；修改须提交源码审查和复现证据',
    edits: Object.entries(drafts)
      .filter(([page, value]) => isSourcePage(Number(page)) && typeof value === 'string')
      .map(([page, typst]) => ({ pdf_page: Number(page), typst }))
      .sort((a, b) => a.pdf_page - b.pdf_page),
    preliminarily_reviewed: [...new Set(preliminary)].filter(isSourcePage).sort((a, b) => a - b)
  }
}

import test from 'node:test'
import assert from 'node:assert/strict'
import {
  assembleTypstDocument, referencedFigureFiles, isSourcePage,
  validateReviewPatch, serializeReviewPatch, REVIEW_SCHEMA
} from '../.vitepress/theme/native-review-core.mjs'

test('445-page bounds reject nonintegral and out-of-range pages', () => {
  assert.equal(isSourcePage(1), true)
  assert.equal(isSourcePage(445), true)
  assert.equal(isSourcePage(446), false)
  assert.equal(isSourcePage(2.1), false)
})

test('inject exactly one page into original print-sized wrapper', () => {
  const wrapper = '#set page(width: 506pt)\n#include "05-page-024.typ"\n'
  const source = '#import "../figures/gate-symbols.typ": gate-symbol\n= 示例'
  const result = assembleTypstDocument(wrapper, source)
  assert.ok(result.startsWith('#set page(width: 506pt)'))
  assert.match(result, /#import "figures\/gate-symbols\.typ"/)
  assert.doesNotMatch(result, /#include "05-page-024\.typ"/)
  assert.throws(() => assembleTypstDocument('No include', source), /#include/)
  assert.throws(() => assembleTypstDocument(wrapper + '#include "again.typ"', source), /#include/)
})

test('nested figure imports resolve within site-owned figure directory only', () => {
  const text = '#import "figures/gate.typ": gate\n#include "/etc/passwd.typ"\n#import "../outside.typ": bad'
  assert.deepEqual(referencedFigureFiles(text), ['figures/gate.typ'])
  assert.deepEqual(referencedFigureFiles('#import "../shared.typ": shared', 'figures/ch5'), ['figures/shared.typ'])
  assert.deepEqual(referencedFigureFiles('#import "../../secrets.typ": x', 'figures/ch5'), [])
})

test('patch round-trip with sorted pages and local preliminary markers', () => {
  const patch = serializeReviewPatch({ '180': '= AOI22', '3': '= 版权页' }, [180, 3, 3])
  assert.equal(patch.schema, REVIEW_SCHEMA)
  assert.deepEqual(patch.edits.map(x => x.pdf_page), [3, 180])
  assert.deepEqual(patch.preliminarily_reviewed, [3, 180])
  const imported = validateReviewPatch(patch)
  assert.equal(imported.drafts['180'], '= AOI22')
  assert.deepEqual(imported.preliminary, [3, 180])
})

test('reject corrupted, duplicate and oversized patches', () => {
  const base = { schema: REVIEW_SCHEMA, edits: [{ pdf_page: 3, typst: 'Hello' }], preliminarily_reviewed: [] }
  assert.throws(() => validateReviewPatch({ ...base, schema: 'other' }), /格式/)
  assert.throws(() => validateReviewPatch({ ...base, edits: [base.edits[0], base.edits[0]] }), /重复/)
  assert.throws(() => validateReviewPatch({ ...base, edits: [{ pdf_page: 446, typst: 'Hi' }] }), /非法/)
  assert.throws(() => validateReviewPatch({ ...base, edits: [{ pdf_page: 2, typst: 'X'.repeat(1024*1024 + 1) }] }), /1 MiB/)
  assert.throws(() => validateReviewPatch({ ...base, preliminarily_reviewed: [0] }), /无效/)
})

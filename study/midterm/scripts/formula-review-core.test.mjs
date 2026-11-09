import assert from 'node:assert/strict'
import test from 'node:test'
import {
  DAY_MS, RETRY_MS, STORAGE_FORMAT, decodeProgress, encodeProgress,
  recordAnswer, isDue, reviewStats, matchesStatus, filterFormulaEntries,
  shuffleEntries, selectSession
} from '../.vitepress/theme/formula-review-core.mjs'

const NOW = Date.UTC(2026, 10, 9)
const example = [
  { id:'f-1', name:'体效应', note:'NMOS 反向体偏置', latex:'V_T=V_{T0}+...', original_label:'式 (2.11)', chapter:2, topic:'材料与 MOS 阈值', printed_page:38, pdf_page:57 },
  { id:'f-2', name:'沟道长度调制', note:'长沟道饱和区近似', latex:'I_{DS}=...', original_label:'式 (2.20)', chapter:2, topic:'MOS 电流', printed_page:43, pdf_page:62 },
  { id:'f-3', name:'NAND 延迟', note:'图示归纳', latex:'t_{pd}...', original_label:'图 5.1 附近', chapter:5, topic:'CMOS 逻辑', printed_page:150, pdf_page:169 }
]

test('recorded responses schedule retries and expanding intervals', () => {
  const again = recordAnswer(undefined, 'again', NOW)
  assert.equal(again.reviews, 1)
  assert.equal(again.lapses, 1)
  assert.equal(again.streak, 0)
  assert.equal(again.dueAt, NOW + RETRY_MS)
  const hard = recordAnswer(again, 'hard', NOW + 60_000)
  assert.equal(hard.dueAt, NOW + 60_000 + DAY_MS)
  assert.equal(hard.lapses, 1)
  let done = recordAnswer(hard, 'good', NOW + DAY_MS)
  assert.equal(done.streak, 1)
  assert.equal(done.dueAt, NOW + 2 * DAY_MS)
  for (let i = 2; i <= 12; i++) {
    done = recordAnswer(done, 'good', NOW + i * DAY_MS)
  }
  assert.equal(done.streak, 12)
  assert.equal(done.dueAt, NOW + 12 * DAY_MS + 60 * DAY_MS)
  assert.equal(recordAnswer(done, 'again', NOW).streak, 0)
})

test('invalid rating or timestamp cannot mutate review progress', () => {
  assert.throws(() => recordAnswer(null, 'unknown', NOW), TypeError)
  assert.throws(() => recordAnswer(null, 'good', Number.NaN), TypeError)
})

test('data survives encode/decode and rejects unsafe or unrelated IDs', () => {
  const records = { 'f-1': recordAnswer(undefined, 'good', NOW), 'gone': recordAnswer(undefined, 'again', NOW) }
  const restored = decodeProgress(encodeProgress(records), ['f-1','f-2'])
  assert.deepEqual(Object.keys(restored), ['f-1'])
  assert.equal(restored['f-1'].rating, 'good')
  assert.deepEqual(decodeProgress('not json', ['f-1']), {})
  assert.deepEqual(decodeProgress(JSON.stringify({ format:'outdated', records }), ['f-1']), {})
  assert.deepEqual(decodeProgress(JSON.stringify({
    format: STORAGE_FORMAT, records: { 'f-1': { ...records['f-1'], dueAt:'tomorrow' }}
  }), ['f-1']), {})
  assert.deepEqual(decodeProgress('x'.repeat(250_001), ['f-1']), {})
})

test('due and weak status are based on previous review rather than guesses', () => {
  const hard = recordAnswer(null, 'hard', NOW)
  const good = recordAnswer(null, 'good', NOW)
  assert.equal(isDue(hard, NOW + DAY_MS), true)
  assert.equal(isDue(hard, NOW), false)
  assert.equal(matchesStatus(undefined, 'new', NOW), true)
  assert.equal(matchesStatus(undefined, 'due', NOW), false)
  assert.equal(matchesStatus(hard, 'weak', NOW), true)
  assert.equal(matchesStatus(good, 'weak', NOW), false)
  assert.equal(matchesStatus(good, 'mastered', NOW), true)
  assert.equal(matchesStatus(hard, 'due', NOW + DAY_MS), true)
})

test('formula filtering combines chapter, original numbering, progress and search terms', () => {
  const records = { 'f-1': recordAnswer(null,'good',NOW),
    'f-2': recordAnswer(null,'hard',NOW - DAY_MS) }
  assert.deepEqual(filterFormulaEntries(example, records,
    { query:'2.11 nmOS', chapter:'2', kind:'numbered', now:NOW }).map(x=>x.id), ['f-1'])
  assert.deepEqual(filterFormulaEntries(example, records,
    { kind:'derived', now:NOW }).map(x=>x.id), ['f-3'])
  assert.deepEqual(filterFormulaEntries(example, records,
    { status:'weak', now:NOW }).map(x=>x.id), ['f-2'])
  assert.deepEqual(filterFormulaEntries(example, records,
    { status:'new', now:NOW }).map(x=>x.id), ['f-3'])
  assert.deepEqual(filterFormulaEntries(example, records,
    { status:'due', now:NOW }).map(x=>x.id), ['f-2'])
  assert.deepEqual(filterFormulaEntries(example, records,
    { query:'no such formula', now:NOW }), [])
})

test('summary counts reflect only cards in current textbook index', () => {
  const records = { 'f-1': recordAnswer(null,'good',NOW),
    'f-2': recordAnswer(null,'again',NOW - RETRY_MS),
    'unused': recordAnswer(null,'hard',NOW)}
  assert.deepEqual(reviewStats(example,records,NOW), {
    total:3, newCards:1, reviewed:2, due:1, weak:1, mastered:1
  })
})

test('randomized sessions are finite, deterministic with seeded RNG, and never mutate source', () => {
  const input = [...example]
  const random = () => 0
  const shuffled = shuffleEntries(input, random)
  assert.notDeepEqual(shuffled.map(x=>x.id), input.map(x=>x.id))
  assert.deepEqual(input, example)
  assert.equal(selectSession(input, 2, true, random).length, 2)
  assert.equal(selectSession(input, 30).length, 3)
  assert.deepEqual(selectSession(input, 2, false).map(x=>x.id), ['f-1','f-2'])
  assert.deepEqual(selectSession([], 10), [])
})

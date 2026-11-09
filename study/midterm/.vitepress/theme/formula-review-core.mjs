/**
 * Pure progress and selection logic for the source-linked formula revision cards.
 *
 * No network traffic, no accounts, no dependency on DOM/localStorage. The Vue
 * component opts in to local persistence and is responsible for accessibility.
 * Entry IDs are from the existing verified textbook formula index.
 */
export const STORAGE_KEY = 'hspice:formula-review:v1'
export const STORAGE_FORMAT = 'hspice-formula-review-progress-v1'
export const DAY_MS = 24 * 60 * 60 * 1000
export const RETRY_MS = 10 * 60 * 1000
export const GOOD_INTERVALS = [1, 3, 7, 14, 30, 60]

const RATINGS = new Set(['again', 'hard', 'good'])
const STATUSES = new Set(['all', 'new', 'due', 'weak', 'mastered'])

function isFiniteNonNegative(value) {
  return Number.isFinite(value) && value >= 0
}

/** Ignore unknown IDs, invalid timestamps, or malformed persisted records. */
export function decodeProgress(raw, validIds) {
  if (typeof raw !== 'string' || raw.length > 250_000) return {}
  let data
  try { data = JSON.parse(raw) } catch { return {} }
  if (!data || data.format !== STORAGE_FORMAT || !data.records ||
      typeof data.records !== 'object' || Array.isArray(data.records)) return {}
  const allowed = new Set(validIds)
  const out = {}
  for (const [id, record] of Object.entries(data.records)) {
    if (!allowed.has(id) || !record || !RATINGS.has(record.rating)) continue
    const keys = ['reviews', 'lapses', 'streak', 'reviewedAt', 'dueAt']
    if (!keys.every(k => isFiniteNonNegative(record[k]))) continue
    if (!['reviews', 'lapses', 'streak'].every(k =>
      Number.isInteger(record[k]) && record[k] <= 100_000)) continue
    if (record.reviews < 1 || record.lapses > record.reviews ||
        record.streak > record.reviews) continue
    out[id] = {
      reviews: record.reviews, lapses: record.lapses, streak: record.streak,
      reviewedAt: record.reviewedAt, dueAt: record.dueAt,
      rating: record.rating
    }
  }
  return out
}

export function encodeProgress(records) {
  return JSON.stringify({ format: STORAGE_FORMAT, records })
}

/** Again: retry in 10 min; hard: retry tomorrow; good: spaced 1/3/7/14/30/60 days. */
export function recordAnswer(previous, rating, now = Date.now()) {
  if (!RATINGS.has(rating) || !isFiniteNonNegative(now)) {
    throw new TypeError('invalid review rating or timestamp')
  }
  const reviews = (previous?.reviews || 0) + 1
  const lapses = (previous?.lapses || 0) + (rating === 'again' ? 1 : 0)
  const streak = rating === 'good' ? Math.min((previous?.streak || 0) + 1, 100_000) : 0
  const wait = rating === 'again' ? RETRY_MS :
    rating === 'hard' ? DAY_MS :
      GOOD_INTERVALS[Math.min(streak - 1, GOOD_INTERVALS.length - 1)] * DAY_MS
  return { reviews, lapses, streak, rating, reviewedAt: now, dueAt: now + wait }
}

export function isDue(record, now = Date.now()) {
  return !!record && record.dueAt <= now
}

/** A weak card is one last answered "again" or "hard". */
export function matchesStatus(record, status, now = Date.now()) {
  if (!STATUSES.has(status) || status === 'all') return true
  if (status === 'new') return !record
  if (status === 'due') return isDue(record, now)
  if (status === 'weak') return !!record && record.rating !== 'good'
  return !!record && record.rating === 'good'
}

export function reviewStats(entries, records, now = Date.now()) {
  let newCards = 0, due = 0, weak = 0, mastered = 0
  for (const item of entries) {
    const record = records[item.id]
    if (!record) newCards++
    if (isDue(record, now)) due++
    if (record?.rating && record.rating !== 'good') weak++
    if (record?.rating === 'good') mastered++
  }
  return { total: entries.length, newCards, reviewed: entries.length - newCards,
    due, weak, mastered }
}

/** Preserve the source's original ordering unless the user starts a shuffled session. */
export function filterFormulaEntries(entries, records, {
  query = '', chapter = 'all', kind = 'all', status = 'all', now = Date.now()
} = {}) {
  const needles = String(query).trim().toLocaleLowerCase().split(/\s+/u).filter(Boolean)
  return entries.filter(item => {
    if (chapter !== 'all' && item.chapter !== Number(chapter)) return false
    const numbered = /^式\s*\(/u.test(item.original_label)
    if (kind === 'numbered' && !numbered) return false
    if (kind === 'derived' && numbered) return false
    if (!matchesStatus(records[item.id], status, now)) return false
    const haystack = [
      item.name, item.note, item.latex, item.original_label,
      item.topic, String(item.printed_page), String(item.pdf_page),
      '第' + item.chapter + '章'
    ].join(' ').toLocaleLowerCase()
    return needles.every(word => haystack.includes(word))
  })
}

/** Unbiased Fisher-Yates; injectable RNG makes session selection testable. */
export function shuffleEntries(entries, rng = Math.random) {
  const result = [...entries]
  for (let i = result.length - 1; i > 0; --i) {
    const j = Math.min(i, Math.max(0, Math.floor(rng() * (i + 1))))
    ;[result[i], result[j]] = [result[j], result[i]]
  }
  return result
}

export function selectSession(entries, size, shuffle = true, rng = Math.random) {
  const count = Math.min(entries.length, Math.max(1, Number(size) || 10))
  return (shuffle ? shuffleEntries(entries, rng) : [...entries]).slice(0, count)
}

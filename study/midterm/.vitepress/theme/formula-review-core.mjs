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


/** The active session is stored separately from per-formula review history. */
export const SESSION_KEY = 'hspice:formula-session:v1'
export const SESSION_FORMAT = 'hspice-formula-session-v1'
export const MAX_BACKUP_BYTES = 250_000
export const MAX_SESSION_BYTES = 24_000

/**
 * Prioritise genuinely due reviews, then unstudied material, then optional
 * early review. Randomness affects only equal-priority cards.
 * Never mutate the source-index order or the review-record object.
 */
export function selectPrioritizedSession(entries, records, size, now = Date.now(), rng = Math.random) {
  function priority(entry) {
    const record = records[entry.id]
    if (record && isDue(record, now) && record.rating !== 'good') return 0
    if (record && isDue(record, now)) return 1
    if (!record) return 2
    if (record.rating !== 'good') return 3
    return 4
  }
  const ordered = shuffleEntries(entries, rng).sort((a, b) => {
    const difference = priority(a) - priority(b)
    if (difference) return difference
    const first = records[a.id], second = records[b.id]
    // Oldest overdue work first, within either due category.
    if (first && second && isDue(first, now) && isDue(second, now)) {
      return first.dueAt - second.dueAt
    }
    return 0
  })
  return selectSession(ordered, size, false)
}

/** Persist only the minimum information required to resume a practice round. */
export function encodeSession(session) {
  return JSON.stringify({ format: SESSION_FORMAT, session })
}

/**
 * A corrupt, stale or foreign session must never expose a formula not in the
 * current verified index. The caller may show a resume control if non-null.
 */
export function decodeSession(raw, validIds) {
  if (typeof raw !== 'string' || raw.length > MAX_SESSION_BYTES) return null
  let data
  try { data = JSON.parse(raw) } catch { return null }
  if (data?.format !== SESSION_FORMAT || !data.session) return null
  const session = data.session
  if (!Array.isArray(session.ids) || session.ids.length < 1 ||
      session.ids.length > validIds.length ||
      !session.ids.every(x => typeof x === 'string')) return null
  const allowed = new Set(validIds)
  if (session.ids.some(id => !allowed.has(id)) ||
      new Set(session.ids).size !== session.ids.length) return null
  const cursor = session.cursor
  if (!Number.isInteger(cursor) || cursor < 0 || cursor >= session.ids.length ||
      typeof session.revealed !== 'boolean') return null
  const ratings = session.ratings
  if (!ratings || typeof ratings !== 'object') return null
  const keys = ['again', 'hard', 'good', 'skipped']
  if (!keys.every(k => Number.isInteger(ratings[k]) &&
      ratings[k] >= 0 && ratings[k] <= cursor)) return null
  if (keys.reduce((n, k) => n + ratings[k], 0) !== cursor) return null
  if (!isFiniteNonNegative(session.updatedAt)) return null
  return {
    ids: [...session.ids], cursor, revealed: session.revealed,
    ratings: Object.fromEntries(keys.map(k => [k, ratings[k]])),
    updatedAt: session.updatedAt
  }
}

/**
 * Portable JSON backups use the existing review format, not a second source
 * of formula content. Newer reviewedAt wins; equal timestamps keep local data.
 */
export function mergeProgressBackup(raw, validIds, current = {}) {
  if (typeof raw !== 'string' || raw.length > MAX_BACKUP_BYTES) {
    throw new Error('文件不是有效的复习记录，或体积过大')
  }
  let payload
  try { payload = JSON.parse(raw) } catch { throw new Error('JSON 文件无法解析') }
  if (payload?.format !== STORAGE_FORMAT || !payload.records ||
      typeof payload.records !== 'object' || Array.isArray(payload.records)) {
    throw new Error('复习记录格式不匹配')
  }
  const incoming = decodeProgress(raw, validIds)
  const merged = { ...current }
  let added = 0, newer = 0, kept = 0
  for (const [id, record] of Object.entries(incoming)) {
    if (!merged[id]) {
      merged[id] = record
      added++
    } else if (record.reviewedAt > merged[id].reviewedAt) {
      merged[id] = record
      newer++
    } else {
      kept++
    }
  }
  return {
    records: merged, added, newer, kept,
    ignored: Object.keys(payload.records).length - Object.keys(incoming).length
  }
}

/** Client-side download payload; no network upload or account required. */
export function makeProgressBackup(records, now = Date.now()) {
  return JSON.stringify({
    format: STORAGE_FORMAT, exportedAt: now, records
  }, null, 2)
}

import assert from 'node:assert/strict'
import { test } from 'node:test'

const BASE_URL = process.env.BASE_URL ?? 'http://127.0.0.1:3000'

async function getPage(path) {
  const response = await fetch(new URL(path, BASE_URL))
  return { response, html: await response.text() }
}

test('Given retained portfolio routes, When fetched, Then they return 200', async () => {
  for (const path of ['/', '/projects', '/experiences']) {
    const { response } = await getPage(path)
    assert.equal(response.status, 200, `${path} should remain available`)
  }
})

test('Given removed legal routes, When fetched, Then they return 404', async () => {
  for (const path of ['/legal', '/privacy-policy', '/terms-of-service', '/compliance', '/data-deletion']) {
    const { response } = await getPage(path)
    assert.equal(response.status, 404, `${path} should be removed`)
  }
})

test('Given future-removed mockup routes, When fetched, Then they return 404', async () => {
  for (const path of ['/mockups', '/mockups/evidence-led', '/mockups/quiet-systems', '/mockups/refined-technical']) {
    const { response } = await getPage(path)
    assert.equal(response.status, 404, `${path} should be removed`)
  }
})

test('Given homepage HTML, When rendered, Then introduction is complete immediately and legacy markers are absent', async () => {
  const { response, html } = await getPage('/')
  assert.equal(response.status, 200)

  for (const marker of [
    'Hello World!, My name is Andra Satria.',
    'Now working remotely at',
    'Jitera',
    'Senior Full Stack Developer',
    'I am a software engineer with',
    'experience in crafting robust web applications.',
    'Building products from 0 to 1.'
  ]) {
    assert.ok(html.includes(marker), `homepage should contain ${marker}`)
  }

  for (const marker of ['terminal', 'typewriter', 'devicon', 'Konami']) {
    assert.ok(!html.includes(marker), `homepage should exclude ${marker}`)
  }
})

test('Given projects HTML, When rendered, Then it contains current work facts only', async () => {
  const { response, html } = await getPage('/projects')
  assert.equal(response.status, 200)

  for (const fact of [
    'Now Building',
    'Yifa',
    'Your Financial Assistant',
    'Coming soon',
    'A privacy-first personal finance tracker with AI-powered insights that helps users understand spending and build healthier financial habits without handing over bank credentials.',
    'Kotlin',
    'Android',
    'Trade Bot',
    'Algorithmic trading, on Telegram',
    'Private project',
    'A trading bot with a Telegram interface',
    'Python',
    'Telegram API'
  ]) {
    assert.ok(html.includes(fact), `projects should contain ${fact}`)
  }

  assert.match(html, /<a\b[^>]*\bhref="https:\/\/yifa\.id"[^>]*>/, 'projects should link to yifa.id')

  for (const marker of ['Selected Works', 'andrasat.com', 'aoc']) {
    assert.ok(!html.includes(marker), `projects should exclude ${marker}`)
  }
})

test('Given experiences HTML, When rendered, Then companies appear in current-to-old order', async () => {
  const { response, html } = await getPage('/experiences')
  assert.equal(response.status, 200)

  let previousIndex = -1
  for (const company of ['Jitera', 'Base', 'Lifepal', 'YouExpress', 'RebelWorks']) {
    const index = html.indexOf(company)
    assert.notEqual(index, -1, `experiences should contain ${company}`)
    assert.ok(index > previousIndex, `${company} should follow prior experience`)
    previousIndex = index
  }
})

test('Given retained production HTML, When rendered, Then excluded design markers are absent', async () => {
  for (const path of ['/', '/projects', '/experiences']) {
    const { response, html } = await getPage(path)
    assert.equal(response.status, 200)
    for (const marker of ['Merriweather', 'Red Hat', 'mockup-', 'font-mono', 'contact.init', '// andrasat']) {
      assert.ok(!html.includes(marker), `${path} should exclude ${marker}`)
    }
  }
})

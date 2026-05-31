export default defineEventHandler((event) => {
  const hostHeader = getRequestHost(event, { xForwardedHost: true })

  if (!hostHeader) {
    return
  }

  const host = hostHeader.split(':')[0].toLowerCase()

  if (host !== 'legal.andrasat.com') {
    return
  }

  const { pathname } = getRequestURL(event)

  if (pathname === '/' || pathname === '/index.html') {
    return sendRedirect(event, '/legal', 302)
  }

  const legalPaths = new Set([
    '/legal',
    '/privacy-policy',
    '/terms-of-service',
    '/compliance',
    '/data-deletion'
  ])

  if (legalPaths.has(pathname)) {
    return
  }

  if (
    pathname.startsWith('/_nuxt') ||
    pathname.startsWith('/api') ||
    pathname === '/favicon.ico'
  ) {
    return
  }

  return sendRedirect(event, '/legal', 302)
})

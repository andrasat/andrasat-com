import path from 'node:path'
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  alias: {
    '~': path.resolve(__dirname),
    '@assets': path.resolve(__dirname, 'assets'),
    '@components': path.resolve(__dirname, 'components')
  },
  css: ['~/assets/css/sanitize.css', '~/assets/css/tailwind.css'],
  modules: [
    '@nuxtjs/eslint-module',
    [
      '@nuxtjs/google-fonts',
      {
        families: {
          Comfortaa: [400, 700],
          'Red+Hat+Mono': [400]
        },
        display: 'swap',
        subsets: 'latin'
      }
    ],
    '@nuxtjs/tailwindcss',
    'nuxt-icons'
  ]
})

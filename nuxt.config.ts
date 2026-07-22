import path from 'node:path'
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  app: {
    head: {
      link: [
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'apple-touch-icon', sizes: '180x180', href: '/apple-touch-icon.png' }
      ]
    }
  },

  alias: {
    '~': path.resolve(__dirname),
    '@assets': path.resolve(__dirname, 'assets'),
    '@components': path.resolve(__dirname, 'components')
  },

  css: ['~/assets/css/sanitize.css', '~/assets/css/tailwind.css'],

  modules: [
    '@nuxt/eslint',
    [
      '@nuxtjs/google-fonts',
      {
        families: {
          Commissioner: [400, 500, 600, 700]
        },
        display: 'swap',
        subsets: ['latin']
      }
    ],
    '@nuxtjs/tailwindcss'
  ],

  compatibilityDate: '2024-08-31'
})

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  css: ['~/assets/css/sanitize.css', '~/assets/css/tailwind.css'],
  modules: [
    '@nuxtjs/eslint-module',
    [
      '@nuxtjs/tailwindcss',
      {
        injectPosition: {
          after: 'assets/css/sanitize.css'
        }
      }
    ]
  ]
})
